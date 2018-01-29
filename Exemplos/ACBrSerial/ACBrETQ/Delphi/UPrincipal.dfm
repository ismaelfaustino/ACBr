object FPrincipal: TFPrincipal
  Left = 379
  Top = 228
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Impress'#227'o de Etiquetas'
  ClientHeight = 276
  ClientWidth = 740
  Color = clBtnFace
  Constraints.MinHeight = 275
  Constraints.MinWidth = 740
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = True
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object gbConfiguracao: TGroupBox
    Left = 0
    Top = 0
    Width = 246
    Height = 276
    Align = alLeft
    Caption = 'Configura'#231#245'es da Impressora'
    TabOrder = 0
    DesignSize = (
      246
      276)
    object lbModelo: TLabel
      Left = 136
      Top = 33
      Width = 38
      Height = 13
      Anchors = [akLeft, akBottom]
      Caption = 'Modelo:'
      Color = clBtnFace
      ParentColor = False
    end
    object lbPorta: TLabel
      Left = 10
      Top = 33
      Width = 28
      Height = 13
      Anchors = [akLeft, akBottom]
      Caption = 'Porta:'
      Color = clBtnFace
      ParentColor = False
    end
    object lbAvanco: TLabel
      Left = 10
      Top = 169
      Width = 59
      Height = 13
      Anchors = [akLeft, akBottom]
      Caption = 'Avan'#231'o Etq:'
      Color = clBtnFace
      ParentColor = False
    end
    object lbDPI: TLabel
      Left = 136
      Top = 78
      Width = 75
      Height = 13
      Anchors = [akLeft, akBottom]
      Caption = 'DPI Impressora:'
      Color = clBtnFace
      ParentColor = False
    end
    object lbTemperatura: TLabel
      Left = 10
      Top = 78
      Width = 63
      Height = 13
      Anchors = [akLeft, akBottom]
      Caption = 'Temperatura:'
      Color = clBtnFace
      ParentColor = False
    end
    object lbBackFeed: TLabel
      Left = 136
      Top = 169
      Width = 52
      Height = 13
      Anchors = [akLeft, akBottom]
      Caption = 'BackFeed:'
      Color = clBtnFace
      ParentColor = False
    end
    object lbTemperatura1: TLabel
      Left = 10
      Top = 123
      Width = 56
      Height = 13
      Hint = 'Utilize '#39'-1'#39' para usar velocidade padr'#227'o da impressora'
      Anchors = [akLeft, akBottom]
      Caption = 'Velocidade:'
      Color = clBtnFace
      ParentColor = False
    end
    object cbModelo: TComboBox
      Left = 136
      Top = 46
      Width = 94
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      ItemIndex = 3
      TabOrder = 5
      Text = 'etqZPLII'
      OnChange = cbModeloChange
      Items.Strings = (
        'etqNenhuma'
        'etqPpla'
        'etqPPlb'
        'etqZPLII'
        'etqEpl2')
    end
    object cbPorta: TComboBox
      Left = 10
      Top = 46
      Width = 113
      Height = 21
      ItemHeight = 13
      TabOrder = 0
      Text = 'C:\TEMP\ETQ.TXT'
      Items.Strings = (
        'LPT1'
        'LPT2'
        'COM1'
        'COM2'
        'COM3'
        '\\localhost\ZEBRA'
        '\\127.0.0.1\ARGOX'
        'Digite a porta')
    end
    object eAvanco: TEdit
      Left = 10
      Top = 182
      Width = 112
      Height = 21
      TabOrder = 3
      OnKeyPress = eCopiasKeyPress
    end
    object cbDPI: TComboBox
      Left = 136
      Top = 91
      Width = 94
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 6
      Text = 'dpi203'
      Items.Strings = (
        'dpi203'
        'dpi300'
        'dpi600')
    end
    object eTemperatura: TEdit
      Left = 10
      Top = 91
      Width = 113
      Height = 21
      TabOrder = 1
      Text = '10'
      OnKeyPress = eCopiasKeyPress
    end
    object cbBackFeed: TComboBox
      Left = 136
      Top = 182
      Width = 94
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 7
      Text = 'bfNone'
      Items.Strings = (
        'bfNone'
        'bfOn'
        'bfOff')
    end
    object eVelocidade: TEdit
      Left = 10
      Top = 136
      Width = 113
      Height = 21
      Hint = 'Utilize '#39'-1'#39' para usar velocidade padr'#227'o da impressora'
      TabOrder = 2
      Text = '-1'
      OnKeyPress = eCopiasKeyPress
    end
    object ckMemoria: TCheckBox
      Left = 10
      Top = 213
      Width = 94
      Height = 19
      Caption = 'Limpar Mem'#243'ria'
      Checked = True
      State = cbChecked
      TabOrder = 4
    end
  end
  object gbImagem: TGroupBox
    Left = 246
    Top = 0
    Width = 309
    Height = 276
    Align = alClient
    Caption = 'Carregar Imagem'
    TabOrder = 1
    DesignSize = (
      309
      276)
    object Image1: TImage
      Left = 15
      Top = 26
      Width = 258
      Height = 126
      Center = True
      Picture.Data = {
        07544269746D6170DE0D0000424DDE0D0000000000003E00000028000000FA00
        00006D0000000100010000000000A00D0000232E0000232E0000020000000000
        000000000000FFFFFF0000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000012491121108404020000000000000000000000000000
        00000000000000000000000040080420A09049249249112B2A94891212208202
        000008000000000000000000040040000000000000000034D56C000000000010
        110440420800202000001222008000020402000000000009248A000000040800
        0020000001248204200000000004001000201090088122569665810080400080
        8000000840000000000000004000448000000202410800296552901012008008
        08810440000000810000211004880000C908800101820452693CC04200111400
        24108082120408000400000200000C0D333322246448C9CADEE76444C8CC2391
        4301391280200008000004001000825900212226240C50559363642808009110
        402308324000808088000020001003310920222062014865A4DB5C4D44818310
        493011820000080000002002008001010A112622226008CB9A66EE404C8C1110
        661111124248000800000200480240A00300000000068191A6B9240100100010
        41044000400121201000004000080040000000000000005AF644948000008032
        F900000004000001000004040100000000049090800000A429256B0001009ECD
        5000084200080000000020001000480040000000040124954AB5248448B64549
        00000000400010082000000100100100040000000040014AA5249552565568AA
        A021010004410200040000480101001100904484200800B25293524B25449654
        C0802008000800410000100020000000200200008000111559592AA96AAA4925
        0402002080001000200002000044108000000000044041CA8AA4A5549125A9AA
        000002001080000800000011040000110440044400040224D496524A9654AA53
        10001000020100400000108000000200000240000080025253536CA949260508
        0010800480080400800004002089200020000000840000000000000000000000
        0100002000000000010000110400041104481244100220000000000000000000
        0002008000001000000021000020008222450022012889248810824FFFFFFFFF
        FEFB7750000000000800082448048176FFFBFFBDFFFFC4005FFFFFF00000000D
        6DB5800001000008000000000100106DAA580000DA92000003FFFFE000000000
        094C800000004000000021080000005B55A00000D5700000007FFBE000000000
        06EF0000081001008000044144800065BB700001AEB00000002D5EE000000000
        01B3801200020000000000000000003AAB50000173400000000EEF61FFFFFFF0
        00AC87FC00000020000010122000002DD5A000029D8000000007FBE124924A5F
        D057068600000000080001000480005ABDB00003D70000000003BDA1554AA949
        5035856A02000000000004200000002D54A00002B60000000001DF61B6F55B6A
        6C1A84B4000024010000200490000016DB6000057C0000000001B6E0992DACAD
        AA0D86CD00080000000000800240001AAB400007E80000000000FDE14A92D595
        340B455600000020000008210000000000000006F800000000006FE1EDDA4AEA
        D70D82A80000000010002202240000000000000F5000000000007DA0952DB52D
        290506D60120800001000008004000000000000DF000000000003BE16AC00055
        AA86852A0000000200000080000000000000000FC000000000002EE14D600012
        B68585B40800040000000820491000000000001EE000004800001FB1B240000D
        558304A60000004000000204000000000000000DA00001FC00001BE09BA1A805
        AA8586DA0002000008002001002000000000001FC00003FF00001DA16CA3FF82
        9543852C0000000000000890248000000000003BC00007AF80001FE192C365C2
        EAC285A60020200080000000000000000000003D00000F7BC0000EE16D63DA42
        550544D90100000000000104821000000000003FC0000FEFC0000B609242EEC3
        5B4386940000011000002420100400000000006B80001DF6C0000FE16EA35582
        A484836E0000000000000000004000000000007D00001EBEE0007DD195A3B6C3
        5B8704A70000800044000112448000000000007F80001BDBE003FEE16941AA05
        55058690020800020000100000080000200000E780001F7F601FD7A0AEA00004
        AA8685EF000001000000020810000003AE0000FD00001BF6F0FDBBE15560000D
        B50B4235000008000000084102100001D80000BF80003DDDDBEFFEE169400035
        560D0592000000000000000040420000B400019600001F6FFFDDB7E1AB2012CA
        A81A85BB001000000000222400000000CC0001E700001BFDB77B7B6135BFED5A
        D4178655800080100800000012040000B000027900003DB7DDEFEF60CA5556AD
        286905A4804000008000088200408000F800031700001FFEFFBDBDE156C92952
        80B6C4BB400008800000101082000000480003EB00001D5B6DF77BE1A96EDADA
        015B0552E000000000000100102400006800055A800037EFDEDFEF613692AD28
        035B86AD200000000000000100010000600006AD80001FBDF7F6DDE14B6B52D6
        01B48556DF6040000000244804800000300006D600003DF6EEDDFEE0D95CAD5B
        80CD82A924C00004110000008810800030000D7680001B7F7DBFB7A16AA000A4
        E0DB06D535A00000000002200004200020000B2980001FB7DBF6EEE14DA0002A
        B06B852C2A700020000020044080000020000BB700001B7AE77BFBE1AA80001B
        4C1585A816900400000004800410000000001D6D80000DEFE0375F615561F815
        683C84D40B48000080000012080240002000135480000FFEC007EDE0AB43FF0A
        5417065C09680000000010004080100000001ADB80000EB6C0003FE16CA3550B
        AA12834806B000000000022000200000000036B6800007DFC0000D6155A3FE89
        5A1D009001501088040001048904400000002DADC00003F680000FA1AA436D0D
        54140000000000000000240000000800000033524000017D00001FE155A1DF0A
        AB18000000000000200000201021000000006DBDC000002800001AE13563FA15
        B4140000000000000000008921040000000036ADA000000000003F61AA800015
        4A1000000000020000001000000020000000D5666000000000003BE156C0001A
        B600000000002000800004000040040000006BB5D00000000000776152600066
        AA0000000000000800000092448900000000BD5B3000000000007EE1ADA001B5
        540004104000000002002200000022000001CAD5B00000000000EFE0AD5FFD14
        B20080800008802000000001080000000000B6BB6C0000000000F6E152B246D6
        AC00000001000000000010900124440000016D555A0000000001DEE1B54D34DB
        500200000000040000000404400080000003ABAEDC0000000003EFC096B2DB29
        580004004000000020000040080008000001596AA700000000077B61AAD692D5
        A00000020400000000002100822201000000EEB777800000000FF6F16D2ADA6C
        80000000001010080000041200102000000056D559E00000001DBDA095B52695
        00082010000100808200000011000080000829B2AA600000003EEB6100024880
        0000008000400000000010804002440000001D6F6EBC000001EFB5A000000000
        00000000100000000000002400480021010106ADB5DE400005F76D4000000000
        00010000800000000000090109000000101003696D45C800BF7BAB7000000000
        00100400000000000000000000004912020000D756BBBFFFFFBDDAAFFFFFFFF8
        008020040101042210002042442400002009005ADB6CDFFF5BDD35D56EEF7FE0
        000000200008000000000A080081020000202036AAD66B6DF6F6DADAA5295780
        080000000000000000000010100020490480010B6D5BBDF7BF7ADB2EDBB6E800
        000000000400000000001080821004004000840356D94FBEEDCB56F56D5B2C00
        8008800020000400010000000042000008000000EB6DBB6DFEEDAA95B36AE000
        0100048000000040800022242400408800482000352EDFFF5FB576EDADAD4004
        10000000001080000000000080000801000100801AE54DB7EB5AAB5AD6D68000
        0000000840000004000004200124810024000408037AEEEDFD6F5AB659580040
        00102000000004000200108410001024008810000096B7FEB6A5B755B6A00000
        0001000002000000000000008000000040010041002D9DB7DB7AD4EB6B400402
        41000201000000000000080004920401082000081005DF6DF5952EB6B4000040
        0000000000108040000001242000909001002200000067FED6DBF35B60008000
        080000480000000024004201000000000008000082401DB7AAAC9DAC80040000
        0008000001001002000010100948000440010090000000DD76D76AA000000808
        000090000800000000000080800112400920100110000002AD75440000200041
        0120000040020080000004081004000800004200000800000000000000000000
        0000008000000000000020000220200120090010010100000000000002004200
        0400000000080000000000910001048004800004902020000000000800410000
        2000020200001001080008002440002400100480000000000000444040000001
        0001200000800020000001088008400090004000010204248888000008000040
        0020000820000100000002000102090002020020201000000000000100100800
        0000000000000000000010211000001000100402000000400001100000004008
        02040000010080004100}
    end
    object lbNomeImg: TLabel
      Left = 15
      Top = 164
      Width = 111
      Height = 13
      Anchors = [akLeft, akBottom]
      Caption = 'Nome Imagem Mem'#243'ria'
      Color = clBtnFace
      ParentColor = False
    end
    object edNomeImg: TEdit
      Left = 15
      Top = 177
      Width = 258
      Height = 21
      TabOrder = 0
      Text = 'ACBR'
    end
    object bCarregarImg: TButton
      Left = 15
      Top = 206
      Width = 152
      Height = 32
      Caption = 'Carregar Imagem'
      TabOrder = 1
      OnClick = bCarregarImgClick
    end
    object rbStream: TRadioButton
      Left = 183
      Top = 223
      Width = 87
      Height = 19
      Caption = 'De um Stream'
      TabOrder = 3
    end
    object rbArquivo: TRadioButton
      Left = 183
      Top = 206
      Width = 90
      Height = 19
      Caption = 'De um Arquivo'
      Checked = True
      TabOrder = 2
      TabStop = True
    end
  end
  object gbImpressao: TGroupBox
    Left = 555
    Top = 0
    Width = 185
    Height = 276
    Align = alRight
    Caption = 'Impress'#227'o'
    TabOrder = 2
    DesignSize = (
      185
      276)
    object lbCopias: TLabel
      Left = 16
      Top = 35
      Width = 47
      Height = 13
      Anchors = [akLeft, akBottom]
      Caption = 'N'#186' Copias'
      Color = clBtnFace
      ParentColor = False
    end
    object eCopias: TEdit
      Left = 16
      Top = 48
      Width = 150
      Height = 21
      TabOrder = 0
      Text = '1'
      OnKeyPress = eCopiasKeyPress
    end
    object bEtqSimples: TButton
      Left = 16
      Top = 79
      Width = 150
      Height = 32
      Caption = 'Etiqueta Simples'
      TabOrder = 1
      OnClick = bEtqSimplesClick
    end
    object bEtqCarreiras: TButton
      Left = 16
      Top = 120
      Width = 150
      Height = 32
      Caption = 'Etiqueta 3 Colunas'
      TabOrder = 2
      OnClick = bEtqCarreirasClick
    end
    object bImprimirImagem: TButton
      Left = 16
      Top = 201
      Width = 150
      Height = 32
      Caption = 'Imprimir Imagem'
      TabOrder = 4
      OnClick = bImprimirImagemClick
    end
    object bEtqBloco: TButton
      Left = 16
      Top = 160
      Width = 150
      Height = 32
      Caption = 'Bloco de Etiquetas'
      TabOrder = 3
      OnClick = bEtqBlocoClick
    end
  end
  object ACBrETQ: TACBrETQ
    Porta = 'LPT1'
    Ativo = False
    Left = 400
    Top = 48
  end
  object OpenPictureDialog1: TOpenPictureDialog
    Filter = 'BMP MonoCrom'#225'tico|*.bmp|PCX|*.pcx|IMG|*.img'
    Left = 304
    Top = 48
  end
end
