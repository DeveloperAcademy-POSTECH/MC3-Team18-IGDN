import UIKit


@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    static var vc: UINavigationController? = nil

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil
    ) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        
        var mapList: [CreativeMapModel]
        if let loadedMapList = UserDefaultsManager.loadCreativeMapsFromUserDefaults() {
            // 불러온 배열 사용
            mapList = loadedMapList
        } else {
            // 로드에 실패한 경우 또는 데이터가 없는 경우에 대한 처리
            // 기본값으로 초기화하거나 오류 처리를 할 수 있습니다.
            mapList = []
        }
        
        let viewController = CreateModeViewController(with: CreateModeViewModel(mapList: mapList))
        let navigationController = UINavigationController(rootViewController: viewController)
        navigationController.isNavigationBarHidden = true
        let homeVC = UINavigationController(rootViewController: ContentView().makeViewController())
        homeVC.navigationBar.isHidden = true
        AppDelegate.vc = homeVC
        
        
        window?.rootViewController = homeVC
        window?.makeKeyAndVisible()

        return true
    }
    
    func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
        // 세로방향 고정
        return UIInterfaceOrientationMask.portrait
    }

}
