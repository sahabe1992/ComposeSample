//
//  Repository.swift
//  CcomposeAPISample
//
//  Created by Srijan on 27/08/21.
//

import Foundation
import ComposableArchitecture

class LandingPageRepository {
    func getAll() -> Effect<[LandingModelComponent], ProviderError>  {
        Provider.shared.getLandingPage().map({res -> [LandingModelComponent] in
            return res.result.layout.components
        }).eraseToEffect()
    }
    
    func getComponentData(lazyCompo: LazyComponent) -> Effect<MyComponent, ProviderError>{
        Provider.shared.getLandingComponent(id: lazyCompo.uuid, viewMode: lazyCompo.viewMode).map({res -> MyComponent in
            if lazyCompo.type == .spotlight {
                return MyComponent.spotlight(res.result?.id ?? "", res.result?.image_media_mobile ?? "", CTAData(viewMoreTitle: res.result?.view_more_title ?? "", viewMoreUrl: res.result?.view_more_url ?? "", viewMoreId: res.result?.view_more_url_field_id ?? "", viewMoreType: res.result?.view_more_url_field_type ?? ""))
            } else if(lazyCompo.viewMode == ViewModeType.middle9s5p.rawValue) {
                return MyComponent.TopStories(lazyCompo.uuid, res.result?.data ?? [])
            } else {
                return .other
            }
            
        }).eraseToEffect()
    }
}
