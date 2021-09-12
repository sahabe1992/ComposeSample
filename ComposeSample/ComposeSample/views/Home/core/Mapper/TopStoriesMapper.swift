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
                let top = HomepageMiddleNineStoriesAndFivePicsState(id: uuis, topStory: topItem, stories: mapItemsToState(items: components))
                return top
            }
            
            
        default:
            break
    }
    return HomepageMiddleNineStoriesAndFivePicsState(id: "", topStory:  CardTopViewState(id: 0 , imageURL:  "", title: "", brief: "", overlayText: "", type: .article, authorBookmarkShareState: AuthorTimeBookmarkState(authorName: "", since: "", isBookMarked: false, videoDuration: "", id: 0, type: .article)))
}


func mapItemsToState(items: [Article])-> IdentifiedArrayOf<CardItemState> {
    let cardItems = IdentifiedArrayOf<CardItemState>(
        uniqueElements: items.map {
            CardItemState(id: $0.nid.toInt(), imageUrl: $0.image_url ?? "", imageItemState: ImageItemState.NoImage, title: $0.title, description: $0.description ?? "", type: $0.contentType, isDividerShow: true, authorBookmarkShareState: getAuthor(firstItem: $0))
        }
    )
    return cardItems
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
