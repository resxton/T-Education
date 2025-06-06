import UIKit

final class MainViewController: UIViewController {

    // MARK: - Visual Components
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.backgroundColor = Consts.imageBackgroundColor
        return imageView
    }()
    
    private let brandNameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: Consts.smallFontSize, weight: .medium)
        label.textColor = Consts.brandNameLabelColor
        label.textAlignment = .left
        return label
    }()
    
    private let productNameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: Consts.mediumFontSize, weight: .regular)
        label.textColor = Consts.textColor
        label.textAlignment = .left
        return label
    }()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: Consts.largeFontSize, weight: .bold)
        label.textColor = Consts.textColor
        label.textAlignment = .left
        return label
    }()
    
    private let fullPriceLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: Consts.largeFontSize, weight: .bold)
        label.textAlignment = .left
        return label
    }()
    
    private let nextProductButton: UIButton = {
        let button = UIButton()
        button.setTitle(Consts.nextProductButtonTitle, for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: Consts.mediumFontSize, weight: .regular)
        button.backgroundColor = Consts.buttonBackgroundColor
        button.layer.cornerRadius = Consts.cornerRadius
        button.layer.masksToBounds = true
        button.addTarget(nil, action: #selector(showNextProduct), for: .touchUpInside)
        return button
    }()

    // MARK: - Private Properties
    
    private let productFactory: ProductFactoryProtocol

    // MARK: - Initializers
    
    init(productFactory: ProductFactoryProtocol) {
        self.productFactory = productFactory
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupConsraints()
        showFirstProduct()
    }
    
    // MARK: - Private Methods
    
    private func setupUI() {
        let views = [
            imageView,
            brandNameLabel,
            productNameLabel,
            priceLabel,
            fullPriceLabel,
            nextProductButton
        ]
        
        views.forEach {
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    private func setupConsraints() {
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            imageView.heightAnchor.constraint(equalToConstant: Consts.imageHeight),
            
            brandNameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Consts.margin),
            brandNameLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: Consts.margin),
            
            productNameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Consts.margin),
            productNameLabel.topAnchor.constraint(equalTo: brandNameLabel.bottomAnchor, constant: Consts.productTopMargin),
            
            priceLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Consts.margin),
            priceLabel.topAnchor.constraint(equalTo: productNameLabel.bottomAnchor, constant: Consts.margin),
            
            fullPriceLabel.leadingAnchor.constraint(equalTo: priceLabel.trailingAnchor, constant: Consts.fullPriceLeftMargin),
            fullPriceLabel.centerYAnchor.constraint(equalTo: priceLabel.centerYAnchor, constant: Consts.fullPriceYOffset),
            
            nextProductButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Consts.margin),
            nextProductButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Consts.margin),
            nextProductButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -Consts.buttonBottomMargin),
            nextProductButton.heightAnchor.constraint(equalToConstant: Consts.buttonHeight)
        ])
    }
    
    private func showFirstProduct() {
        let product = productFactory.loadFirstProduct()
        show(product: product)
    }
    
    @objc
    private func showNextProduct() {
        let product = productFactory.loadNextProduct()
        show(product: product)
    }
    
    private func show(product: Product) {
        guard let image = UIImage(named: product.imageName) else { return }
        
        UIView.transition(
            with: view,
            duration: Consts.animationDuration,
            options: .transitionCrossDissolve
        ) { [weak self] in
            guard let self else { return }
            imageView.image = image
            brandNameLabel.text = product.brand.uppercased()
            productNameLabel.text = product.name
            priceLabel.text = product.priceWithDiscount.formattedAsRussianCurrency()
            fullPriceLabel
                .setStrikethroughText(
                    product.fullPrice.formattedAsRussianCurrency(),
                    textColor: Consts.fullPriceLabelColor,
                    strikethroughWidth: Consts.strikethroughWidth
                )
        }
    }
}

// MARK: - MainViewController.Consts

private extension MainViewController {
    enum Consts {
        // MARK: - Colors
        static let brandNameLabelColor = UIColor(red: 131/255, green: 135/255, blue: 145/255, alpha: 1.0)
        static let fullPriceLabelColor = UIColor(white: 1, alpha: 0.3)
        static let textColor: UIColor = .white
        static let imageBackgroundColor: UIColor = .white
        static let buttonBackgroundColor: UIColor = .white

        // MARK: - Text
        static let nextProductButtonTitle = "Показать следующий товар"
        static let smallFontSize: CGFloat = 16
        static let mediumFontSize: CGFloat = 18
        static let largeFontSize: CGFloat = 22

        // MARK: - Layout
        static let margin: CGFloat = 16
        static let productTopMargin: CGFloat = 4
        static let fullPriceLeftMargin: CGFloat = 8
        static let fullPriceYOffset: CGFloat = 1
        static let buttonBottomMargin: CGFloat = 10
        static let buttonHeight: CGFloat = 57
        static let imageHeight: CGFloat = 440
        static let cornerRadius: CGFloat = 16

        // MARK: - Decorations
        static let strikethroughWidth: Int = 1

        // MARK: - Animation
        static let animationDuration: TimeInterval = 0.3
    }
}
