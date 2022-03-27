final class Lab5TableBuilder {
    func build(output: Lab5TableModuleOutput) -> UIViewController {
        let viewController = Lab5TableViewController()
        let presenter = Lab5TablePresenter()

        viewController.output = presenter
        presenter.view = viewController
        presenter.moduleOutput = output
        
        return viewController
    }
}