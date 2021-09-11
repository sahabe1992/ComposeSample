//
//  AppView.swift
//  itodayetp (iOS)
//
//  Created by Srijan on 19/08/21.
//

import SwiftUI
import ComposableArchitecture
struct AppView: View {
    let store: Store<AppState, AppAction>
    @State var currentTab: Tab
    var body: some View {
        WithViewStore(store) { viewStore in
            NavigationView{
                TabView(selection: $currentTab){
                    IfLetStore(
                        store.scope(state: \.home, action: AppAction.home),
                        then: HomeView.init(store:),
                      else: {
                        Text("Loading search results...")
                            .onAppear(perform: {
                                viewStore.send(AppAction.getLandingPage)
                            })
                      }
                    )
                        .tabItem{
//                            Image(currentTab == .home ? TabBarIconsName.homeActive : TabBarIconsName.homeInactive)
                            Text("HOME")
                        }
                        .tag(Tab.home)
                    
                    
                    SectionsView(store: self.store.scope(state: \.sections,action:AppAction.sections))
                        .tabItem{
//                            Image(currentTab == .sections ? TabBarIconsName.sectionsActive : TabBarIconsName.sectionsInactive)
                            Text("SECTIONS")
                        }
                        .tag(Tab.sections)
                    BookmarkView(store: self.store.scope(state: \.bookmark,action:AppAction.bookmark))
                        .tabItem{
//                            Image(currentTab == .bookmarks ? TabBarIconsName.bookmarkActive : TabBarIconsName.bookmarkInactive)
                            Text("BOOKMARKS")
                        }
                        .tag(Tab.bookmarks)
                    ProfileView(store: self.store.scope(state: \.profile,action:AppAction.profile))
                        .tabItem{
//                            Image(currentTab == .profile ? TabBarIconsName.profileActive : TabBarIconsName.profileInactive)
                            Text("YOU")
                        }
                        .tag(Tab.profile)
                        .navigationBarHidden(true)
                }
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        HStack {
                            Image("logo")
                        }
                    }
                }

            }.onAppear{
                UITabBar.appearance().barTintColor = UIColor(Color.appRed)
                UITabBar.appearance().isTranslucent = false
                UINavigationBar.appearance().barTintColor = .white
                UINavigationBar.appearance().isTranslucent = false
    //            UITabBar.appearance().unselectedItemTintColor = UIColor(Color.grayd5d5d5)
                UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor(Color.grayd5d5d5)], for: .normal)
                UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: .selected)


            }
        }
        
    }
}

//struct AppView_Previews: PreviewProvider {
//    static var previews: some View {
//        AppView(store: Store(initialState: AppState(activity: <#T##HomeViewState#>, search: <#T##SectionsViewState#>, profile: <#T##ProfileViewState#>), reducer: appReducer, environment: AppEnvironment.init()))
//    }
//}
