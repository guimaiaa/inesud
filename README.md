# inesud

Aplicativo iOS em SwiftUI com perguntas para encontros e conversas em níveis de profundidade.

## Sobre

O `inesud` propõe conversas guiadas por cartas de perguntas, com transição suave entre questões e níveis diferentes:

- Nível 1: Quebra-gelo
- Nível 2: Conhecendo melhor
- Nível 3: Mais profundo
- Nível Bônus: Criativos e desafiadores

## Funcionalidades

- Navegação por níveis (`NavigationStack`)
- Perguntas embaralhadas por sessão
- Contador de progresso (`pergunta atual / total`)
- Transição `fade in/out` no texto da pergunta
- Interface minimalista com tema off-white

## Tecnologias

- Swift
- SwiftUI
- Xcode (projeto iOS nativo)

## Estrutura do Projeto

```text
inesud/
├── LICENSE
├── README.md
├── inesud.xcodeproj/
│   ├── project.pbxproj
│   ├── project.xcworkspace/
│   │   ├── contents.xcworkspacedata
│   │   ├── xcshareddata/
│   │   │   └── swiftpm/
│   │   └── xcuserdata/
│   │       └── guilherme.xcuserdatad/
│   └── xcuserdata/
│       └── guilherme.xcuserdatad/
│           └── xcschemes/
└── inesud/
    ├── InesudApp.swift
    ├── ContentView.swift
    ├── LevelsView.swift
    ├── LevelOneView.swift
    ├── LevelTwoView.swift
    ├── LevelThreeView.swift
    ├── LevelBonusView.swift
    └── Assets.xcassets/
        ├── Contents.json
        ├── AccentColor.colorset/
        │   └── Contents.json
        └── AppIcon.appiconset/
            ├── Contents.json
            └── logo 1.png
```

## Como rodar

1. Abra `inesud.xcodeproj` no Xcode.
2. Selecione um simulador ou seu iPhone como destino.
3. Em `Signing & Capabilities`, escolha seu `Team` (Apple ID), se necessário.
4. Clique em `Run` (`⌘R`).

## Próximos updates

- Persistir progresso por nível
- Adicionar botão de reiniciar rodada
- Criar tela de configurações (tema, animação, tamanho de fonte)
- Internacionalização (PT/EN)

## Licença

Este projeto está licenciado sob a MIT License. Veja o arquivo `LICENSE` para detalhes.
