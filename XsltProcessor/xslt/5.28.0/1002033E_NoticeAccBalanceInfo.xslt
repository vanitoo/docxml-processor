<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" xmlns:naccbi="urn:customs.ru:Information:CommercialFinanceDocuments:NoticeAccBalanceInfo:5.24.0">
  <!-- Шаблон для типа NoticeAccBalanceInfoType -->
  <xsl:template match="naccbi:NoticeAccBalanceInfo">
    <xsl:param name="w" select="190" />
    <html>
      <head>
        <style>
                  body {
                  background: #cccccc;
                  }

                  div
                  {
                  white-space: normal;
                  }

                  div.page {
                  margin: 10px auto;
                  margin-top: 6pt;
                  margin-bottom: 6pt;
                  padding: 10mm 10mm 10mm 20mm;
                  background: #ffffff;
                  border: solid 1pt #000000;
                  }

                  .marg-top
                  {
                  margin-top:5mm;
                  }

                  table
                  {
                  width: 100%;
                  border: 0;
                  empty-cells: show;
                  border-collapse: collapse;
                  margin-top: 1px;
                  }

                  table.border tr td
                  {
                  border: 1px solid windowtext;
                  }

                  .value
                  {
                  border-bottom: solid 1px black;
                  font-family: Arial;
                  font-size: 11pt;
                  font-style: italic;
                  }

                  .annot
                  {
                  font-family: Arial;
                  font-size: 11pt;
                  }


                  .title
                  {
                  font-weight:bold;
                  font-family: Arial;
                  font-size: 11pt;
                  }

                  tr.title td
                  {
                  font-weight:bold;
                  font-family: Arial;
                  font-size: 9pt;
                  }



                  .bordered { border-collapse: collapse; }
                  td.bordered
                  {
                  border: solid 1px windowtext;
                  }

                  td.graphMain
                  {
                  vertical-align:top;
                  }
                  td.value.graphMain
                  {
                  vertical-align:bottom;
                  }
                </style>
      </head>
      <body>
        <div class="page" style="width: {$w}mm;">
          <table>
            <tbody>
              <tr>
                <td align="center" class="title">
                  <font size="4">
                    <xsl:choose>
						<xsl:when test="naccbi:DocumentType = '1'">
							<b>Сообщение об остатках денежных средств (драгоценных металлов) на счетах плательщика (лица, несущего солидарную обязанность) в банке и об остатках электронных денежных средств</b>
						</xsl:when>
						<xsl:when test="naccbi:DocumentType = '2'">
							<b>Сообщение об остатке цифровых рублей, учитываемых на счете цифрового рубля плательщика (лица, несущего солидарную обязанность)</b>
						</xsl:when>
					</xsl:choose>
                  </font>
                </td>
              </tr>
            </tbody>
          </table>
          <br />
          <table>
            <tr>
              <td class="annot graphMain" style="width:50%">Уникальный идентификатор документа</td>
              <td class="value graphMain" style="width:50%">
                <xsl:apply-templates select="cat_ru:DocumentID" />
              </td>
            </tr>
          </table>
          <xsl:if test="cat_ru:RefDocumentID">
            <table>
              <tr>
                <td class="annot graphMain" style="width:50%">Уникальный идентификатор исходного документа</td>
                <td class="value graphMain" style="width:50%">
                  <xsl:apply-templates select="cat_ru:RefDocumentID" />
                </td>
              </tr>
            </table>
          </xsl:if>
          <xsl:if test="naccbi:CustomsOffice">
            <div class="title marg-top">Код и наименование таможенного органа</div>
            <div>
              <xsl:apply-templates select="naccbi:CustomsOffice">
                <xsl:with-param name="wdth" select="$w" />
              </xsl:apply-templates>
            </div>
          </xsl:if>
          <table>
            <tr>
              <td class="annot graphMain" style="width:50%">Дата документа</td>
              <td class="value graphMain" style="width:50%">
                <xsl:apply-templates select="naccbi:DocDate" mode="russian_date" />
              </td>
            </tr>
          </table>
          <table>
            <tr>
              <td class="annot graphMain" style="width:50%">Дата направления электронного документа</td>
              <td class="value graphMain" style="width:50%">
                <xsl:apply-templates select="naccbi:DocAppDate" mode="russian_date" />
              </td>
            </tr>
          </table>
          <table>
            <tr>
              <td class="annot graphMain" style="width:50%">Номер документа</td>
              <td class="value graphMain" style="width:50%">
                <xsl:apply-templates select="naccbi:DocNumber" />
              </td>
            </tr>
          </table>
          <xsl:if test="naccbi:AccountInformation">
            <div class="title marg-top">
				<xsl:choose>
					<xsl:when test="naccbi:DocumentType = '1'">
						Информация о счёте плательщика
					</xsl:when>
					<xsl:when test="naccbi:DocumentType = '2'">
						Информация о счёте цифрового рубля плательщика
					</xsl:when>
				</xsl:choose>
            </div>
            <div>
              <xsl:apply-templates select="naccbi:AccountInformation">
                <xsl:with-param name="wdth" select="$w" />
              </xsl:apply-templates>
            </div>
          </xsl:if>
          <xsl:if test="naccbi:BankInformation">
            <div class="title marg-top">Информация о банке плательщика</div>
            <div>
              <xsl:apply-templates select="naccbi:BankInformation">
                <xsl:with-param name="wdth" select="$w" />
              </xsl:apply-templates>
            </div>
          </xsl:if>
          <xsl:if test="naccbi:DecisionSuspend">
            <div class="title marg-top">
				<xsl:choose>
					<xsl:when test="naccbi:DocumentType = '1'">
						Дата и номер Решения о приостановлении операций по счетам плательщика (лица, несущего солидарную обязанность) в банке и переводов его электронных денежных средств
					</xsl:when>
					<xsl:when test="naccbi:DocumentType = '2'">
						Дата и номер Решения о приостановлении по счету цифрового рубля
					</xsl:when>
				</xsl:choose>
            </div>
            <div>
              <xsl:apply-templates select="naccbi:DecisionSuspend">
                <xsl:with-param name="wdth" select="$w" />
              </xsl:apply-templates>
            </div>
          </xsl:if>
          <xsl:if test="naccbi:Payer">
            <div class="title marg-top">Сведения о плательщике</div>
            <div>
              <xsl:apply-templates select="naccbi:Payer">
                <xsl:with-param name="wdth" select="$w" />
              </xsl:apply-templates>
            </div>
          </xsl:if>
          <xsl:if test="naccbi:Performer">
            <div class="title marg-top">Исполнитель, предоставляющий сведения</div>
            <div>
              <xsl:apply-templates select="naccbi:Performer">
                <xsl:with-param name="wdth" select="$w" />
              </xsl:apply-templates>
            </div>
          </xsl:if>
        </div>
      </body>
    </html>
  </xsl:template>
  <!-- Шаблон для типа naccbi:AccountType -->
  <xsl:template match="naccbi:AccountInformation">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <table>
        <tr>
          <td class="annot graphMain" style="width:50%">Номер счета плательщика</td>
          <td class="value graphMain" style="width:50%">
            <xsl:apply-templates select="naccbi:BankAccount" />
          </td>
        </tr>
      </table>
      <table>
        <tr>
          <td class="annot graphMain" style="width:50%">Описание типа счета: рублевый, валютный</td>
          <td class="value graphMain" style="width:50%">
            <xsl:apply-templates select="naccbi:BankAccountDescription" />
          </td>
        </tr>
      </table>
      <table>
        <tr>
          <td class="annot graphMain" style="width:50%">Вид счета (в соответствии с Инструкцией Банка России от 30.05.2014 № 153-И, для электронных денежных средств – «КЭСП»)</td>
          <td class="value graphMain" style="width:50%">
            <xsl:apply-templates select="naccbi:CEMPId" />
          </td>
        </tr>
      </table>
      <table>
        <tr>
          <td class="annot graphMain" style="width:50%">Остаток денежных средств, электронных денежных средств, цифровых рублей (указывается в руб. и коп. или в иных единицах валюты)</td>
          <td class="value graphMain" style="width:50%">
            <xsl:apply-templates select="naccbi:Balance" mode="translate_number" />
          </td>
        </tr>
      </table>
      <table>
        <tr>
          <td class="annot graphMain" style="width:50%">Код валюты </td>
          <td class="value graphMain" style="width:50%">
            <xsl:apply-templates select="naccbi:CurrencyCode" />
          </td>
        </tr>
      </table>
      <table>
        <tr>
          <td class="annot graphMain" style="width:50%">Дата, по состоянию на которую предоставлена информация об остатке денежных средств на счете <xsl:if test="naccbi:DocumentType = '2'">цифрового рубля</xsl:if></td>
          <td class="value graphMain" style="width:50%">
            <xsl:apply-templates select="naccbi:StateDate" mode="russian_date" />
          </td>
        </tr>
      </table>
    </div>
  </xsl:template>
  <!-- Шаблон для типа naccbi:BankInfoDetailType -->
  <xsl:template match="naccbi:BankInformation">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <table>
        <tr>
          <td class="annot graphMain" style="width:50%">Наименование банка</td>
          <td class="value graphMain" style="width:50%">
            <xsl:apply-templates select="naccbi:BankName" />
          </td>
        </tr>
      </table>
      <table>
        <tr>
          <td class="annot graphMain" style="width:50%">БИК банка</td>
          <td class="value graphMain" style="width:50%">
            <xsl:apply-templates select="naccbi:BICID" />
          </td>
        </tr>
      </table>
      <xsl:if test="naccbi:BankINN">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">ИНН банка</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="naccbi:BankINN" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <table>
        <tr>
          <td class="annot graphMain" style="width:50%">Код банка по КГРКО</td>
          <td class="value graphMain" style="width:50%">
            <xsl:apply-templates select="naccbi:CodeBank" />
          </td>
        </tr>
      </table>
    </div>
  </xsl:template>
  <!-- Шаблон для типа cat_ru:CustomsType -->
  <xsl:template match="naccbi:CustomsOffice">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <table>
        <tr>
          <td class="annot graphMain" style="width:50%">Код таможенного органа</td>
          <td class="value graphMain" style="width:50%">
            <xsl:apply-templates select="cat_ru:Code" />
          </td>
        </tr>
      </table>
      <xsl:if test="cat_ru:OfficeName">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Наименование таможенного органа</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="cat_ru:OfficeName" />
            </td>
          </tr>
        </table>
      </xsl:if>
    </div>
  </xsl:template>
  <!-- Шаблон для типа naccbi:DecisionSuspendType -->
  <xsl:template match="naccbi:DecisionSuspend">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <table>
        <tr>
          <td class="annot graphMain" style="width:50%">Наименование документа (решения)</td>
          <td class="value graphMain" style="width:50%">
            <xsl:apply-templates select="naccbi:PrDocumentName" />
          </td>
        </tr>
      </table>
      <table>
        <tr>
          <td class="annot graphMain" style="width:50%">Номер документа (решения)</td>
          <td class="value graphMain" style="width:50%">
            <xsl:apply-templates select="naccbi:PrDocumentNumber" />
          </td>
        </tr>
      </table>
      <table>
        <tr>
          <td class="annot graphMain" style="width:50%">Дата документа (решения)</td>
          <td class="value graphMain" style="width:50%">
            <xsl:apply-templates select="naccbi:PrDocumentDate" mode="russian_date" />
          </td>
        </tr>
      </table>
    </div>
  </xsl:template>
  <!-- Шаблон для типа naccbi:PayerType -->
  <xsl:template match="naccbi:Payer">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <table>
        <tr>
          <td class="annot graphMain" style="width:50%">Наименование плательщика</td>
          <td class="value graphMain" style="width:50%">
            <xsl:apply-templates select="naccbi:OrganizationName" />
          </td>
        </tr>
      </table>
      <table>
        <tr>
          <td class="annot graphMain" style="width:50%">ИНН плательщика</td>
          <td class="value graphMain" style="width:50%">
            <xsl:apply-templates select="naccbi:INN" />
          </td>
        </tr>
      </table>
      <xsl:if test="naccbi:KPP">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">КПП плательщика</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="naccbi:KPP" />
            </td>
          </tr>
        </table>
      </xsl:if>
    </div>
  </xsl:template>
  <!-- Шаблон для типа naccbi:PersonInfoType -->
  <xsl:template match="naccbi:Performer">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <table>
        <tr>
          <td class="annot graphMain" style="width:50%">Фамилия</td>
          <td class="value graphMain" style="width:50%">
            <xsl:apply-templates select="cat_ru:PersonSurname" />
          </td>
        </tr>
      </table>
      <table>
        <tr>
          <td class="annot graphMain" style="width:50%">Имя</td>
          <td class="value graphMain" style="width:50%">
            <xsl:apply-templates select="cat_ru:PersonName" />
          </td>
        </tr>
      </table>
      <xsl:if test="cat_ru:PersonMiddleName">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Отчество</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="cat_ru:PersonMiddleName" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="cat_ru:PersonPost">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Должность</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="cat_ru:PersonPost" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="naccbi:Phone">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Номер телефона исполнителя</td>
            <td class="graphMain value" style="width:50%">
              <xsl:for-each select="naccbi:Phone">
                <xsl:value-of select="." />
                <xsl:if test="position()!=last()">
                  <xsl:text>, </xsl:text>
                </xsl:if>
              </xsl:for-each>
            </td>
          </tr>
        </table>
      </xsl:if>
    </div>
  </xsl:template>
  <xsl:template name="russian_date">
    <xsl:param name="dateIn" />
    <xsl:choose>
      <xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
        <xsl:value-of select="substring($dateIn,9,2)" />
        <xsl:text>.</xsl:text>
        <xsl:value-of select="substring($dateIn,6,2)" />
        <xsl:text>.</xsl:text>
        <xsl:value-of select="substring($dateIn,1,4)" />
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="$dateIn" />
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  <xsl:template match="//*[local-name()='NoticeAccBalanceInfo']//*" priority="-1">
    <xsl:variable name="xpath">
      <xsl:call-template name="get_xpath">
        <xsl:with-param name="node" select="current()" />
      </xsl:call-template>
    </xsl:variable>
    <element xml_node="{$xpath}">
      <xsl:apply-templates />
    </element>
  </xsl:template>
  <xsl:template name="get_xpath">
    <xsl:param name="node" select="." />
    <xsl:variable name="xpath">
      <xsl:for-each select="$node/ancestor-or-self::*">
        <xsl:variable name="name">
          <xsl:value-of select="name()" />
        </xsl:variable>
        <xsl:variable name="pos">
          <xsl:value-of select="count(node()/parent::*/preceding-sibling::*[name()=$name])" />
        </xsl:variable>
        <xsl:choose>
          <xsl:when test="position()=last()">
            <xsl:value-of select="concat($name,'[',$pos,']')" />
          </xsl:when>
          <xsl:otherwise>
            <xsl:value-of select="concat($name,'[',$pos,']','/')" />
          </xsl:otherwise>
        </xsl:choose>
      </xsl:for-each>
    </xsl:variable>
    <xsl:value-of select="$xpath" />
  </xsl:template>
  <xsl:template match="*" mode="date">
    <xsl:variable name="xpath_date">
      <xsl:call-template name="get_xpath">
        <xsl:with-param name="node" select="." />
      </xsl:call-template>
    </xsl:variable>
    <element xml_node="{$xpath_date}">
      <xsl:call-template name="russian_date">
        <xsl:with-param name="dateIn" select="." />
      </xsl:call-template>
    </element>
  </xsl:template>
  <xsl:template match="*" mode="russian_date">
    <xsl:variable name="xpath_date">
      <xsl:call-template name="get_xpath">
        <xsl:with-param name="node" select="." />
      </xsl:call-template>
    </xsl:variable>
    <element xml_node="{$xpath_date}">
      <xsl:call-template name="russian_date">
        <xsl:with-param name="dateIn" select="." />
      </xsl:call-template>
    </element>
  </xsl:template>
  <xsl:template match="*" mode="translate_number">
    <xsl:variable name="xpath_date">
      <xsl:call-template name="get_xpath">
        <xsl:with-param name="node" select="." />
      </xsl:call-template>
    </xsl:variable>
    <element xml_node="{$xpath_date}">
      <xsl:value-of select="translate(.,'.', ',')" />
    </element>
  </xsl:template>
</xsl:stylesheet>