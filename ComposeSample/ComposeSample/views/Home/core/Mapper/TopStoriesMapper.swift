//
//  TopStoriesMapper.swift
//  ComposeSample
//
//  Created by Sahabe.Alam on 11/09/21.
//

import Foundation
import ComposableArchitecture
func topStoriesMapper(homeScreenComponent: MyComponent) -> HomepageMiddleNineStoriesAndFivePicsState {
    switch homeScreenComponent {
        case .TopStories(let uuis, var components):
            if components.count > 0, let firstItem = components.first {
                let topItem = CardTopViewState(id: firstItem.nid.toInt() , imageURL: firstItem.image_url ?? "", title: firstItem.title, brief: firstItem.description ?? "", overlayText: firstItem.title, type: .article, authorBookmarkShareState: getAuthor(firstItem: firstItem))
                components.removeFirst()
              let com =  Array(components.prefix(8))
                let top = HomepageMiddleNineStoriesAndFivePicsState(id: uuis, topStory: topItem, stories: mapItemsToState(items: com, storyCounr: StoryCount.middle9s5p(8, 4)))
                return top
            }
            
            
        default:
            break
    }
    return HomepageMiddleNineStoriesAndFivePicsState(id: "", topStory:  CardTopViewState(id: 0 , imageURL:  "", title: "", brief: "", overlayText: "", type: .article, authorBookmarkShareState: AuthorTimeBookmarkState(authorName: "", since: "", isBookMarked: false, videoDuration: "", id: 0, type: .article)))
}


func mapItemsToState(items: [Article], storyCounr: StoryCount)-> IdentifiedArrayOf<CardItemState> {
    let cardItems = IdentifiedArrayOf<CardItemState>(
        uniqueElements: items.enumerated().map { (index, item) in
            CardItemState(id: item.nid.toInt(), imageUrl: item.image_url ?? "", imageItemState: withOrWithoutImage(index: index, url: item.image_url.or("")), title: item.title, description: item.description ?? "", type: item.contentType, isDividerShow: true, authorBookmarkShareState: getAuthor(firstItem: item))
        }
    )
    return cardItems
}
func withOrWithoutImage(index:Int, url: String) -> ImageItemState{
    switch index {
        case 0...3:
            return ImageItemState.Image(url)
        default:
            return ImageItemState.NoImage
    }
}


func getAuthor(firstItem: Article) -> AuthorTimeBookmarkState {
    var author = AuthorTimeBookmarkState(authorName: "", since: "", isBookMarked: false, videoDuration: "", id: 0, type: .article)
    if let kAuthor = firstItem.author_detail, !kAuthor.name.isNilOrEmpty {
        author.authorName = kAuthor.name ?? ""
    }
    if let video = firstItem.video {
        author.id = firstItem.nid.toInt()
        author.since = firstItem.release_date ?? ""
        author.videoDuration = video.duration
        author.type = .video
    }
    return author
}



enum StoryCount {
    case middle9s5p(Int,Int)
}
