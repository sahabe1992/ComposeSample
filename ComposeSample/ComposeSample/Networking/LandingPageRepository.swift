//
//  Repository.swift
//  CcomposeAPISample
//
//  Created by Srijan on 27/08/21.
//

import Foundation
import ComposableArchitecture

class LandingPageRepository {
    func getLandingPage() -> Effect<[LandingModelComponent], ProviderError>  {
        Provider.shared.getLandingPage().map({res -> [LandingModelComponent] in
            return res.result.layout.components
        }).eraseToEffect()
    }
    
    func getComponentData(lazyCompo: LazyComponent) -> Effect<MyComponent, ProviderError>{
        Provider.shared.getLandingComponent(id: lazyCompo.uuid, viewMode: lazyCompo.vMode).map({res -> MyComponent in
            switch (lazyCompo.viewMode, lazyCompo.type) {
                case (.middle9s5p,.dynamicListing):
                    return MyComponent.TopStories(lazyCompo.uuid, res.result?.data ?? [])
                case (.full, .spotlight):
                    return MyComponent.spotlight(res.result?.id ?? "", res.result?.image_media_mobile ?? "", CTAData(viewMoreTitle: res.result?.view_more_title ?? "", viewMoreUrl: res.result?.view_more_url ?? "", viewMoreId: res.result?.view_more_url_field_id ?? "", viewMoreType: res.result?.view_more_url_field_type ?? ""))
                default:
                    return .other
            }
            
        }).eraseToEffect()
    }
}
