# GS25_WITHSOPT

---

>  ##### SOPT Collaboration With Design Part



### iOS

* 권준👏 , 최은지👍 , 조경진✌️

### Design

* 김루희😛 , 이세림😝 , 김필원😜

---

### Completed View 💻 

<img width="300" alt="스크린샷 2019-11-21 오후 11 41 08" src="https://user-images.githubusercontent.com/46750574/69348579-c150c300-0cb9-11ea-853b-116ae912a3fd.png"><img width="300" alt="스크린샷 2019-11-21 오후 11 41 47" src="https://user-images.githubusercontent.com/46750574/69348580-c150c300-0cb9-11ea-9967-3b475803304c.png">

---

### Using API

* XLPagerTabStrip

---

### TODOList

* 네비게이션 타이틀에 이미지 넣기
  * 버튼으로 타이틀에 넣어서 버튼에 이미지 넣기
  * User Interaction을 false로 지정!
* 상단 탭바

  * import XLPagerTabStrip
* 하단 탭바 구현

  *  import image Assets
* navigation bar button 에 withrenderingmode

  * image Assets 에서 Original Image 로 설정할 수 있다!

<img width="300" alt="스크린샷 2019-11-21 오후 11 44 17" src="https://user-images.githubusercontent.com/46750574/69348582-c150c300-0cb9-11ea-9c78-31d611a56ae3.png">

* 마이페이지 스크롤 뷰 
  
  * Content Huggin Priority 를 low 낮추기!
  
  <img width="262" alt="스크린샷 2019-11-21 오후 11 52 28" src="https://user-images.githubusercontent.com/46750574/69348728-ff4de700-0cb9-11ea-9ae5-8939a75899fc.png">
* 테이블 셀에 이미지 넣기

  * Table Cell 말고 StackView 로 구현하면 더 간편!
* disclosure Indicator
* Extensions
* Programmingly implementing components without Storyboard (어려움!!)

```swift
let point1LeadingConstraint = NSLayoutConstraint(item: pointLabel1, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1, constant: 62.5)
// LeadingConstraint를 코드로 구현
let point1VerticalSpace = NSLayoutConstraint(item:pointLabel1, attribute: .top, relatedBy: .equal, toItem: nameLabel, attribute: .bottom, multiplier: 1, constant: 2)
// VerticalConstraint를 코드로 구현
NSLayoutConstraint.activate([point1WidthConstraint, point1HeightConstraint, point1LeadingConstraint, point1VerticalSpace])

```

