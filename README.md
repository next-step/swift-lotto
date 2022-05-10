## 로또 미션 저장소
### Effective Swift
NEXTSTEP with yagom-academy

---
## 목차
1. [로또(자동) 파일트리](#1-로또(자동)-파일트리)
2. [구현 기능 목록](#2-구현-기능-목록)
---

## 1. 로또(자동) 파일트리
```
Lotto
├── model
│   ├── Constants.swift
│   └── Lotto.swift
└── view
    ├── InputView.swift
    └── ResultView.swift  
├── controller
│   ├── LottoGenerator.swift
│   └── LottoManagement.swift
├── main.swift
```

    
## 2. 구현 기능 목록
- **Constants**
    - `lottoPrice`: 로또 한장 가격
    - `defaultLottoRange`: 로또 번호 생성 범위
    - `defaultLottoCount`: 로또 당첨 번호 갯수

- **Lotto**
    - `match(winningNumber:bonusNumber:)`: 당첨 여부에 따라 `rank` `reward` 저장


- **LottoNumbers**
    - 로또번호 리스트 생성을 위한 일급 콜렉션

- **LottoGenerator**
    - `randomNumber()`: 랜덤 숫자 생성
    - `autoNumbers()`: 랜덤 숫자 6개 생성 후 Lotto 리턴
    - `auto(n:)`: n개의 로또 생성 후 [Lotto] 리턴


- **CalculateProfit**
    - `init(lotts:)`: 로또 결과 및 수익률 계산


- **InputView**
    - `readPurchasePrice()`: 구매할 로또 금액 입력받아서 구매 개수(Int) 리턴
    - `readPrevWinningNumber()`: 로또 당첨 번호 입력받아서 [Int] 리턴


- **ResultView**
    - `printResult(lottos:)`: 로또 당첨결과 및 수익률 프린트
