import UIKit

class CourseDetailsVC: UIViewController {
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(CourseDetailsTVC.self, forCellReuseIdentifier: CourseDetailsTVC.identifier)
        return tableView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        view.addSubview(tableView)
        
        let headerView = CourseDetailsTableHeaderView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 550))
        
        tableView.tableHeaderView = headerView
        tableView.delegate = self
        tableView.dataSource = self
        
        configureNavigationBar()
    }
    
    
    private func configureNavigationBar() {
        title = "Course details"
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
}


extension CourseDetailsVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CourseDetailsTVC.identifier, for: indexPath) as? CourseDetailsTVC else { return UITableViewCell() }
        
        cell.textLabel?.text = "Hello Baqlajon"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
}
