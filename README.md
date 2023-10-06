## 1. 프로젝트 소개

단어장 앱:  [Anki](https://apps.ankiweb.net) 클론코딩


- 플래시카드를 활용해 사용자가 지속적으로 정보를 복습하고 기억하도록 기능을 제공합니다.
- 학습완료 대신 **난이도/복습시간**을 선택해 해당 정도를 언제 다시 볼 것인지를 결정합니다.
- 사용자가 정의한 카드 Deck을 생성해 Deck 별로 다양한 주제의 카드를 생성하고 진도율을 관리합니다.

<br>

## 2. 기술 구조

- **UI**: UIKit, SnapKit
- **Communication**: Slack, Gather
- **Architecture**: MVVM
    - Model: CoreData 혹은 UserDefaults 등과 연결되어 영속적으로 관리할 Raw한 데이터 모델
    - ViewModel
        - ViewModel: Model의 데이터를 View에 표시할 내용으로 정리하고 변환한 데이터 모델
        - Service: ViewModel을 관리하며 CRUD와 추가 비즈니스 로직을 제공하는 클래스
    - View
        - View: UI 관련 로직만 담당
        - Controller: Navigation, Event, Life Cycle 등을 담당
- **Data** **Storage**: UserDefaults
- **Library**:
    - [SnapKit](https://github.com/SnapKit/SnapKit): UIKit에서 AutoLayout을 보다 쉽게 작성하기 위해 도입하였습니다.
    - [EventBus](https://github.com/swiftarium/EventBus): 특정 상황(이벤트)이 발생했을 때 특정 동작을 수행하기 위해 도입하였습니다.
    - [Publishable](https://github.com/swiftarium/Publishable): Model의 속성 값이 변경됐을 때 View를 변경하기 위해 도입하였습니다.

<br>

## 3. 화면 및 기능 소개

<img width="1771" alt="image" src="https://github.com/hidaehyunlee/Flashcards-App/assets/37580034/595f9bc7-12d9-47a9-87db-3bd86fdd7a99">

[시연영상 링크](https://drive.google.com/file/d/1C6mSIe5tE8EejKMToLVZ35FnMBpUgemR/view)

### 3.1. 메인 화면

- 새로운 덱 추가 기능
- 설정 화면 이동
- 세부 덱 화면 이동

### 3.2. 덱 정보 화면

- 공부 진행 상황 원형 진행도로 표현 (w/ `CAShapeLayer`)
- 플래시 카드 추가 기능

### 3.3. 공부 화면

- “정답 확인하기” 버튼 클릭 시 카드뷰가 돌아가며 단어/뜻 함께 보여줌
- 각 단어의 난이도를 조정하여 복습 기간을 설정할 수 있음
    - ex) hard - 8분 뒤 다시보기, easy - 4일 뒤 다시보기

### 3.4. 설정 화면

- 알림관리: `UIActionSheet`를 활용해 ‘매일/평일/안 함’ 옵션 제공
    - notificationOption 속성을 Publishable 라이브러리를 사용해 구독, 변경될 때 마다 notificationCenter에 등록된 알림 초기화/새로 요청
- 기본 리마인더 시간: `UIDatePicker`로 커스텀셀을 통해 선택
- 앱 내 알림 표시: `UISwitch`를 통해 foreground 상태에서 알림을 받을 건지 유저가 결정

### 3.5. 유저 푸시알림 화면

- 푸시알림 테스트 기능
    - true: 토글 3초 후에 fore/back/종료 상태와 관계없이 notification 전송
    - false: notification 전송은 되지만 화면에 보여주진 않음


 <br>

## 4. 어려웠던 문제 / 해결 방법

- 이대현
    - 뷰와 로직 분리 문제: EventBus 를 활용해 View파일에서 이벤트를 등록하고, Controller파일에서 이벤트에 따른 동작 정의
        - MVVM에서 메서드들의 위치: View와 관련한 로직은 controller에, Model과 관련한 로직은 Service(ViewModel)에 정의하는 식으로 조금 구조에 대한 감이 잡힌 것 같습니다.
        - 컨트롤러가 뷰의 존재를 아는 방법: 컴포넌트들을 조작하려면 컨트롤러에서 어떤 뷰의 컴포넌트인지 알고 있어야 하는데, rootView를 활용했습니다.
    - UserNotification: foreground / background / 종료 등 앱 의 상태에 대해 공부할 수 있었습니다.
- 김서진
    - ui를 코드로 짜는 것부터 어려움을 느꼈습니다. 제가 많이 부족하단 생각에 힘들었지만 이전에 배운 오토레이아웃 설정법과 챗gpt를 이용해 해결했습니다.
- 조재민
    - 애니메이션:
        - 토글 변수 값에 따라 플러스 버튼을 45도 회전하는 애니메이션 함수를 `CABasicAnimation`을 통해 구현, 시작과 끝 값을 토글값을 통해 조정
        - 스케일이펙트를 통해 확장/축소되는 듯한 효과 적용
     
          <br>

## 5. 프로젝트 후기

- 이대현 - MVVM 아키텍처에 대해 많이 고민할 수 있었던 프로젝트였습니다.
- 김서진- 좀 더 소통하고싶었는데 아쉬웠습니다 고생하셨습니
- 이세령 - 다들 프로젝트 진행하느라 고생 많으셨습니다!
- 박진용 - 직접 작성한 라이브러리를 실험적으로 이용해 볼 수 있어서 좋았습니다.
- 조재민 - 플로팅 버튼에 애니메이션을 추가하면서 다른 애니메이션에 관심이 생겨서 좋은 경험이였습니다. 고생하셨습니다.
