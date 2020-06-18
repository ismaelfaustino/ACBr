{******************************************************************************}
{ Projeto: Componentes ACBr                                                    }
{  Biblioteca multiplataforma de componentes Delphi para intera��o com equipa- }
{ mentos de Automa��o Comercial utilizados no Brasil                           }
{                                                                              }
{ Direitos Autorais Reservados (c) 2020 Daniel Simoes de Almeida               }
{                                                                              }
{ Colaboradores nesse arquivo:                                                 }
{                                                                              }
{  Voc� pode obter a �ltima vers�o desse arquivo na pagina do  Projeto ACBr    }
{ Componentes localizado em      http://www.sourceforge.net/projects/acbr      }
{                                                                              }
{  Esta biblioteca � software livre; voc� pode redistribu�-la e/ou modific�-la }
{ sob os termos da Licen�a P�blica Geral Menor do GNU conforme publicada pela  }
{ Free Software Foundation; tanto a vers�o 2.1 da Licen�a, ou (a seu crit�rio) }
{ qualquer vers�o posterior.                                                   }
{                                                                              }
{  Esta biblioteca � distribu�da na expectativa de que seja �til, por�m, SEM   }
{ NENHUMA GARANTIA; nem mesmo a garantia impl�cita de COMERCIABILIDADE OU      }
{ ADEQUA��O A UMA FINALIDADE ESPEC�FICA. Consulte a Licen�a P�blica Geral Menor}
{ do GNU para mais detalhes. (Arquivo LICEN�A.TXT ou LICENSE.TXT)              }
{                                                                              }
{  Voc� deve ter recebido uma c�pia da Licen�a P�blica Geral Menor do GNU junto}
{ com esta biblioteca; se n�o, escreva para a Free Software Foundation, Inc.,  }
{ no endere�o 59 Temple Street, Suite 330, Boston, MA 02111-1307 USA.          }
{ Voc� tamb�m pode obter uma copia da licen�a em:                              }
{ http://www.opensource.org/licenses/lgpl-license.php                          }
{                                                                              }
{ Daniel Sim�es de Almeida - daniel@projetoacbr.com.br - www.projetoacbr.com.br}
{       Rua Coronel Aureliano de Camargo, 963 - Tatu� - SP - 18270-170         }
{******************************************************************************}

{$I ACBr.inc}

unit ACBrTEFDPayGoWeb;

interface

uses
  Classes, SysUtils,
  ACBrBase, ACBrTEFDClass, ACBrTEFPayGoWebComum, ACBrTEFComum;

type

  { TACBrTEFDRespPayGoWeb }

  TACBrTEFDRespPayGoWeb = class( TACBrTEFDResp )
  private
    procedure ConteudoToComprovantes;
    procedure ConteudoToParcelas;
  public
    procedure ConteudoToProperty; override;
  end;

  { TACBrTEFDPayGoWeb }

  TACBrTEFDPayGoWeb = class( TACBrTEFDClass )
  private
    fOperacaoADM: Word;
    fOperacaoATV: Word;
    fOperacaoCHQ: Word;
    fOperacaoCNC: Word;
    fOperacaoCRT: Word;
    fOperacaoPRE: Word;
    fsPGWebAPI: TACBrTEFPGWebAPI;
    function GetParametrosAdicionais: TACBrTEFPGWebAPIParametrosAdicionais;
    procedure GravaLogAPI(const ALogLine: String; var Tratado: Boolean);

    function GetCNPJEstabelecimento: String;
    function GetDiretorioTrabalho: String;
    function GetOnAguardaPinPad: TACBrTEFPGWebAPIAguardaPinPad;
    function GetOnExibeMensagem: TACBrTEFPGWebAPIExibeMensagem;
    function GetOnExibeMenu: TACBrTEFPGWebAPIExibeMenu;
    function GetOnObtemCampo: TACBrTEFPGWebAPIObtemCampo;
    function GetPathDLL: string;
    function GetPontoCaptura: String;
    function GetSuportaViasDiferenciadas: Boolean;
    function GetUtilizaSaldoTotalVoucher: Boolean;
    procedure SetCNPJEstabelecimento(AValue: String);
    procedure SetDiretorioTrabalho(AValue: String);
    procedure SetOnAguardaPinPad(AValue: TACBrTEFPGWebAPIAguardaPinPad);
    procedure SetOnExibeMensagem(AValue: TACBrTEFPGWebAPIExibeMensagem);
    procedure SetOnExibeMenu(AValue: TACBrTEFPGWebAPIExibeMenu);
    procedure SetOnObtemCampo(AValue: TACBrTEFPGWebAPIObtemCampo);
    procedure SetPathDLL(AValue: string);
    procedure SetPontoCaptura(AValue: String);
    procedure SetSuportaViasDiferenciadas(AValue: Boolean);
    procedure SetUtilizaSaldoTotalVoucher(AValue: Boolean);
  protected
    Procedure LerRespostaRequisicao; override;
    procedure FinalizarResposta( ApagarArqResp : Boolean ); override;

    procedure FazerRequisicao(PWOPER: Word; AHeader: String = '';
        AValor: Double = 0; ADocumentoVinculado: String = ''; AMoeda : Integer = 0;
         ParametrosAdicionaisTransacao: TStrings = nil);
    function ContinuarRequisicao: Boolean;
    procedure ObterDadosTransacao;
  public
    property PathDLL: string read GetPathDLL write SetPathDLL;
    property DiretorioTrabalho: String read GetDiretorioTrabalho write SetDiretorioTrabalho;
    property ParametrosAdicionais: TACBrTEFPGWebAPIParametrosAdicionais read GetParametrosAdicionais;

    constructor Create( AOwner : TComponent ) ; override;
    destructor Destroy ; override;

    procedure Inicializar ; override;
    procedure DesInicializar ; override;

    procedure AtivarGP ; override;
    procedure VerificaAtivo ; override;

    Procedure ATV ; override;
    Function ADM : Boolean ; override;
    Function CRT( Valor : Double; IndiceFPG_ECF : String;
       DocumentoVinculado : String = ''; Moeda : Integer = 0 ) : Boolean; override;
    Function CHQ( Valor : Double; IndiceFPG_ECF : String;
       DocumentoVinculado : String = ''; CMC7 : String = '';
       TipoPessoa : AnsiChar = 'F'; DocumentoPessoa : String = '';
       DataCheque : TDateTime = 0; Banco   : String = '';
       Agencia    : String = ''; AgenciaDC : String = '';
       Conta      : String = ''; ContaDC   : String = '';
       Cheque     : String = ''; ChequeDC  : String = '';
       Compensacao: String = '' ) : Boolean ; override;
    Procedure NCN(Rede, NSU, Finalizacao : String;
       Valor : Double = 0; DocumentoVinculado : String = ''); override;
    Procedure CNF(Rede, NSU, Finalizacao : String;
       DocumentoVinculado : String = ''); override;
    Function CNC(Rede, NSU : String; DataHoraTransacao : TDateTime;
       Valor : Double) : Boolean; overload; override;
    Function PRE(Valor : Double; DocumentoVinculado : String = '';
       Moeda : Integer = 0) : Boolean; override;
    function CDP(const EntidadeCliente: string; out Resposta: string): Boolean; override;
  published
    property CNPJEstabelecimento: String read GetCNPJEstabelecimento write SetCNPJEstabelecimento;
    property PontoCaptura: String read GetPontoCaptura write SetPontoCaptura;
    property SuportaViasDiferenciadas: Boolean read GetSuportaViasDiferenciadas
      write SetSuportaViasDiferenciadas;
    property UtilizaSaldoTotalVoucher: Boolean read GetUtilizaSaldoTotalVoucher
      write SetUtilizaSaldoTotalVoucher;

    property OperacaoATV: Word read fOperacaoATV write fOperacaoATV default PWOPER_NULL;
    property OperacaoADM: Word read fOperacaoADM write fOperacaoADM default PWOPER_ADMIN;
    property OperacaoCRT: Word read fOperacaoCRT write fOperacaoCRT default PWOPER_SALE;
    property OperacaoCHQ: Word read fOperacaoCHQ write fOperacaoCHQ default PWOPER_CHECKINQ;
    property OperacaoCNC: Word read fOperacaoCNC write fOperacaoCNC default PWOPER_SALEVOID;
    property OperacaoPRE: Word read fOperacaoPRE write fOperacaoPRE default PWOPER_PREPAID;

    property OnExibeMenu: TACBrTEFPGWebAPIExibeMenu read GetOnExibeMenu write SetOnExibeMenu;
    property OnObtemCampo: TACBrTEFPGWebAPIObtemCampo read GetOnObtemCampo write SetOnObtemCampo;
    property OnExibeMensagem: TACBrTEFPGWebAPIExibeMensagem read GetOnExibeMensagem write SetOnExibeMensagem;
    property OnAguardaPinPad: TACBrTEFPGWebAPIAguardaPinPad read GetOnAguardaPinPad write SetOnAguardaPinPad;
  end;

function MoedaToISO4217(AMoeda: Byte): Word;
function ISO4217ToMoeda(AIso4217: Word): Byte;

implementation

uses
  strutils, math, dateutils,
  ACBrTEFD, ACBrUtil, ACBrConsts;

function MoedaToISO4217(AMoeda: Byte): Word;
begin
  case AMoeda of
    0: Result := 986;    // BRL
    1: Result := 840;    // USD
    2: Result := 978;    // EUR
  else
    Result := AMoeda;
  end;
end;

function ISO4217ToMoeda(AIso4217: Word): Byte;
begin
  case AIso4217 of
    986: Result := 0;    // BRL
    840: Result := 1;    // USD
    978: Result := 2;    // EUR
  else
    Result := AIso4217;
  end;
end;

{ TACBrTEFDRespPayGoWeb }

procedure TACBrTEFDRespPayGoWeb.ConteudoToComprovantes;
var
  ViasDeComprovante: Integer;
  ImprimirViaCliente, ImprimirViaEstabelecimento: Boolean;
  ViaCompleta, ViaDiferenciada: String;
begin
  {
  PWINFO_RCPTPRN      F4h 1 Indica quais vias de comprovante devem ser impressas:
                          0: n�o h� comprovante, 1: imprimir somente a via do Cliente,
                          2: imprimir somente a via do Estabelecimento, 3: imprimir ambas as vias do Cliente e do Estabelecimento
  PWINFO_RCPTFULL     52h Comprovante para impress�o � Via completa.
                          At� 40 colunas, quebras de linha identificadas pelo caractere 0Dh.
  PWINFO_RCPTMERCH    53h Comprovante para impress�o � Via diferenciada para o Estabelecimento.
                          At� 40 colunas, quebras de linha identificadas pelo caractere 0Dh.
  PWINFO_RCPTCHOLDER  54h Comprovante para impress�o � Via diferenciada para o Cliente.
                          At� 40 colunas, quebras de linha identificadas pelo caractere 0Dh.
  PWINFO_RCPTCHSHORT  55h Comprovante para impress�o � Cupom reduzido (para o Cliente).
                          At� 40 colunas, quebras de linha identificadas pelo caractere 0Dh.
  }

  ViasDeComprovante := LeInformacao(PWINFO_RCPTPRN, 0).AsInteger;
  ImprimirViaCliente := (ViasDeComprovante = 1) or (ViasDeComprovante = 3);
  ImprimirViaEstabelecimento := (ViasDeComprovante = 2) or (ViasDeComprovante = 3);

  ViaCompleta := LeInformacao(PWINFO_RCPTFULL, 0).AsBinary;

  // Verificando Via do Estabelecimento
  if ImprimirViaEstabelecimento then
  begin
    ViaDiferenciada := LeInformacao(PWINFO_RCPTMERCH, 0).AsBinary;
    if (Trim(ViaDiferenciada) <> '') then
      fpImagemComprovante2aVia.Text := ViaDiferenciada
    else
      fpImagemComprovante2aVia.Text := ViaCompleta;
  end
  else
    fpImagemComprovante2aVia.Clear;

  // Verificando Via do Cliente
  if ImprimirViaCliente then
  begin
    ViaDiferenciada := LeInformacao(PWINFO_RCPTCHSHORT, 0).AsBinary;
    if (Trim(ViaDiferenciada) = '') then
      ViaDiferenciada := LeInformacao(PWINFO_RCPTCHOLDER, 0).AsBinary;

    if (Trim(ViaDiferenciada) <> '') then
      fpImagemComprovante1aVia.Text := ViaDiferenciada
    else
      fpImagemComprovante1aVia.Text := ViaCompleta;
  end
  else
    fpImagemComprovante1aVia.Clear;

  fpQtdLinhasComprovante := max(fpImagemComprovante1aVia.Count, fpImagemComprovante2aVia.Count);
end;

procedure TACBrTEFDRespPayGoWeb.ConteudoToParcelas;
var
  DataParcela: TDateTime;
  ValorParcela: Double;
  I: Integer;
  Parc: TACBrTEFRespParcela;
begin
  fpParcelas.Clear;

  fpQtdParcelas := LeInformacao(PWINFO_INSTALLMENTS, 0).AsInteger;
  if (fpQtdParcelas > 0) then
  begin
    DataParcela := LeInformacao(PWINFO_INSTALLMDATE, 0).AsDate;
    ValorParcela := LeInformacao(PWINFO_INSTALLM1AMT, 0).AsFloat;

    for I := 1 to fpQtdParcelas do
    begin
      Parc := TACBrTEFRespParcela.create;
      Parc.Vencimento := DataParcela;
      Parc.Valor := ValorParcela;
      Parc.NSUParcela := fpNSU;
      fpParcelas.Add(Parc);

      ValorParcela := LeInformacao(PWINFO_INSTALLMAMNT, 0).AsFloat;
      DataParcela := IncDay(DataParcela,30);
    end;
  end;
end;

procedure TACBrTEFDRespPayGoWeb.ConteudoToProperty;
var
  I, AInt: Integer;
  LinStr: String;
  Linha: TACBrTEFLinha;
begin
  fpImagemComprovante1aVia.Clear;
  fpImagemComprovante2aVia.Clear;
  fpDebito := False;
  fpCredito := False;
  fpDigitado := False;
  fpTaxaServico := 0;
  fpDataHoraTransacaoCancelada := 0;

  for I := 0 to Conteudo.Count - 1 do
  begin
    Linha := Conteudo.Linha[I];
    LinStr := Linha.Informacao.AsBinary;

    case Linha.Identificacao of
      PWINFO_TOTAMNT:
        fpValorTotal := Linha.Informacao.AsFloat;

      PWINFO_DISCOUNTAMT:
        fpDesconto := Linha.Informacao.AsFloat;

      PWINFO_CASHBACKAMT:
        fpSaque := Linha.Informacao.AsFloat;

      PWINFO_CURRENCY:
      begin
        AInt := Linha.Informacao.AsInteger;
        fpMoeda := ISO4217ToMoeda(AInt);
      end;

      PWINFO_CNFREQ:
        fpConfirmar := (Trim(Linstr)='1');

      PWINFO_FISCALREF:
        fpDocumentoVinculado := LinStr;

      PWINFO_CARDTYPE:
      begin
        // 1: cr�dito, 2: d�bito, 4: voucher/PAT, 8: private label, 16: frota, 128: outros
        AInt := Linha.Informacao.AsInteger;
        fpCredito := (AInt = 1);
        fpDebito := (AInt = 2);
      end;

      PWINFO_CARDENTMODE:
      begin
        // 1: digitado, 2: tarja magn�tica, 4: chip com contato, 16: fallback de chip para tarja,
        // 32: chip sem contato simulando tarja (cliente informa tipo efetivamente utilizado),
        // 64: chip sem contato EMV (cliente informa tipo efetivamente, utilizado),
        // 256: fallback de tarja para digitado
        AInt := Linha.Informacao.AsInteger;
        fpDigitado := (AInt = 1) or (AInt = 256);
      end;

      PWINFO_CARDFULLPAN:
      begin
        fpBin := LinStr;
        fpNFCeSAT.UltimosQuatroDigitos := RightStr(LinStr,4);
      end;

      PWINFO_CARDPARCPAN:
      begin
        if (fpNFCeSAT.UltimosQuatroDigitos = '') then
          fpNFCeSAT.UltimosQuatroDigitos := RightStr(LinStr,4);
      end;

      PWINFO_DEFAULTCARDPARCPAN:
        fpNFCeSAT.UltimosQuatroDigitos := RightStr(LinStr,4);

      PWINFO_CARDEXPDATE:
        fpNFCeSAT.DataExpiracao := LinStr;

      PWINFO_DATETIME:
        fpDataHoraTransacaoLocal := Linha.Informacao.AsTimeStampSQL;

      PWINFO_AUTDATETIME:
        fpDataHoraTransacaoHost :=  Linha.Informacao.AsTimeStampSQL;

      PWINFO_AUTHSYST:
        fpRede := LinStr;

      PWINFO_CARDNAME:
      begin
        fpCodigoBandeiraPadrao := LinStr;
        if (fpNFCeSAT.Bandeira = '') then
          fpNFCeSAT.Bandeira := LinStr;
      end;

      PWINFO_CARDNAMESTD:
      begin
        fpNomeAdministradora := LinStr;
        fpNFCeSAT.Bandeira := LinStr;
      end;

      PWINFO_CHOLDERNAME:
        fpNFCeSAT.DonoCartao := LinStr;

      PWINFO_AUTLOCREF:
        fpFinalizacao := LinStr;

      PWINFO_AUTEXTREF:
      begin
        fpNSU := LinStr;
        fpNFCeSAT.Autorizacao := fpNSU;
      end;

      PWINFO_REQNUM:
        fpCodigoAutorizacaoTransacao := LinStr;

      PWINFO_VIRTMERCH:
        fpEstabelecimento := LinStr;

      //PWINFO_AUTHCODE:
      //  fpCodigoAutorizacaoTransacao := LinStr;

      //PWINFO_AUTRESPCODE:
      //  fpAutenticacao := LinStr;

      PWINFO_FINTYPE:
      begin
        // 1: � vista, 2: parcelado pelo emissor, 4: parcelado pelo estabelecimento, 8: pr�-datado, 16: cr�dito emissor
        AInt := Linha.Informacao.AsInteger;
        if (AInt = 2) then
        begin
          fpParceladoPor := parcADM;
          fpTipoOperacao := opParcelado;
        end
        else if (AInt = 4) then
        begin
          fpParceladoPor := parcLoja;
          fpTipoOperacao := opParcelado;
        end
        else if (AInt = 8) then
        begin
          fpParceladoPor := parcNenhum;
          fpTipoOperacao := opPreDatado;
        end
        else if (AInt = 16) then
        begin
          fpParceladoPor := parcNenhum;
          fpTipoOperacao := opOutras;
        end
        else
        begin
          fpParceladoPor := parcNenhum;
          fpTipoOperacao := opAvista;
        end
      end;

      PWINFO_INSTALLMDATE:
        fpDataPreDatado := Linha.Informacao.AsDate;

      PWINFO_BOARDINGTAX, PWINFO_TIPAMOUNT:
        fpTaxaServico := fpTaxaServico + Linha.Informacao.AsFloat;

      PWINFO_TRNORIGDATE:
        fpDataHoraTransacaoCancelada := fpDataHoraTransacaoCancelada + StringToDateTime(LinStr, 'DDMMYY');

      PWINFO_TRNORIGTIME:
        fpDataHoraTransacaoCancelada := fpDataHoraTransacaoCancelada + StringToDateTime(LinStr, 'HHNNSS');

      PWINFO_TRNORIGNSU:
        fpNSUTransacaoCancelada := LinStr;

      PWINFO_TRNORIGAMNT:
        fpValorOriginal := Linha.Informacao.AsFloat;

      PWINFO_AUTHPOSQRCODE:
        fpQRCode := LinStr;

      //PWINFO_PRODUCTID   3Eh at� 8 Identifica��o do produto utilizado, de acordo com a nomenclatura do Provedor.
      //PWINFO_PRODUCTNAME 2Ah at� 20 Nome/tipo do produto utilizado, na nomenclatura do Provedor
      //PWINFO_AUTMERCHID  38h at� 50 Identificador do estabelecimento para o Provedor (c�digo de afilia��o)
      //PWINFO_TRANSACDESCRIPT 1F40h At� 80 Descritivo da transa��o realizada, por exemplo, CREDITO A VISTA ou VENDA PARCELADA EM DUAS VEZES.
    else
      ProcessarTipoInterno(Linha);
    end;
  end;

  ConteudoToComprovantes;
  ConteudoToParcelas;

  if (fpTipoOperacao <> opPreDatado) then
    fpDataPreDatado := 0;

  if (LeInformacao(PWINFO_RET, 0).AsInteger = PWRET_OK) then
    fpTextoEspecialOperador := LeInformacao(PWINFO_RESULTMSG, 0).AsBinary
  else
    fpTextoEspecialOperador := LeInformacao(PWINFO_CNCDSPMSG, 0).AsBinary;

  if (Trim(fpTextoEspecialOperador) = '') then
    fpTextoEspecialOperador := 'TRANSACAO FINALIZADA'
  else if (copy(fpTextoEspecialOperador,1,1) = CR) then
    fpTextoEspecialOperador := copy(fpTextoEspecialOperador, 2, Length(fpTextoEspecialOperador));
end;

{ TACBrTEFDPayGoWeb }

constructor TACBrTEFDPayGoWeb.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  fsPGWebAPI := TACBrTEFPGWebAPI.Create;
  fsPGWebAPI.OnGravarLog := GravaLogAPI;

  ArqReq := '';
  ArqResp := '';
  ArqSTS := '';
  ArqTemp := '';
  GPExeName := '';
  fpTipo := gpPayGoWeb;
  Name := 'PayGoWeb';

  fOperacaoATV := PWOPER_NULL;
  fOperacaoADM := PWOPER_ADMIN;
  fOperacaoCRT := PWOPER_SALE;
  fOperacaoCHQ := PWOPER_CHECKINQ;
  fOperacaoCNC := PWOPER_SALEVOID;
  fOperacaoPRE := PWOPER_PREPAID;

  if Assigned(fpResp) then
    fpResp.Free ;

  fpResp := TACBrTEFDRespPayGoWeb.Create;
  fpResp.TipoGP := fpTipo;
end;

destructor TACBrTEFDPayGoWeb.Destroy;
begin
  fsPGWebAPI.Free;
  inherited Destroy;
end;

procedure TACBrTEFDPayGoWeb.Inicializar;
begin
  if Inicializado then
    Exit;

  fsPGWebAPI.SoftwareHouse := TACBrTEFD(Owner).Identificacao.SoftwareHouse;
  fsPGWebAPI.NomeAplicacao := TACBrTEFD(Owner).Identificacao.NomeAplicacao;
  fsPGWebAPI.VersaoAplicacao := TACBrTEFD(Owner).Identificacao.VersaoAplicacao;
  fsPGWebAPI.SuportaDesconto := TACBrTEFD(Owner).SuportaDesconto;
  fsPGWebAPI.SuportaSaque := TACBrTEFD(Owner).SuportaSaque;
  fsPGWebAPI.ImprimirViaClienteReduzida := TACBrTEFD(Owner).ImprimirViaClienteReduzida;

  fsPGWebAPI.Inicializada := True;
  GravaLog( Name +' Inicializado '+Name );

  VerificarTransacoesPendentesClass(True);
  fpInicializado := True;
end;

procedure TACBrTEFDPayGoWeb.DesInicializar;
begin
  fsPGWebAPI.Inicializada := False; ;
  inherited DesInicializar;
end;

procedure TACBrTEFDPayGoWeb.AtivarGP;
begin
  raise EACBrTEFDErro.Create( ACBrStr( 'AtivarGP n�o se aplica a '+Name )) ;
end;

procedure TACBrTEFDPayGoWeb.LerRespostaRequisicao;
begin
  {Nada a Fazer}
end;

procedure TACBrTEFDPayGoWeb.FinalizarResposta(ApagarArqResp: Boolean);
begin
  {Nada a Fazer}
end;

procedure TACBrTEFDPayGoWeb.VerificaAtivo;
begin
  {Nada a Fazer}
end;

procedure TACBrTEFDPayGoWeb.ATV;
begin
  FazerRequisicao(fOperacaoATV, 'ATV');
  if ContinuarRequisicao then
    ProcessarResposta;
end;

function TACBrTEFDPayGoWeb.ADM: Boolean;
begin
  FazerRequisicao(fOperacaoADM, 'ADM');
  Result := ContinuarRequisicao;
  if Result then
    ProcessarResposta;
end;

function TACBrTEFDPayGoWeb.CRT(Valor: Double; IndiceFPG_ECF: String;
  DocumentoVinculado: String; Moeda: Integer): Boolean;
begin
  if (Valor <> 0) then
    VerificarTransacaoPagamento( Valor );

  FazerRequisicao(fOperacaoCRT, 'CRT', Valor, DocumentoVinculado, Moeda);
  Result := ContinuarRequisicao and
            ProcessarRespostaPagamento(IndiceFPG_ECF, Valor);
end;

function TACBrTEFDPayGoWeb.CHQ(Valor: Double; IndiceFPG_ECF: String;
  DocumentoVinculado: String; CMC7: String; TipoPessoa: AnsiChar;
  DocumentoPessoa: String; DataCheque: TDateTime; Banco: String;
  Agencia: String; AgenciaDC: String; Conta: String; ContaDC: String;
  Cheque: String; ChequeDC: String; Compensacao: String): Boolean;
begin
  if (Valor <> 0) then
    VerificarTransacaoPagamento( Valor );

  FazerRequisicao(fOperacaoCHQ, 'CHQ', Valor, DocumentoVinculado);
  Result := ContinuarRequisicao and
            ProcessarRespostaPagamento(IndiceFPG_ECF, Valor);
end;

procedure TACBrTEFDPayGoWeb.NCN(Rede, NSU, Finalizacao: String; Valor: Double;
  DocumentoVinculado: String);
begin
  fsPGWebAPI.FinalizarTrancao( PWCNF_REV_FISC_AUT,
                               Resp.CodigoAutorizacaoTransacao,
                               Finalizacao,
                               NSU,
                               Resp.Estabelecimento,
                               Rede);
end;

procedure TACBrTEFDPayGoWeb.CNF(Rede, NSU, Finalizacao: String;
  DocumentoVinculado: String);
begin
  fsPGWebAPI.FinalizarTrancao( PWCNF_CNF_AUTO,
                               Resp.CodigoAutorizacaoTransacao,
                               Finalizacao,
                               NSU,
                               Resp.Estabelecimento,
                               Rede);
end;

function TACBrTEFDPayGoWeb.CNC(Rede, NSU: String; DataHoraTransacao: TDateTime;
  Valor: Double): Boolean;
var
  PA: TACBrTEFPGWebAPIParametrosAdicionais;
begin
  PA := TACBrTEFPGWebAPIParametrosAdicionais.Create;
  try
    PA.ValueInfo[PWINFO_TRNORIGDATE] := FormatDateTime('DDMMAA', DataHoraTransacao);
    PA.ValueInfo[PWINFO_TRNORIGTIME] := FormatDateTime('hhnnss', DataHoraTransacao);
    PA.ValueInfo[PWINFO_TRNORIGNSU] := NSU;
    PA.ValueInfo[PWINFO_TRNORIGAMNT] :=  IntToStr(Trunc(RoundTo(Valor * 100,-2)));
    PA.ValueInfo[PWINFO_TRNORIGAUTH] := ''; // C�digo de autoriza��o da transa��o original.

    FazerRequisicao(fOperacaoCNC, 'CNC', 0, '', 0, PA);
  finally
    PA.Free;
  end;

  Result := ContinuarRequisicao;
  if Result then
    ProcessarResposta;
end;

function TACBrTEFDPayGoWeb.PRE(Valor: Double; DocumentoVinculado: String;
  Moeda: Integer): Boolean;
begin
  FazerRequisicao(fOperacaoPRE, 'PRE', Valor, DocumentoVinculado, Moeda);
  Result := ContinuarRequisicao;
  if Result then
    ProcessarResposta;
end;

function TACBrTEFDPayGoWeb.CDP(const EntidadeCliente: string; out
  Resposta: string): Boolean;
begin
  Result := inherited CDP(EntidadeCliente, Resposta);
end;

procedure TACBrTEFDPayGoWeb.FazerRequisicao(PWOPER: Word; AHeader: String;
  AValor: Double; ADocumentoVinculado: String; AMoeda: Integer;
  ParametrosAdicionaisTransacao: TStrings);
var
  PA: TACBrTEFPGWebAPIParametrosAdicionais;
begin
  GravaLog('FazerRequisicao: Oper:'+PWOPERToString(PWOPER)+', Header:'+AHeader+
           ', Valor:'+FloatToStr(AValor)+', Documento:'+ADocumentoVinculado);

  { Transa��o a ser enviada � pagamento ? (CRT ou CHQ) }
  if TransacaoEPagamento(AHeader) then
  begin
     { PayGo n�o permite multiplas transa��es Pendentes... precisamos confirma a
       transa��o anterior antes de enviar uma nova }
     if TACBrTEFD(Owner).MultiplosCartoes then      // � multiplos cartoes ?
        ConfirmarTransacoesAnteriores;
  end;

  Req.Header := AHeader;
  Req.DocumentoVinculado := ADocumentoVinculado;
  Req.ValorTotal := AValor;

  PA := TACBrTEFPGWebAPIParametrosAdicionais.Create;
  try
    if (AValor > 0) then
    begin
      PA.ValueInfo[PWINFO_CURREXP] := '2'; // centavos
      PA.ValueInfo[PWINFO_TOTAMNT] := IntToStr(Trunc(RoundTo(AValor * 100,-2)));
      PA.ValueInfo[PWINFO_CURRENCY] := IntToStr(MoedaToISO4217(AMoeda));
    end;

    if (ADocumentoVinculado <> '') then
      PA.ValueInfo[PWINFO_FISCALREF] := Trim(ADocumentoVinculado);

    if Assigned(ParametrosAdicionaisTransacao) then
      PA.AddStrings(ParametrosAdicionaisTransacao);

    fsPGWebAPI.IniciarTransacao(PWOPER, PA);
  finally
    PA.Free;
  end;

  { Adiciona Campos j� conhecidos em Resp, para processa-los em
    m�todos que manipulam "RespostasPendentes" (usa c�digos do G.P.)  }
  Resp.Clear;
  with TACBrTEFDRespPayGoWeb( Resp ) do
  begin
    fpIDSeq := fpIDSeq + 1 ;
    if ADocumentoVinculado = '' then
      ADocumentoVinculado := IntToStr(fpIDSeq) ;

    Conteudo.GravaInformacao(899,100, AHeader ) ;
    Conteudo.GravaInformacao(899,101, IntToStr(fpIDSeq) ) ;
    Conteudo.GravaInformacao(899,102, ADocumentoVinculado ) ;

    Resp.TipoGP := fpTipo;
  end;
end;

function TACBrTEFDPayGoWeb.ContinuarRequisicao: Boolean;
begin
  try
    Result := fsPGWebAPI.ExecutarTransacao;
  finally
    ObterDadosTransacao;
  end;
end;

procedure TACBrTEFDPayGoWeb.ObterDadosTransacao;
var
  i, p, AInfo: Integer;
  Lin, AValue: String;
begin
  if (fsPGWebAPI.DadosDaTransacao.Count = 0) then
    fsPGWebAPI.ObterDadosDaTransacao;

  with TACBrTEFDRespPayGoWeb(Resp) do
  begin
    for i := 0 to fsPGWebAPI.DadosDaTransacao.Count-1 do
    begin
      Lin := fsPGWebAPI.DadosDaTransacao[i];
      p := pos('=', Lin);
      if (p > 0) then
      begin
        AInfo := StrToIntDef(copy(Lin, 1, p-1), -1);
        if (AInfo >= 0) then
        begin
          AValue := copy(Lin, P+1, Length(Lin));
          Conteudo.GravaInformacao(Ainfo, 0, AValue);
        end;
      end;
    end;
    
    //DEBUG
    //Conteudo.Conteudo.SaveToFile('c:\temp\PGWeb.txt');
    ConteudoToProperty;
  end;
end;

function TACBrTEFDPayGoWeb.GetPathDLL: string;
begin
  Result := fsPGWebAPI.PathDLL;
end;

function TACBrTEFDPayGoWeb.GetPontoCaptura: String;
begin
  Result := fsPGWebAPI.PontoCaptura;
end;

function TACBrTEFDPayGoWeb.GetSuportaViasDiferenciadas: Boolean;
begin
  Result := fsPGWebAPI.SuportaViasDiferenciadas;
end;

function TACBrTEFDPayGoWeb.GetUtilizaSaldoTotalVoucher: Boolean;
begin
  Result := fsPGWebAPI.UtilizaSaldoTotalVoucher;
end;

procedure TACBrTEFDPayGoWeb.SetCNPJEstabelecimento(AValue: String);
begin
  fsPGWebAPI.CNPJEstabelecimento := AValue;
end;

function TACBrTEFDPayGoWeb.GetDiretorioTrabalho: String;
begin
  Result := fsPGWebAPI.DiretorioTrabalho;
end;

function TACBrTEFDPayGoWeb.GetCNPJEstabelecimento: String;
begin
  Result := fsPGWebAPI.CNPJEstabelecimento;
end;

function TACBrTEFDPayGoWeb.GetOnAguardaPinPad: TACBrTEFPGWebAPIAguardaPinPad;
begin
  Result := fsPGWebAPI.OnAguardaPinPad;
end;

function TACBrTEFDPayGoWeb.GetOnExibeMensagem: TACBrTEFPGWebAPIExibeMensagem;
begin
  Result := fsPGWebAPI.OnExibeMensagem;
end;

function TACBrTEFDPayGoWeb.GetOnExibeMenu: TACBrTEFPGWebAPIExibeMenu;
begin
  Result := fsPGWebAPI.OnExibeMenu;
end;

function TACBrTEFDPayGoWeb.GetOnObtemCampo: TACBrTEFPGWebAPIObtemCampo;
begin
  Result := fsPGWebAPI.OnObtemCampo;
end;

procedure TACBrTEFDPayGoWeb.SetDiretorioTrabalho(AValue: String);
begin
  fsPGWebAPI.DiretorioTrabalho := AValue;
end;

procedure TACBrTEFDPayGoWeb.SetOnAguardaPinPad(AValue: TACBrTEFPGWebAPIAguardaPinPad);
begin
  fsPGWebAPI.OnAguardaPinPad := AValue;
end;

procedure TACBrTEFDPayGoWeb.SetOnExibeMensagem(AValue: TACBrTEFPGWebAPIExibeMensagem);
begin
  fsPGWebAPI.OnExibeMensagem := AValue;
end;

procedure TACBrTEFDPayGoWeb.SetOnExibeMenu(AValue: TACBrTEFPGWebAPIExibeMenu);
begin
  fsPGWebAPI.OnExibeMenu := AValue;
end;

procedure TACBrTEFDPayGoWeb.SetOnObtemCampo(AValue: TACBrTEFPGWebAPIObtemCampo);
begin
  fsPGWebAPI.OnObtemCampo := AValue;
end;

procedure TACBrTEFDPayGoWeb.SetPathDLL(AValue: string);
begin
  fsPGWebAPI.PathDLL := AValue;
end;

procedure TACBrTEFDPayGoWeb.GravaLogAPI(const ALogLine: String;
  var Tratado: Boolean);
begin
  GravaLog(ALogLine);
end;

function TACBrTEFDPayGoWeb.GetParametrosAdicionais: TACBrTEFPGWebAPIParametrosAdicionais;
begin
  Result := fsPGWebAPI.ParametrosAdicionais;
end;

procedure TACBrTEFDPayGoWeb.SetSuportaViasDiferenciadas(AValue: Boolean);
begin
  fsPGWebAPI.SuportaViasDiferenciadas := AValue;
end;

procedure TACBrTEFDPayGoWeb.SetUtilizaSaldoTotalVoucher(AValue: Boolean);
begin
  fsPGWebAPI.UtilizaSaldoTotalVoucher := AValue;
end;

procedure TACBrTEFDPayGoWeb.SetPontoCaptura(AValue: String);
begin
  fsPGWebAPI.PontoCaptura := AValue;
end;

end.

