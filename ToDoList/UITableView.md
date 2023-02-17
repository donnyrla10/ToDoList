# UITableView

데이터를 목록 형태로 보여줄 수 있는 가장 기본적인 **UI Component**  

→ ```UIScrollView```를 상속받고 있기 때문에 많은 컨텐츠를 보여줄 수 있음

<br>

- 여러 개의 Cell을 가지고 있고 하나의 열과 **여러 행**을 지니고 있으며, **수직**으로만 스크롤 가능

- `Section`을 통해 **행을 그룹화**하여 콘텐츠를 좀 더 쉽게 탐색 가능

- `Section`의 `Header`, `Footer`에 View를 구성해 추가적인 정보 표시 가능

<br>

**More**  

Controller가 Model과 View를 연결해주는데, controller에서 model, view로는 자유롭게 접근가능하지만 View에서 Controller로의 소통은 제한적이다. 즉, View에서 Controller에게 View의 정보 및 변경 사항을 말해줄 땐, Delegate와 DataSource를 사용해서 의사소통을 진행한다.

- ```Delegate```

    - 해야할 일을 위임한 것으로, 어떤 행동에 대한 동작을 제시

    - 시각적인 부분 수정, 행의 선택 관리, 테이블뷰의 개별 행 편집 등

    - **동작 수행**

- ```Datasource```

    - 데이터 모델의 Delegate

    - 시각적인 모양에 대한 정보 제공

    - 데이터를 받아 view를 그려주는 역할

    - **보여주기**

<br>

UITableView를 사용하기 위해서는, 

`UITableViewDatasource`, `UITableViewDelegate` 프로토콜 채택해서 구현해야 한다. 

```TableView```는 ```Datasource```와 ```Delegate``` 정의에 따라 TableView를 사용자에게 어떻게 표시할 것인지 결정

<br>

- `Datasource`: 데이터를 받아 view 그리기

    - 총 section의 개수

    - section의 행 개수

    - 행에 어떤 정보 표시?

- `Delegate`: 테이블뷰의 동작과 외관 담당

    - view가 변경되는 사항을 Delegate가 담당

    - view는 delegate에게 의존하여 업데이트

    - 행의 높이

    - 행을 선택하면 어떤 액션을 할 것?

<br>

### UITableViewDataSource

테이블 뷰를 생성하고 수정하는데 필요한 정보를 테이블 뷰 객체에 제공

TableView를 생성하고 수정하는 메소드 사용 가능

✅ 메소드는 필수 정의 메소드

<br>

```swift
extension ViewController: UITableViewDataSource {
    //각 섹션에 표시할 행의 개수 ✅
		//Int타입으로 값을 반환하면, 테이블뷰에 반환된 개수만큼 행이 표시된다
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {}
    
    //특정 인덱스 row의 cell에 대한정보를 넣어 cell 반환 ✅
		//셀을 구성하고 보여줄 데이터를 설정한 후에, 이 메소드에 반환하면 구성한 셀이 테이블뷰에 표시된다.
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {}
    
    //총 섹션 개수
		//Int타입으로 섹션의 개수를 반환 
    override func numberOfSections(in tableView: UITableView) -> Int {}
    
    //특정 섹션의 헤더 타이틀
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {}
    
    //특정 섹션의 풋터 타이틀
    override func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {}
    
    //특정 위치의 행이 편집 가능
		//return true -> 편집 가능하게 해줌
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {}
    
    //특정 위치의 행을 재정렬 가능
		//return true -> 재정렬 가능하게 해줌
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {}
    
    //테이블 뷰 섹션 인덱스 타이틀
    override func sectionIndexTitles(for tableView: UITableView) -> [String]? {}
    
    //인덱스에 해당하는 섹션 알려주기
    override func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {}
    
    //스와이프 모드, 편집 모드에서 버튼 선택하면 호출
    //행에 변경사항을 commit
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {}
    
    //행이 다른 위치로 이동되면 어디에서 어디로 이동했는지 알려주기
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {}
}
```
<br>

### UITableViewDelegate

테이블 뷰의 시각적인 부분을 설정하고, 행의 액션 관리, 액세서리 뷰 지원, 테이블 뷰의 개별 행 편집을 도움

필수 메소드 없음

<br>

```swift
extension ViewController: UITableViewDelegate {
    //행 선택되었을 때 호출
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {}
    
    //행 선택 해제되었을 때 호출
    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {}
    
    //특정 위치 행의 높이
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {}
    
    //지정된 섹션의 헤더뷰 또는 푸터뷰에 표시할 view는 어떤거?
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {}
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {}
    
    //지정된 섹션의 헤더뷰 또는 푸터뷰 높이
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {}
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {}
    
    //테이블뷰가 편집모드에 들어갔을 때 호출
    override func tableView(_ tableView: UITableView, willBeginEditingRowAt indexPath: IndexPath) {}
    
    //테이블뷰가 편집모드에서 나왔을 때 호출
    override func tableView(_ tableView: UITableView, didEndEditingRowAt indexPath: IndexPath?) {}
    
    //테이블뷰가 셀을 사용해서 행을 그리기 직전에 호출
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {}
    
    //테이블뷰로부터 셀이 화면에 사라지면 호출
    override func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {}
}
```

<br>
<br>
<br>
