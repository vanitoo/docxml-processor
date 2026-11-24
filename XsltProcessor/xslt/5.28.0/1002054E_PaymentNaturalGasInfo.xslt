<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:CategoryCust="urn:customs.ru:Categories:3.0.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:pngi="urn:customs.ru:Information:CommercialFinanceDocuments:PaymentNaturalGasInfo:5.25.0" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:ns1="urn:customs.ru:Information:CommercialFinanceDocuments:PaymentNaturalGasInfo:5.25.0">
  <!-- Шаблон для типа PaymentNaturalGasInfoType -->
  <xsl:template match="pngi:PaymentNaturalGasInfo">
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
                    <b>Сведения о соблюдении порядка оплаты природного газа, представленные Банком России и декларантом</b>
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
          <br />
          <xsl:if test="pngi:RepType">
            <table>
              <tr>
                <td class="annot graphMain" style="width:50%">Тип отчета</td>
                <td class="value graphMain" style="width:50%">
                  <xsl:apply-templates select="pngi:RepType" />
                </td>
              </tr>
            </table>
          </xsl:if>
          <xsl:if test="pngi:DocDateTime">
            <table>
              <tr>
                <td class="annot graphMain" style="width:50%">Дата и время формирования сообщения</td>
                <td class="value graphMain" style="width:50%">
                  <xsl:apply-templates select="pngi:DocDateTime" mode="russian_date" />
				  <xsl:value-of select="substring(pngi:DocDateTime,12,7)" />
                </td>
              </tr>
            </table>
          </xsl:if>
          <xsl:if test="pngi:DocName">
            <table>
              <tr>
                <td class="annot graphMain" style="width:50%">Наименование сообщения</td>
                <td class="value graphMain" style="width:50%">
                  <xsl:apply-templates select="pngi:DocName" />
                </td>
              </tr>
            </table>
          </xsl:if>
          <xsl:if test="pngi:REGN">
            <table>
              <tr>
                <td class="annot graphMain" style="width:50%">Реквизиты уполномоченного банка (филиала уполномоченного банка), сформировавшего сообщение</td>
                <td class="value graphMain" style="width:50%">
                  <xsl:apply-templates select="pngi:REGN" />
                </td>
              </tr>
            </table>
          </xsl:if>
          <xsl:if test="pngi:DocInfo">
            <div class="title marg-top">Сведения о документе, выданном уполномоченным банком Информации о соблюдении</div>
            <div>
              <xsl:apply-templates select="pngi:DocInfo" />
            </div>
          </xsl:if>
          <table>
            <tr>
              <td class="annot graphMain" style="width:50%">Уникальный номер внешнеторгового контракта</td>
              <td class="value graphMain" style="width:50%">
                <xsl:apply-templates select="pngi:N_PC" />
              </td>
            </tr>
          </table>
          <table>
            <tr>
              <td class="annot graphMain" style="width:50%">Регистрационный номер банка / филиала банка, обслуживающего контракт</td>
              <td class="value graphMain" style="width:50%">
                <xsl:apply-templates select="pngi:REGN_B_FILL_B" />
              </td>
            </tr>
          </table>
          <xsl:if test="pngi:ResidentInfo">
            <div class="title marg-top">Сведения о резиденте</div>
            <div>
              <xsl:apply-templates select="pngi:ResidentInfo">
                <xsl:with-param name="wdth" select="$w" />
              </xsl:apply-templates>
            </div>
          </xsl:if>
          <xsl:if test="pngi:ContragentInfo">
            <div class="title marg-top">Сведения о контрагенте</div>
            <div>
              <xsl:apply-templates select="pngi:ContragentInfo">
                <xsl:with-param name="wdth" select="$w" />
              </xsl:apply-templates>
            </div>
          </xsl:if>
          <table>
            <tr>
              <td class="annot graphMain" style="width:50%">Дата платежа</td>
              <td class="value graphMain" style="width:50%">
                <xsl:apply-templates select="pngi:D_PLAT" mode="russian_date" />
              </td>
            </tr>
          </table>
          <xsl:if test="pngi:KVALP_Let">
            <table>
              <tr>
                <td class="annot graphMain" style="width:50%">Код валюты платежа (символьный)</td>
                <td class="value graphMain" style="width:50%">
                  <xsl:apply-templates select="pngi:KVALP_Let" />
                </td>
              </tr>
            </table>
          </xsl:if>
          <xsl:if test="pngi:KVALP_Num">
            <table>
              <tr>
                <td class="annot graphMain" style="width:50%">Код валюты платежа (цифровой)</td>
                <td class="value graphMain" style="width:50%">
                  <xsl:apply-templates select="pngi:KVALP_Num" />
                </td>
              </tr>
            </table>
          </xsl:if>
          <table>
            <tr>
              <td class="annot graphMain" style="width:50%">Сумма платежа в валюте платежа</td>
              <td class="value graphMain" style="width:50%">
                <xsl:apply-templates select="pngi:SUMMAP" mode="translate_number" />
              </td>
            </tr>
          </table>
          <xsl:if test="pngi:LastDate">
			  <table>
				<tr>
				  <td class="annot graphMain" style="width:50%">Наиболее поздняя дата платежа, содержащегося в ведомости банковского контроля</td>
				  <td class="value graphMain" style="width:50%">
					<xsl:apply-templates select="pngi:LastDate" mode="russian_date" />
				  </td>
				</tr>
			  </table>
          </xsl:if>
          <table>
            <tr>
              <td class="annot graphMain" style="width:50%">Признак соблюдения оплаты природного газа в порядке, установленном Указом Президента РФ от 31.03.2022 № 172</td>
              <td class="value graphMain" style="width:50%">
                <xsl:choose>
					<xsl:when test="pngi:INFO_RES='0'">Требования не соблюдены</xsl:when>
					<xsl:when test="pngi:INFO_RES='1'">Требования соблюдены</xsl:when>
					<xsl:otherwise>
						<xsl:apply-templates select="pngi:INFO_RES" />
					</xsl:otherwise>
				</xsl:choose>
              </td>
            </tr>
          </table>
        </div>
      </body>
    </html>
  </xsl:template>
  <!-- Шаблон для типа pngi:ContragentInfoType -->
  <xsl:template match="pngi:ContragentInfo">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <table>
        <tr>
          <td class="annot graphMain" style="width:50%">Наименование контрагента / нерезидента</td>
          <td class="value graphMain" style="width:50%">
            <xsl:apply-templates select="pngi:NAM_CONTRAGENT" />
          </td>
        </tr>
      </table>
      <table>
        <tr>
          <td class="annot graphMain" style="width:50%">Наименование страны контрагента / нерезидента</td>
          <td class="value graphMain" style="width:50%">
            <xsl:apply-templates select="pngi:NSTR_CONTRAGENT" />
          </td>
        </tr>
      </table>
      <table>
        <tr>
          <td class="annot graphMain" style="width:50%">Цифровой код страны контрагента / нерезидента</td>
          <td class="value graphMain" style="width:50%">
            <xsl:apply-templates select="pngi:KSTR_CONTRAGENT" />
          </td>
        </tr>
      </table>
    </div>
  </xsl:template>
  <xsl:template match="pngi:DocInfo">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <xsl:if test="pngi:UCN">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Уникальный номер контракта, присвоенный внешнеторговому контракту при постановке на учет в уполномоченном банке </td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="pngi:UCN" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="pngi:InfoDate">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Дата выдачи уполномоченным банком (филиалом уполномоченного банка) российскому поставщику Информации о соблюдении</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="pngi:InfoDate" mode="russian_date" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="pngi:InfoNum">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Порядковый номер, выданной уполномоченным банком (филиалом уполномоченного банка) Информации о соблюдении</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="pngi:InfoNum" />
            </td>
          </tr>
        </table>
      </xsl:if>
    </div>
  </xsl:template>
  <!-- Шаблон для типа pngi:ResidentInfoType -->
  <xsl:template match="pngi:ResidentInfo">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <table>
        <tr>
          <td class="annot graphMain" style="width:50%">Наименование организации / ФИО физического лица</td>
          <td class="value graphMain" style="width:50%">
            <xsl:apply-templates select="pngi:NAM_RESIDENT" />
          </td>
        </tr>
      </table>
      <table>
        <tr>
          <td class="annot graphMain" style="width:50%">ОГРН/ОГРНИП. Основной государственный регистрационный номер</td>
          <td class="value graphMain" style="width:50%">
            <xsl:apply-templates select="pngi:OGRN" />
          </td>
        </tr>
      </table>
      <table>
        <tr>
          <td class="annot graphMain" style="width:50%">ИНН - Индивидуальный номер налогоплательщика</td>
          <td class="value graphMain" style="width:50%">
            <xsl:apply-templates select="pngi:INN" />
          </td>
        </tr>
      </table>
      <xsl:if test="pngi:KPP">
		  <table>
			<tr>
			  <td class="annot graphMain" style="width:50%">КПП - Код причины постановки на учет</td>
			  <td class="value graphMain" style="width:50%">
				<xsl:apply-templates select="pngi:KPP" />
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
  <xsl:template match="//*[local-name()='PaymentNaturalGasInfo']//*" priority="-1">
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