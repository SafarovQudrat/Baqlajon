import UIKit

class CourseDetailsVC: UIViewController {
    
    private var videoTableViewCellIsOn = true
    
    
    private let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(CourseDetailsVideoTableViewCell.self, forCellReuseIdentifier: CourseDetailsVideoTableViewCell.identifier)
        tableView.register(CourseDetailsReviewsTableViewCell.self, forCellReuseIdentifier: CourseDetailsReviewsTableViewCell.identifier)
        tableView.backgroundColor = UIColor.appColor(color: .background)
        
        return tableView
    }()
    
    
    private let startLessonAndWriteReviewButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Start Course", for: .normal)
        button.backgroundColor = UIColor.appColor(color: .mainBlue)
        button.titleLabel?.font = UIFont.appFont(ofSize: 16, weight: FontWeight.medium)
        button.setTitleColor(UIColor.white, for: .normal)
        button.layer.cornerRadius = 8
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(.none, action: #selector(btnTapped), for: .touchUpInside)
        return button
    }()
    var reviews:[CommentDM] = []
    var videos : [GetCourseDM] = []
    var course:String = ""
    var headerView = CourseDetailsTableHeaderView()
    var myC:((Bool) ->Void)?
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .appColor(color: .background)
        let ges = UISwipeGestureRecognizer(target: self, action: #selector(backtapped))
        ges.direction = .right
        view.addGestureRecognizer(ges)
        configureTableView()
        configureNavigationBar()
        configureConstraints()
        Loader.start()
        getAllVideo()
        
        print("Courses ========",course)
    }
    
    
    private func configureTableView() {
        view.addSubview(tableView)
        headerView = CourseDetailsTableHeaderView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 550))
        headerView.delegate = self
        
        tableView.tableHeaderView = headerView
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
    }
    
    
    private func configureNavigationBar() {
        title = "Course details"
        navigationItem.hidesBackButton = true
        navigationController?.navigationBar.update(backgroundColor: .appColor(color: .white))
        let leftBtn = UIBarButtonItem(image:UIImage(systemName: "chevron.left"), style: .done, target:self , action: #selector(backtapped) )
        navigationItem.leftBarButtonItem = leftBtn
        navigationItem.rightBarButtonItem?.tintColor =  .appColor(color: .black3)
        navigationItem.leftBarButtonItem?.tintColor = .appColor(color: .black1)
    }
    //    back Button
    @objc func backtapped(){
        myC?(true)
        self.navigationController?.popViewController(animated: true)
        
    }
    
    @objc func btnTapped() {
        if startLessonAndWriteReviewButton.titleLabel?.text == "Start Course" {
            let vc = VideoDetailsViewController()
            startCourse()
            self.navigationItem.backButtonTitle = ""
            if ((cache.string(forKey: "VIDEO_ID")?.isEmpty) != nil) {
                vc.videoID = videos.first?._id ?? ""
            }else {
                vc.videoID = cache.string(forKey: "VIDEO_ID")!
            }
            navigationController?.pushViewController(vc, animated: true)
            
        } else {
            let vc = ReviewVC()
            navigationItem.backButtonTitle = ""
            vc.courseID = videos.first?._id ?? ""
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    let refreshControl = UIRefreshControl()
    var timer:Timer?
    var time: Int = 1
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
        
        getAllVideo()
        refreshControl.addTarget(self, action: #selector(refresh), for: .valueChanged)
        tableView.refreshControl = refreshControl
    }
    
    override func viewWillAppear(_ animated: Bool) {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(action), userInfo: nil, repeats: true)
    }
    
    @objc func action () {
        if time <= 0 {
            timer?.invalidate()
            refreshControl.endRefreshing()
        }else {
            time = time - 1
        }
    }
    @objc func refresh() {
       
        getAllVideo()
        
        tableView.reloadData()
        refreshControl.endRefreshing()
    }
    
    
    
    private func configureConstraints() {
        view.addSubview(startLessonAndWriteReviewButton)
        NSLayoutConstraint.activate([
            startLessonAndWriteReviewButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            startLessonAndWriteReviewButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            startLessonAndWriteReviewButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -13),
            startLessonAndWriteReviewButton.heightAnchor.constraint(equalToConstant: 48)
        ])
    }
    
    
    
    
}

//MARK:  UITableViewDelegate, UITableViewDataSource
extension CourseDetailsVC: UITableViewDelegate, UITableViewDataSource {
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if videoTableViewCellIsOn { return videos.count } else { return reviews.count }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if videoTableViewCellIsOn {
            guard let videoCell = tableView.dequeueReusableCell(withIdentifier: CourseDetailsVideoTableViewCell.identifier, for: indexPath) as? CourseDetailsVideoTableViewCell else { return UITableViewCell() }
            videoCell.selectionStyle = .none
            videoCell.updateCell(data: videos[indexPath.row])
            return videoCell
            
        } else {
            guard let reviewsCell = tableView.dequeueReusableCell(withIdentifier: CourseDetailsReviewsTableViewCell.identifier, for: indexPath) as? CourseDetailsReviewsTableViewCell else {return UITableViewCell()}
            reviewsCell.selectionStyle = .none
            reviewsCell.updateCell(desc: reviews[indexPath.row])
            return reviewsCell
        }
        
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        if videoTableViewCellIsOn {
            let header = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 46))
            
            let titleLabel = UILabel()
            titleLabel.text = "Section 1 - Introduction"
            titleLabel.textColor = UIColor.appColor(color: Colors.gray1)
            titleLabel.font = UIFont.appFont(ofSize: 14, weight: FontWeight.medium)
            titleLabel.translatesAutoresizingMaskIntoConstraints = false
            
            let lessonTimeLabel = UILabel()
            lessonTimeLabel.text = "25 mins"
            lessonTimeLabel.textColor = UIColor.appColor(color: .mainBlue)
            lessonTimeLabel.font = UIFont.appFont(ofSize: 14, weight: FontWeight.medium)
            lessonTimeLabel.translatesAutoresizingMaskIntoConstraints = false
            
            header.addSubview(titleLabel)
            NSLayoutConstraint.activate([
                titleLabel.leadingAnchor.constraint(equalTo: header.leadingAnchor, constant: 16),
                titleLabel.centerYAnchor.constraint(equalTo: header.centerYAnchor)
            ])
            
            header.addSubview(lessonTimeLabel)
            NSLayoutConstraint.activate([
                lessonTimeLabel.trailingAnchor.constraint(equalTo: header.trailingAnchor, constant: -16),
                lessonTimeLabel.centerYAnchor.constraint(equalTo: header.centerYAnchor)
            ])
            
            return header
        }
        
        return nil
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        let result: CGFloat = videoTableViewCellIsOn ? 46 : 0
        return result
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if videoTableViewCellIsOn { return 100 } else { return tableView.rowHeight }
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if videoTableViewCellIsOn{
            let vc = VideoDetailsViewController()
            vc.videoID = self.videos[indexPath.row]._id
            navigationItem.backButtonTitle = ""
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
}

//MARK: CourseDetailsTableHeaderViewDelegate
extension CourseDetailsVC: CourseDetailsTableHeaderViewDelegate {
    func videosButtonDidTap() {
        videoTableViewCellIsOn = true
        tableView.reloadData()
        
        startLessonAndWriteReviewButton.setTitle("Start Course", for: .normal)
    }
    
    func reviewsButtonDidTap() {
        videoTableViewCellIsOn = false
        
        tableView.reloadData()
        
        startLessonAndWriteReviewButton.setTitle("Write a review", for: .normal)
    }
    
    
}

//MARK: API
extension CourseDetailsVC {
    func getAllVideo(){
        API.getCourseByID(id: course) { [self] data in
            Loader.stop()
            videos = data.freeVideos + data.videos
            reviews = data.comment
            headerView.numberOfVideosLabel.text = "\(data.info.videoCount) Videos"
            headerView.descriptionLabel.text = data.info.desc
            headerView.titleLabel.text = data.info.title
            headerView.numberOfReviews.text = "\(data.comment.count) Reviews"
            DispatchQueue.main.async {
                self.headerView.courseImageView.sd_setImage(with: URL(string: API.imgBaseURL + data.info.image))
                       }
           
            
            print("_ID = ",course)
            print("Videos = ",data)
            tableView.reloadData()
        }
    }
    func startCourse(){
        API.startCourse(id: course) { data in
            Loader.stop()
            if data.success {
                
            }else {
                Alert.showAlert(title: data.message, message: data.message, vc: self)
            }
        }
    }
    
    
    
    
    
}

