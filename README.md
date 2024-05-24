# IncheonAirport

### 인천공항 출도착 확인 가능 앱

<h2>앱을 제작하게된 배경</h2>
  
공항을 이용하기 위해서는 매번 출도착 시간을 확인해야 하는데 실시간을 게이트가 바뀌고 지연될 수 있기 때문에 이런 변경 사항들을 확인할 수 있도록 만들었습니다.    


<h2>사용한 API</h2>
  - 공공데이터 포털에서 제공하는 한국공항공사_항공기운항정보 API를 이용하였습니다.
  - https://www.data.go.kr/iim/api/selectAPIAcountView.do


<h2>UI</h2>

<div align="center">
  <img src="https://github.com/iOS-Developer-KR/Clone_Skyscanner/blob/main/images/Simulator%20Screenshot%20-%20iPhone%2015%20Pro%20-%202024-05-22%20at%2020.45.22.png" width="300" height="600"/>
</div>
- 메인 뷰에서는 SkyScanner의 메인 뷰를 Clone하였습니다. (현재 화면에 나타나있는 호텔, 렌터카 기능은 구현하지 않았습니다)
<br>

<div align="center">
  <img src="https://github.com/iOS-Developer-KR/Clone_Skyscanner/blob/main/images/Simulator%20Screenshot%20-%20iPhone%2015%20Pro%20-%202024-05-22%20at%2020.25.49.png" width="300" height="600"/>
</div>
- 항공편을 검색하기 위한 뷰로 만약 출발지와 도착지를 지정하게 된다면 flightModel의 gettingData값을 토글시켜 원하는 항공편을 검색할 수 있게 됩니다

<h2>통신코드</h2>
다음으로는 Alamofire 라이브러리를 이용한 API 데이터를 가져오는 코드입니다.

```swift
func FetchData(url: URL, completion: @escaping (IncheonResponse?) -> Void) {
  AF.request(url, method: .get).responseDecodable(of: IncheonResponse.self) { response in
      switch response.result {
      case .success(let data):
          return completion(data)
      case .failure:
          return completion(nil)
      }
  }
}
```


항공 API로부터 데이터를 받을 수 있도록 만든 데이터 모델입니다.



```swift
struct IncheonResponse: Decodable {
    let response: IncheonBody
}

struct IncheonBody: Decodable {
    let header: IncheonHeader
    let body: IncheonItems
}

struct IncheonHeader: Decodable {
    let resultCode: String
    let resultMsg: String
}

struct IncheonItems: Decodable {
    let items: [IncheonItem]
    
}

struct IncheonItem: Decodable, Hashable {
    let typeOfFlight: String?
    let airline: String?
    let flightId: String?
    let scheduleDateTime: String?
    let estimatedDateTime: String?
    let airport: String?
    let gatenumber: String?
    let carousel: String?
    let exitnumber: String?
    let remark: String?
    let codeshare: String?
    let masterflightid: String?
    let airportCode: String?
    let cityCode: String?
    let terminalId: String?
    let firstopover: String?
    let firstopovername: String?
    let secstopover: String?
    let secstopovername: String?
    let thistopover: String?
    let thistopovername: String?
    let elapsetime: String?
}
```


<div align="center">
  <img src="https://github.com/iOS-Developer-KR/Clone_Skyscanner/blob/main/images/Simulator%20Screenshot%20-%20iPhone%2015%20Pro%20-%202024-05-22%20at%2020.26.28.png" width="300" height="600"/>
</div>

<br>

검색할 때 출발지와 도착지가 겹치지 않으면서 사용자가 textfield에 입력한 문자로 원하는 공항을 찾을 수 있도록 만든 로직입니다.
```swift
ForEach(AllAirports.filter({ Airport in
    (departureView ? Airport.cityName != flightModel.arrivalCity.cityName : Airport.cityName != flightModel.departureCity.cityName) &&
    (Airport.cityName.hasPrefix(textfield) || Airport.cityCode.hasPrefix(textfield))
}))
```

- 입력을 완료하면 항공편을 검색하여 원하는 항공편에 대한 정보를 사용자한테 보여주게 됩니다.
- 아래 코드는 항공편을 검색하는 동안 Lottie를 이용한 사용자한테 보여줄 애니메이션 뷰를 나타내는 코드입니다.

```swift
if flightModel.gettingData {
    LottieView(animation: .named("animation.json"))
        .playbackMode(.playing(.toProgress(1, loopMode: .loop)))
}
```

<h2>결과물</h2>
<div align="center">
  <img src="https://github.com/iOS-Developer-KR/Clone_Skyscanner/blob/main/images/Simulator%20Screen%20Recording%20-%20iPhone%2015%20Pro%20-%202024-05-22%20at%2023.41.07.gif" width="300" height="600"/>
</div>
