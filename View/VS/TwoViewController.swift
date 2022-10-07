import UIKit

struct ModelData {
    var icon: UIImage
    var title: String
    var values: String
    var pen: UIImage
}

class TwoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
        view.backgroundColor = UIColor(named: "mySert")
        dailyPlanCollectionView.dataSource = self
        dailyPlanCollectionView.delegate = self
    }

    var dataArray:[ModelData] = [

        ModelData(icon: UIImage(named: "Water drunk")!  , title: "Water drunk"  , values: "0/2500 ml",       pen: UIImage(named: "pen")!),
        ModelData(icon: UIImage(named: "Steps")!        , title: "Steps"        , values: "4000/7000 steps", pen: UIImage(named: "pen")!),
        ModelData(icon: UIImage(named: "Fasting days")! , title: "Fasting days" , values: "8 days",          pen: UIImage(named: "pen")!),
        ModelData(icon: UIImage(named: "Weight")!       , title: "Weight"       , values: "84 kg",           pen: UIImage(named: "pen")!)
    ]

    //MARK: - Scroll
    let myScroll : UIScrollView = {
        let scroll = UIScrollView()
        scroll.translatesAutoresizingMaskIntoConstraints = false
        return scroll
    }()
    
    //MARK: - Button
    let myButton2 : UIButton = {
        let button = UIButton()
        button.setTitle("Start Time", for: .normal)
        button.layer.cornerRadius = 10
        button.titleLabel?.textColor = .white
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
        button.backgroundColor = .blue
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let myButton : UIButton = {
        let button = UIButton()
        button.setTitle("16:8 qwerty  ", for: .normal)
        button.tintColor = .blue
        button.layer.cornerRadius = 10
        button.setTitleColor(UIColor.blue, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
        button.layer.borderWidth = 0.8
        button.layer.borderColor = UIColor.blue.cgColor
        button.setImage(UIImage(systemName: "pencil"), for: .normal)
        button.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
        button.titleLabel?.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
        button.imageView?.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
        button.backgroundColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    //MARK: - UI
    
    let myLabel: UILabel = {
        let label = UILabel()
        label.text = "You're app"
        label.textColor = .black
        label.textAlignment = .center
        //label.font = UIFont(name: "Ubuntu Bold", size: 32)
        label.font = .boldSystemFont(ofSize: 32)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let myLabel2: UILabel = {
        let label = UILabel()
        label.text = "Today, 09:41"
        label.textColor = .blue
        label.backgroundColor = .clear
        //label.textAlignment = .center
        //label.font = UIFont(name: "Ubuntu Bold", size: 32)
        label.font = .boldSystemFont(ofSize: 17)
        
        return label
    }()
    
    let myLabel3: UILabel = {
        let label = UILabel()
        label.text = "Tomorrow, 09:41"
        label.textColor = .blue
        label.backgroundColor = .clear
        label.textAlignment = .center
        //label.font = UIFont(name: "Ubuntu Bold", size: 32)
        label.font = .boldSystemFont(ofSize: 17)
        
        return label
    }()

    private let stackView: UIStackView = { //вертикальный стак
        let stackView = UIStackView()
        stackView.alignment = .fill
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.backgroundColor = .clear
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let stackViewG: UIStackView = { // горизон стак лейблы
        let stackViewG = UIStackView()
        //        stackViewG.alignment = .fill
        stackViewG.axis = .horizontal
        stackViewG.spacing = 25
        stackViewG.backgroundColor = .clear

        stackViewG.translatesAutoresizingMaskIntoConstraints = false
        return stackViewG
    }()
    
    private let stackViewGo: UIStackView = { // горзионт стак кнопки
        let stackViewGo = UIStackView()
        stackViewGo.alignment = .fill
        stackViewGo.axis = .horizontal
        stackViewGo.spacing = 10
        stackViewGo.backgroundColor = .clear
        stackViewGo.distribution = .fillEqually
        stackViewGo.translatesAutoresizingMaskIntoConstraints = false
        return stackViewGo
    }()

    var dailyPlanLabel: UILabel = {
        var label = UILabel()
        label.text = "DAILY PLAN"
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 22)
        return label
    }()


    var viewTest: UIView = {
        var viewTest = UIView()
        viewTest.backgroundColor = .white
        return viewTest
    }()

    var testLabel: UILabel = {
        var label = UILabel()
        label.text = "Blood sugar levels rise"
        label.textColor =  UIColor(red: 0.471, green: 0.486, blue: 0.545, alpha: 1)
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.numberOfLines = 0
        return label
    }()

    var imageClock: UIImageView = {
        var imageClock = UIImageView()
        imageClock.image = UIImage(named: "clock")
        // imageClock.contentMode = .scaleToFill

        return imageClock
    }()

    var labelTime: UILabel = {
        var label = UILabel()
        label.text = "0-2/h"
        label.textColor = UIColor(red: 0.471, green: 0.486, blue: 0.545, alpha: 1)
        label.font = UIFont(name: "Ubuntu-Bold", size: 13)
        return label
    }()

    lazy var firstCirckle: UIImageView = {
        var imageFirst = UIImageView()
        imageFirst.image = UIImage(named: "doneImage")
        return imageFirst
    }()

    lazy var secondCircle: UIImageView = {
        setupCircleFailure()
    }()

    lazy var thirdCircle: UIImageView = {
        setupCircleFailure()
    }()

    lazy var fourthCircle: UIImageView = {
        setupCircleFailure()
    }()

    lazy var fifthCircle: UIImageView = {
        setupCircleFailure()
    }()

    lazy var sixthCircle: UIImageView = {
        setupCircleFailure()
    }()

    lazy var seventhCircle: UIImageView = {
        setupCircleFailure()
    }()

    lazy var eighthCircle: UIImageView = {
        setupCircleFailure()
    }()

    private func setupCircleFailure()->UIImageView{
        let imageSecond = UIImageView()
        imageSecond.image = UIImage(named: "failrureImage")
        imageSecond.translatesAutoresizingMaskIntoConstraints = false
        return imageSecond
    }

    var dailyPlanCollectionView: UICollectionView = {

        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical

        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.register(CellCollectionView.self, forCellWithReuseIdentifier: "cell")
        collection.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
        collection.layer.cornerRadius = collection.frame.width / 2

        return collection

    }()

    let shapeView = TimerCircularBarView()
    
    func setUpViews() {
        shapeView   .translatesAutoresizingMaskIntoConstraints = false
        myLabel2    .translatesAutoresizingMaskIntoConstraints = false
        myLabel3    .translatesAutoresizingMaskIntoConstraints = false
        //
        dailyPlanLabel          .translatesAutoresizingMaskIntoConstraints = false
        viewTest                .translatesAutoresizingMaskIntoConstraints = false
        testLabel               .translatesAutoresizingMaskIntoConstraints = false
        imageClock              .translatesAutoresizingMaskIntoConstraints = false
        labelTime               .translatesAutoresizingMaskIntoConstraints = false
        firstCirckle            .translatesAutoresizingMaskIntoConstraints = false
        dailyPlanCollectionView .translatesAutoresizingMaskIntoConstraints = false





        view.addSubview(myScroll)

        myScroll.addSubview(shapeView)
        myScroll.addSubview(myLabel)
        myScroll.addSubview(stackView)
        myScroll.addSubview(dailyPlanLabel)
        myScroll.addSubview(viewTest)
        myScroll.addSubview(dailyPlanCollectionView)

        // мето для view(аля первая ячейка)
        viewTest.addSubview(testLabel)
        viewTest.addSubview(imageClock)
        viewTest.addSubview(labelTime)
        viewTest.addSubview(firstCirckle)
        viewTest.addSubview(secondCircle)
        viewTest.addSubview(thirdCircle)
        viewTest.addSubview(fifthCircle)
        viewTest.addSubview(sixthCircle)
        viewTest.addSubview(seventhCircle)
        viewTest.addSubview(eighthCircle)

        stackView .addArrangedSubview(stackViewG)
        stackView .addArrangedSubview(stackViewGo)
        stackViewG.addArrangedSubview(myLabel2)
        stackViewG.addArrangedSubview(myLabel3)
        
        stackViewGo.addArrangedSubview(myButton)
        stackViewGo.addArrangedSubview(myButton2)
        
        
        let contentS = myScroll.contentLayoutGuide

        let constraint = [myScroll.topAnchor.constraint         (equalTo: view.topAnchor),
                          myScroll.leadingAnchor.constraint     (equalTo: view.leadingAnchor,   constant: 20),
                          myScroll.trailingAnchor.constraint    (equalTo: view.trailingAnchor,  constant: -20),
                          myScroll.bottomAnchor.constraint      (equalTo: view.bottomAnchor,    constant: -20),
                          
                          myLabel.topAnchor.constraint          (equalTo: view.topAnchor,       constant: 65),
                          myLabel.centerXAnchor.constraint      (equalTo: view.centerXAnchor),
                          myLabel.bottomAnchor.constraint       (equalTo: shapeView.topAnchor, constant: -35),
                          
                          shapeView.heightAnchor.constraint     (equalTo: shapeView.widthAnchor),
                          shapeView.topAnchor.constraint        (equalTo: myLabel.bottomAnchor, constant: 10),
                          shapeView.bottomAnchor.constraint     (equalTo: stackView.topAnchor,  constant: -35),
                          shapeView.centerXAnchor.constraint    (equalTo: view.centerXAnchor),
                          shapeView.widthAnchor.constraint      (equalTo: view.widthAnchor, multiplier: 0.6),
                          
                          stackView.topAnchor.constraint        (equalTo: shapeView.bottomAnchor,   constant: 35),
                          stackView.leadingAnchor.constraint    (equalTo: view.leadingAnchor,       constant: 25),
                          stackView.trailingAnchor.constraint   (equalTo: view.trailingAnchor,      constant: -25),
                          stackView.bottomAnchor.constraint     (equalTo: myScroll.bottomAnchor,     constant: -150),

                          stackViewGo.heightAnchor.constraint(equalToConstant: 52),

                          dailyPlanLabel.topAnchor.constraint       (equalTo: stackView.bottomAnchor,   constant: 16),
                          dailyPlanLabel.leadingAnchor.constraint   (equalTo: view.leadingAnchor,       constant: 20),
                          dailyPlanLabel.trailingAnchor.constraint  (equalTo: view.trailingAnchor,      constant: 20),

                          viewTest.topAnchor.constraint         (equalTo: dailyPlanLabel.bottomAnchor,   constant: 8),
                          viewTest.leadingAnchor.constraint     (equalTo: view.leadingAnchor,            constant: 18),
                          viewTest.trailingAnchor.constraint    (equalTo: view.trailingAnchor,           constant: 18),
                          viewTest.heightAnchor.constraint      (equalToConstant: 96),
                          viewTest.widthAnchor.constraint       (equalToConstant: 343),

                          testLabel.leadingAnchor.constraint  (equalTo: viewTest.leadingAnchor,     constant: 16),
                          testLabel.topAnchor.constraint      (equalTo: viewTest.topAnchor,         constant: 18.5),
                          testLabel.trailingAnchor.constraint (equalTo: imageClock.leadingAnchor,   constant: -20), // тут херню редакнуть
                          testLabel.bottomAnchor.constraint   (equalTo: viewTest.bottomAnchor,      constant: -62.5),

                          imageClock.topAnchor.constraint      (equalTo: viewTest.topAnchor,        constant: 13),
                          imageClock.trailingAnchor.constraint (equalTo: viewTest.trailingAnchor,   constant: -100),
                          imageClock.widthAnchor.constraint    (equalToConstant: 30),
                          imageClock.heightAnchor.constraint   (equalToConstant: 30),

                          labelTime.leadingAnchor.constraint    (equalTo: imageClock.trailingAnchor , constant: 8), // good
                          labelTime.topAnchor.constraint        (equalTo: viewTest.topAnchor,         constant: 18.50),
                          labelTime.trailingAnchor.constraint   (equalTo: viewTest.trailingAnchor,    constant: 16),

                          firstCirckle.leadingAnchor.constraint (equalTo: viewTest.leadingAnchor,   constant: 16),
                          firstCirckle.bottomAnchor.constraint  (equalTo: viewTest.bottomAnchor,    constant: -10.59),
                          firstCirckle.widthAnchor.constraint   (equalToConstant: 33),
                          firstCirckle.heightAnchor.constraint  (equalToConstant: 33),

                          secondCircle.leadingAnchor.constraint (equalTo: firstCirckle.trailingAnchor,  constant: 10),
                          secondCircle.bottomAnchor.constraint  (equalTo: viewTest.bottomAnchor,        constant: -10.59),
                          secondCircle.widthAnchor.constraint   (equalToConstant: 33),
                          secondCircle.heightAnchor.constraint  (equalToConstant: 33),

                          thirdCircle.leadingAnchor.constraint  (equalTo: secondCircle.trailingAnchor,   constant: 10),
                          thirdCircle.bottomAnchor.constraint   (equalTo: viewTest.bottomAnchor,         constant: -10.59),
                          thirdCircle.widthAnchor.constraint    (equalToConstant: 33),
                          thirdCircle.heightAnchor.constraint   (equalToConstant: 33),

                          fifthCircle.leadingAnchor.constraint  (equalTo: thirdCircle.trailingAnchor,   constant: 10),
                          fifthCircle.bottomAnchor.constraint   (equalTo: viewTest.bottomAnchor,        constant: -10.59),
                          fifthCircle.widthAnchor.constraint    (equalToConstant: 33),
                          fifthCircle.heightAnchor.constraint   (equalToConstant: 33),

                          sixthCircle.leadingAnchor.constraint  (equalTo: fifthCircle.trailingAnchor,   constant: 10),
                          sixthCircle.bottomAnchor.constraint   (equalTo: viewTest.bottomAnchor,        constant: -10.59),
                          sixthCircle.widthAnchor.constraint    (equalToConstant: 33),
                          sixthCircle.heightAnchor.constraint   (equalToConstant: 33),

                          seventhCircle.leadingAnchor.constraint    (equalTo: sixthCircle.trailingAnchor,   constant: 10),
                          seventhCircle.bottomAnchor.constraint     (equalTo: viewTest.bottomAnchor,        constant: -10.59),
                          seventhCircle.widthAnchor.constraint      (equalToConstant: 33),
                          seventhCircle.heightAnchor.constraint     (equalToConstant: 33),

                          eighthCircle.leadingAnchor.constraint     (equalTo: seventhCircle.trailingAnchor,     constant: 10),
                          eighthCircle.bottomAnchor.constraint      (equalTo: viewTest.bottomAnchor,            constant: -10.59),
                          eighthCircle.widthAnchor.constraint       (equalToConstant: 33),
                          eighthCircle.heightAnchor.constraint      (equalToConstant: 33),

                          dailyPlanCollectionView.leadingAnchor.constraint  (equalTo: view.leadingAnchor),
                          dailyPlanCollectionView.topAnchor.constraint      (equalTo: viewTest.bottomAnchor,constant: 50),
                          dailyPlanCollectionView.trailingAnchor.constraint (equalTo: view.trailingAnchor),
                          dailyPlanCollectionView.bottomAnchor.constraint   (equalTo: view.bottomAnchor)
                          
        ]
        NSLayoutConstraint.activate(constraint)
    }
}

extension TwoViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath)-> CGSize{
        CGSize(width: 342, height: 96)
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataArray.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CellCollectionView

        cell.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
        cell.layer.cornerRadius = 15

        cell.iconImage.image = dataArray[indexPath.row].icon
        cell.titileLabel.text = dataArray[indexPath.row].title
        cell.valueLabel.text = dataArray[indexPath.row].values
        cell.penImage.image = dataArray[indexPath.row].pen

        switch indexPath.row {
        case 0 :
            cell.titileLabel.textColor =  UIColor(red: 0.306, green: 0.292, blue: 1, alpha: 1)
        case 1:
            cell.titileLabel.textColor = UIColor(red: 1, green: 0.632, blue: 0.292, alpha: 1)
        case 2:
            cell.titileLabel.textColor =  UIColor(red: 0.292, green: 0.448, blue: 1, alpha: 1)
        case 3:
            cell.titileLabel.textColor = UIColor(red: 0.059, green: 0.742, blue: 0.086, alpha: 1)
        default:
            break
        }
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top:8, left: 5, bottom: 8, right: 5)
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("hello")
    }
}
