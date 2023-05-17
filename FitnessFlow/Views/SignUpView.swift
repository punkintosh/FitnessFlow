import UIKit
import SnapKit

class SignUpView: UIView {
    
    let authHeader = AuthHeader()

    let firstNameLabel: UILabel = createLabel(text: "First Name")
    let lastNameLabel: UILabel = createLabel(text: "Last Name")
    let emailLabel: UILabel = createLabel(text: "Email")
    let passwordLabel: UILabel = createLabel(text: "Password")
    let confirmPasswordLabel: UILabel = createLabel(text: "Confirm Password")
    
    let firstNameTextField: UITextField = createTextField(placeholder: "First Name")
    let lastNameTextField: UITextField = createTextField(placeholder: "Last Name")
    let emailTextField: UITextField = createTextField(placeholder: "Email")
    let passwordTextField: UITextField = createTextField(placeholder: "Password")
    let confirmPasswordTextField: UITextField = createTextField(placeholder: "Confirm Password")
    
    let signUpButton: PrimaryButton = {
        let button = PrimaryButton(title: "Sign Up")
        return button
    }()
    
    let switchLoginButton: TextButton = {
        let button = TextButton(text: "Switch to Login")
        return button
    }()


    init() {
        super.init(frame: .zero)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        backgroundColor = AppThemeData.colorSecondaryWhite
        
        addSubview(authHeader)
        addSubview(firstNameLabel)
        addSubview(firstNameTextField)
        addSubview(lastNameLabel)
        addSubview(lastNameTextField)
        addSubview(emailLabel)
        addSubview(emailTextField)
        addSubview(passwordLabel)
        addSubview(passwordTextField)
        addSubview(confirmPasswordLabel)
        addSubview(confirmPasswordTextField)
        addSubview(signUpButton)
        addSubview(switchLoginButton)
        
        
        authHeader.configure(labelText: "Sign Up", imageName: "logo_l.png")
        
        authHeader.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.leading.trailing.equalToSuperview().inset(8)
            make.height.equalTo(40)
        }
        
        firstNameLabel.snp.makeConstraints { make in
            make.top.equalTo(authHeader.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(20)
        }
        
        firstNameTextField.snp.makeConstraints { make in
            make.top.equalTo(firstNameLabel.snp.bottom).offset(8)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(40)
        }
        
        lastNameLabel.snp.makeConstraints { make in
            make.top.equalTo(firstNameTextField.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(20)
        }
        
        lastNameTextField.snp.makeConstraints { make in
            make.top.equalTo(lastNameLabel.snp.bottom).offset(8)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(40)
        }
        
        emailLabel.snp.makeConstraints { make in
            make.top.equalTo(lastNameTextField.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(20)
        }
        
        emailTextField.snp.makeConstraints { make in
            make.top.equalTo(emailLabel.snp.bottom).offset(8)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(40)
        }
        
        passwordLabel.snp.makeConstraints { make in
            make.top.equalTo(emailTextField.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(20)
        }
        
        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(passwordLabel.snp.bottom).offset(8)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(40)
        }
        
        confirmPasswordLabel.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(20)
        }
        
        confirmPasswordTextField.snp.makeConstraints { make in
            make.top.equalTo(confirmPasswordLabel.snp.bottom).offset(8)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(40)
        }
        
        signUpButton.snp.makeConstraints { make in
            make.top.equalTo(confirmPasswordTextField.snp.bottom).offset(32)
            make.centerX.equalToSuperview()
            make.width.equalTo(200)
            make.height.equalTo(50)
        }
        
        switchLoginButton.snp.makeConstraints { make in
            make.top.equalTo(signUpButton.snp.bottom).offset(2)
            make.centerX.equalToSuperview()
            make.width.equalTo(200)
            make.height.equalTo(50)
        }
    }
    
    private static func createLabel(text: String) -> UILabel {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 16)
        label.text = text
        return label
    }
    
    private static func createTextField(placeholder: String) -> UITextField {
        let textField = UITextField()
        textField.placeholder = placeholder
        textField.borderStyle = .roundedRect
        return textField
    }
}
