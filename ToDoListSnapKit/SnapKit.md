# SnapKit

> **SnapKit이란?**
> 

<br>

코드 베이스로 UI를 작성하고 AutoLayout을 고려해야 할 때, 직관적이고 간편하게 작성할 수 있도록 하는 **오픈소스** Framework

- constraints 가독성 향상
- 관리 편의성

SnapKit을 사용해서 UI를 작성할 것이기 때문에 Storyboard가 필요없으므로 
- Main.storyboard 삭제
- Info.plist > Application Scene Mainfest > Storyboard name 삭제
- 프로젝트 > Main storyboard file base name 삭제

<br>

커스텀할 ```View Controller```를 ```initail View Controller```로 인지하도록 ```SceneDelegate```에서 설정

<br>

## Usage

<br>

> 참조  
> [SnapKit Github Document](https://snapkit.github.io/SnapKit/docs/)

<br>

- **offset() vs inset()**
 
    - offset: element와의 간격

    - inset: superview와의 간격

<br>

- **padding constraints**
    
    ```swift
    let box = UIView() //UIView 객체 생성
    superview.addSubview(box) //superview에 box 오브젝트 추가
    
    box.snp.makeConstraints { 
    	$0.top.equalTo(superview).offset(20)
    	$0.left.equalTo(superview).offset(20)  //leading
    	$0.bottom.equalTo(superview).offset(-20)
    	$0.right.equalTo(superview).offset(-20) //trailing
    }
    
    //bottom, right → 끝점에서 시작하기 때문에 -20
    ```
    
    or
    
    ```swift
    let box = UIView()
    superview.addSubview(box)
    
    box.snp.makeConstraints {
    	$0.edges.equalTo(superview).inset(UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20))
    ```
    
    `.equalTo`, `.lessThanOrEqualTo`, `.greaterThanOrEqualTo`

    <br>

    인자로 들어갈 수 있는 값들
    
    <br>

    - ViewAttribute  
    
      |ViewAttribute|NSLayoutAttribute|
      |------|---|
      |view.snp.left|NSLayoutAttribute.left|
      |view.snp.right|NSLayoutAttribute.right|
      |view.snp.top|NSLayoutAttribute.top|
      |view.snp.bottom|NSLayoutAttribute.bottom|
      |view.snp.leading|NSLayoutAttribute.leading|
      |view.snp.trailing|NSLayoutAttribute.trailing|
      |view.snp.width|NSLayoutAttribute.width|
      |view.snp.height|NSLayoutAttribute.height|
      |view.snp.centerX|NSLayoutAttribute.centerX|
      |view.snp.centerY|NSLayoutAttribute.centerY|
      |view.snp.lastBaseline|NSLayoutAttribute.lastBaseline|

    <br>

    - UIView/NSView
        ```swift
        make.left.greaterThanOrEqualTo(label)
        make.left.greaterThanOrEqualTo(label.snp.left) //greater than equal to label.left
        ```

    - Constant Value  
    AutoLayout으로 width, height에 대한 절댓값(constant)을 설정할 수 있다.

<br>

- **priority**
    
    ```swift
    make.top.equalTo(label.snp.top).priority(600)
    ```
    - `.low`
    
    - `.medium`
    
    - `.high`
    
    - `.required`
    
<br>

- **multipler**
    
    ```swift
    // superview의 너비와 같게 만들고 0.45를 곱한 형태
    make.width.equalToSuperview().multipliedBy(0.45)
    ```
    
<br>

- **Composition**
    
    동시에 여러 constraints 값을 생성할 수 있다.
    
    `edges`
    
    ```swift
    //make top, left, bottom, right equal view2
    make.edges.equalTo(view2)
    
    //make top = superivew.top + 5, left = superview.left + 10,
    //bottom = superview.bottom - 15, right = superview.right - 20
    make.edges.equalTo(superview).inset(UIEdgeInsets(top: 5, left: 10, bottom: -15, right: -20)
    ```
    

    `size`

    ```swift
    //make width and height greater than or equal to titleLabel
    make.size.greaterThanOrEqualTo(titleLabel)

    //make width = superview.width + 100, height = superview.height + 100
    make.size.equalTo(superview).offset(100)
    ```

    `center`

    ```swift
    //make centerX and centerY = button1
    make.center.equalTo(button1)

    //make centerX = superview.centerX + 5, centerY = superview.centerY + 5
    make.center.equalTo(superview).offset(5)
    ```

    특정 constraints를 묶어서 값을 설정할 수도 있다.

    ```swift
    make.left.right.bottom.equalTo(superview) //left,right,bottom는 superview에
    make.top.equalTo(otherView) //top은 otherView에
    ```

- **Reference**
    
    로컬 변수나 클래스 프로퍼티에 constraint 결과를 할당해서 특정 constraint 를 참조할 수도 있다.
    
    ```swift
    var topConstraint: Constraint? = nil
    
    ...
    
    // when making constraints (constraint 값 설정)
    view1.snp.makeConstraints { (make) -> Void in
      self.topConstraint = make.top.equalTo(superview).offset(padding.top).constraint
      make.left.equalTo(superview).offset(padding.left)
    }
    
    ...
    // 나중에 topConstraint 값 호출 가능
    self.topConstraint.deactivate()
    
    // topContraint 값 갱신 가능
    self.topConstraint.updateOffset(5)
    ```

<br>

- **snp.updateConstraints**
    
    애플에서 권장하는 constraints update 방법으로, view를 변경하는게 아니라 **constant value**만 갱신
    
    ```swift
    override func updateConstraints() {
        self.growingButton.snp.updateConstraints { (make) -> Void in
            make.center.equalTo(self);
            make.width.equalTo(self.buttonSize.width).priority(250)
            make.height.equalTo(self.buttonSize.height).priority(250)
            make.width.lessThanOrEqualTo(self)
            make.height.lessThanOrEqualTo(self)
        }    
    	 super.updateConstraints()
    }
    ```
    
<Br>

- **snp.remakeConstraints**
    
    `snp.makeConstraints`와 비슷한데, SnapKit으로 특정 constraints를 삭제하는 메소드   
    또는, 기준이 되는 view 변경 시 사용