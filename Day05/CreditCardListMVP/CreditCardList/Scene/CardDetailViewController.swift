//
//  CardDetailViewController.swift
//  CreditCardList
//
//  Created by kid cherish on 2023/02/09.
//

import UIKit
import Lottie

final class CardDetailViewController: UIViewController {
    private var presenter: CardDetailPresenter!
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 20.0
        
        return stackView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = """
                    신용카드 쓰면
                    0만원 드려요
                    """
        label.font = .systemFont(ofSize: 28.0, weight: .heavy)
        label.textColor = .darkGray
        label.numberOfLines = 0
        label.textAlignment = .left
        
        return label
    }()
    
    private lazy var lottieView: AnimationView = {
        let animationView = AnimationView(name: "money")
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .loop
        
        return animationView
    }()
    
    private lazy var periodStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fill
        stackView.spacing = 30.0
        
        return stackView
    }()
    
    private lazy var subLabel1: UILabel = {
        let label = UILabel()
        label.text = "주는 혜택"
        label.font = .systemFont(ofSize: 17.0, weight: .bold)
        label.setContentHuggingPriority(UILayoutPriority(1000), for: .horizontal)
        label.setContentCompressionResistancePriority(UILayoutPriority(1000), for: .horizontal)
        
        return label
    }()
    
    private lazy var periodLabel: UILabel = {
        let label = UILabel()
        label.text = "혜택 없음"
        label.font = .systemFont(ofSize: 17.0)
        label.textAlignment = .left
        label.setContentHuggingPriority(UILayoutPriority(250), for: .horizontal)
        label.setContentCompressionResistancePriority(UILayoutPriority(250), for: .horizontal)
        
        return label
    }()
    
    private lazy var conditionStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fill
        stackView.spacing = 30.0
        
        return stackView
    }()
    
    private lazy var subLabel2: UILabel = {
        let label = UILabel()
        label.text = "참여 조건"
        label.font = .systemFont(ofSize: 17.0, weight: .bold)
        label.setContentHuggingPriority(UILayoutPriority(1000), for: .horizontal)
        label.setContentCompressionResistancePriority(UILayoutPriority(1000), for: .horizontal)
        
        return label
    }()
    
    private lazy var conditionLabel: UILabel = {
        let label = UILabel()
        label.text = "조건 없음"
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 17.0)
        label.textAlignment = .left
        label.setContentHuggingPriority(UILayoutPriority(250), for: .horizontal)
        label.setContentCompressionResistancePriority(UILayoutPriority(250), for: .horizontal)
        
        return label
    }()
    
    private lazy var benefitConditionStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fill
        stackView.spacing = 30.0
        
        return stackView
    }()
    
    private lazy var subLabel3: UILabel = {
        let label = UILabel()
        label.text = "혜택 조건"
        label.font = .systemFont(ofSize: 17.0, weight: .bold)
        label.setContentHuggingPriority(UILayoutPriority(1000), for: .horizontal)
        label.setContentCompressionResistancePriority(UILayoutPriority(1000), for: .horizontal)
        
        return label
    }()
    
    private lazy var benefitConditionLabel: UILabel = {
        let label = UILabel()
        label.text = "조건 없음"
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 17.0)
        label.textAlignment = .left
        label.setContentHuggingPriority(UILayoutPriority(250), for: .horizontal)
        label.setContentCompressionResistancePriority(UILayoutPriority(250), for: .horizontal)
        
        return label
    }()
    
    private lazy var benefitDetailStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fill
        stackView.spacing = 30.0
        
        return stackView
    }()
    
    private lazy var subLabel4: UILabel = {
        let label = UILabel()
        label.text = "받는 혜택"
        label.font = .systemFont(ofSize: 17.0, weight: .bold)
        label.setContentHuggingPriority(UILayoutPriority(1000), for: .horizontal)
        label.setContentCompressionResistancePriority(UILayoutPriority(1000), for: .horizontal)
        
        return label
    }()
    
    private lazy var benefitDetailLabel: UILabel = {
        let label = UILabel()
        label.text = "혜택 없음"
        label.font = .systemFont(ofSize: 17.0)
        label.textAlignment = .left
        label.setContentHuggingPriority(UILayoutPriority(250), for: .horizontal)
        label.setContentCompressionResistancePriority(UILayoutPriority(250), for: .horizontal)
        
        return label
    }()
    
    private lazy var benefitDateStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fill
        stackView.spacing = 30.0
        
        return stackView
    }()
    
    private lazy var subLabel5: UILabel = {
        let label = UILabel()
        label.text = "받는 날짜"
        label.font = .systemFont(ofSize: 17.0, weight: .bold)
        label.setContentHuggingPriority(UILayoutPriority(1000), for: .horizontal)
        label.setContentCompressionResistancePriority(UILayoutPriority(1000), for: .horizontal)
        
        return label
    }()
    
    private lazy var benefitDateLabel: UILabel = {
        let label = UILabel()
        label.text = "2021.01.01"
        label.font = .systemFont(ofSize: 17.0)
        label.textAlignment = .left
        label.setContentHuggingPriority(UILayoutPriority(250), for: .horizontal)
        label.setContentCompressionResistancePriority(UILayoutPriority(250), for: .horizontal)
        
        return label
    }()
    
    init(promotionDetail: PromotionDetail) {
        super.init(nibName: nil, bundle: nil)
        
        presenter = CardDetailPresenter(viewController: self, promotionDetail: promotionDetail)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        presenter.viewWillAppear()
    }
}

extension CardDetailViewController: CardDetailProtocol {
    func setupNavigationBar() {
        title = "카드 혜택 상세"
    }
    
    func setupLayout() {
        view.backgroundColor = .systemBackground
        
        [
            subLabel1,
            periodLabel
        ]
            .forEach { periodStackView.addArrangedSubview($0) }
        
        [
            subLabel2,
            conditionLabel
        ]
            .forEach { conditionStackView.addArrangedSubview($0) }
        
        [
            subLabel3,
            benefitConditionLabel
        ]
            .forEach { benefitConditionStackView.addArrangedSubview($0) }
        
        [
            subLabel4,
            benefitDetailLabel
        ]
            .forEach { benefitDetailStackView.addArrangedSubview($0) }
        
        [
            subLabel5,
            benefitDateLabel
        ]
            .forEach { benefitDateStackView.addArrangedSubview($0) }
        
        [
            titleLabel,
            lottieView,
            periodStackView,
            conditionStackView,
            benefitConditionStackView,
            benefitDetailStackView,
            benefitDateStackView
        ]
            .forEach { stackView.addArrangedSubview($0) }
        
        view.addSubview(stackView)
        
        lottieView.snp.makeConstraints {
            $0.height.equalTo(200.0)
        }
        
        stackView.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(20.0)
        }
    }
    
    func playLottieView() {
        lottieView.play()
    }
    
    func setupText(promotionDetail: PromotionDetail) {
        titleLabel.text = """
            \(promotionDetail.companyName)카드 쓰면
            \(promotionDetail.amount)만원 드려요
            """
        
        periodLabel.text = promotionDetail.period
        conditionLabel.text = promotionDetail.condition
        benefitConditionLabel.text = promotionDetail.benefitCondition
        benefitDetailLabel.text = promotionDetail.benefitDetail
        benefitDateLabel.text = promotionDetail.benefitDate
    }
}
