<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.24.0" xmlns:rpefwg="urn:customs.ru:Information:CustomsDocuments:RefusalProlongExpFreeWHGoods:5.24.0">
	<!-- Шаблон для типа RefusalProlongExpFreeWHGoodsType -->
	<xsl:template match="rpefwg:RefusalProlongExpFreeWHGoods">
		<xsl:param name="w" select="190"/>
		<html>
			<head>
				<style>
					body
					{background: #cccccc;}

					div
					{white-space: normal;}

					div.page
					{margin: 10px auto;
					margin-top: 6pt;
					margin-bottom: 6pt;
					padding: 10mm 10mm 10mm 20mm;
					background: #ffffff;
					border: solid 1pt #000000;}

					.marg-top
					{margin-top:5mm;}

					table
					{width: 100%;
					border: 0;
					empty-cells: show;
					border-collapse: collapse;
					margin-top: 1px;}

					table.border tr td
					{border: 1px solid windowtext;}

					.value
					{border-bottom: solid 1px black;
 					font-family: Arial;
					font-size: 11pt;
					font-style: italic;}

					.annot
					{font-family: Arial;
					font-size: 11pt;}


					.title
					{font-weight: bold;
					font-family: Arial;
					font-size: 11pt;}

					tr.title td
					{font-weight: bold;
					font-family: Arial;
					font-size: 9pt;}

					.bordered
					{border-collapse: collapse;}

					td.bordered
					{border: solid 1px windowtext;}

					td.graphMain
					{vertical-align: top;}

					td.value.graphMain
					{vertical-align: bottom;}
                </style>
			</head>
			<body>
				<div class="page" style="width: {$w}mm;">
					<table>
						<tbody>
							<tr>
								<td align="center" class="title">
									<font size="4">
										<b>Уведомление об отказе в принятии решения о продлении срока вывоза товаров со свободного склада</b>
									</font>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
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
					<br/>
					<xsl:if test="rpefwg:DecisionNumber">
						<table>
							<tr>
								<td class="annot graphMain" style="width:50%">Регистрационный номер Уведомления</td>
								<td class="value graphMain" style="width:50%">
									<xsl:value-of select="rpefwg:DecisionNumber/rpefwg:CustomsCode"/>
									<xsl:text>/</xsl:text>
									<xsl:call-template name="russian_date_gtd">
										<xsl:with-param name="dateIn" select="rpefwg:DecisionNumber/rpefwg:RegistrationDate"/>
									</xsl:call-template>
									<xsl:text>/</xsl:text>
									<xsl:value-of select="rpefwg:DecisionNumber/rpefwg:RegistrationNumber"/>
									<xsl:text>/</xsl:text>
									<xsl:value-of select="rpefwg:DecisionNumber/rpefwg:DocKind"/>
								</td>
							</tr>
						</table>
					</xsl:if>
					<xsl:if test="rpefwg:ExtensionAppNumber">
						<table>
							<tr>
								<td class="annot graphMain" style="width:50%">Регистрационный номер Заявления о продлении срока вывоза, по которому принято решение</td>
								<td class="value graphMain" style="width:50%">
									<xsl:value-of select="rpefwg:ExtensionAppNumber/rpefwg:CustomsCode"/>
									<xsl:text>/</xsl:text>
									<xsl:call-template name="russian_date_gtd">
										<xsl:with-param name="dateIn" select="rpefwg:ExtensionAppNumber/rpefwg:RegistrationDate"/>
									</xsl:call-template>
									<xsl:text>/</xsl:text>
									<xsl:value-of select="rpefwg:ExtensionAppNumber/rpefwg:RegistrationNumber"/>
									<xsl:text>/</xsl:text>
									<xsl:value-of select="rpefwg:ExtensionAppNumber/rpefwg:DocKind"/>
								</td>
							</tr>
						</table>
					</xsl:if>
					<xsl:if test="rpefwg:Customs">
						<div class="title marg-top">Таможенный орган</div>
						<div>
							<xsl:apply-templates select="rpefwg:Customs">
								<xsl:with-param name="wdth" select="$w" />
							</xsl:apply-templates>
						</div>
					</xsl:if>
					<xsl:if test="rpefwg:Applicant">
						<div class="title marg-top">Сведения о заявителе (владельце свободного склада)</div>
						<div>
							<xsl:apply-templates select="rpefwg:Applicant">
								<xsl:with-param name="wdth" select="$w" />
							</xsl:apply-templates>
						</div>
					</xsl:if>
					<table>
						<tr>
							<td class="annot graphMain" style="width:50%">Обоснование отказа таможенного органа в продлении срока вывоза</td>
							<td class="graphMain value" style="width:50%">
								<xsl:for-each select="rpefwg:RefusalReason">
									<xsl:value-of select="." />
									<xsl:if test="position()!=last()">
										<xsl:text>, </xsl:text>
									</xsl:if>
								</xsl:for-each>
							</td>
						</tr>
					</table>
					<xsl:if test="rpefwg:CustomsPerson">
						<div class="title marg-top">Должностное лицо таможенного органа, принявшее Решение</div>
						<div>
							<xsl:apply-templates select="rpefwg:CustomsPerson">
								<xsl:with-param name="wdth" select="$w" />
							</xsl:apply-templates>
						</div>
					</xsl:if>
				</div>
			</body>
		</html>
	</xsl:template>
	<!-- Шаблон для типа RUScat_ru:UnifiedCode20Type -->
	<xsl:template match="RUScat_ru:BusinessEntityTypeCode">
		<xsl:param name="wdth" select="0" />
		<xsl:variable name="w" select="$wdth - 5" />
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Код объекта в соответсвии со справочником (классификатором) </td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="RUScat_ru:UnifiedCode" />
					</td>
				</tr>
			</table>
			<xsl:if test="RUScat_ru:CodeListId">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Обозначение справочника (классификатора), в соответствии с которым указан код</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="RUScat_ru:CodeListId" />
						</td>
					</tr>
				</table>
			</xsl:if>
		</div>
	</xsl:template>
  <!-- Шаблон для типа cat_ru:ContactType -->
  <xsl:template match="RUScat_ru:CommunicationDetails">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <xsl:if test="cat_ru:Phone">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Номер телефона</td>
            <td class="graphMain value" style="width:50%">
              <xsl:for-each select="cat_ru:Phone">
                <xsl:value-of select="." />
                <xsl:if test="position()!=last()">
                  <xsl:text>, </xsl:text>
                </xsl:if>
              </xsl:for-each>
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="cat_ru:Fax">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Номер факса</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="cat_ru:Fax" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="cat_ru:Telex">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Номер телекса</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="cat_ru:Telex" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="cat_ru:E_mail">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Адрес электронной почты</td>
            <td class="graphMain value" style="width:50%">
              <xsl:for-each select="cat_ru:E_mail">
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
  <!-- Шаблон для типа RUScat_ru:RUIdentityCardType -->
  <xsl:template match="RUScat_ru:IdentityCard">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <xsl:if test="RUScat_ru:IdentityCardCode">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Код вида документа, удостоверяющего личность, в соответствии с классификатором видов документов, удостоверяющих личность</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="RUScat_ru:IdentityCardCode" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="RUScat_ru:IdentityCardName">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Краткое наименование документа, удостоверяющего личность</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="RUScat_ru:IdentityCardName" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="RUScat_ru:FullIdentityCardName">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Полное наименование документа, удостоверяющего личность</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="RUScat_ru:FullIdentityCardName" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="RUScat_ru:IdentityCardSeries">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Серия документа, удостоверяющего личность</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="RUScat_ru:IdentityCardSeries" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="RUScat_ru:IdentityCardNumber">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Номер документа, удостоверяющего личность</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="RUScat_ru:IdentityCardNumber" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="RUScat_ru:IdentityCardDate">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Дата выдачи документа, удостоверяющего личность</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="RUScat_ru:IdentityCardDate" mode="russian_date" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="RUScat_ru:DocValidityDate">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Дата окончания срока, в течение которого документ имеет силу</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="RUScat_ru:DocValidityDate" mode="russian_date" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="RUScat_ru:OrganizationName">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Наименование организации, выдавшей документ</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="RUScat_ru:OrganizationName" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="RUScat_ru:IssuerCode">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Код подразделения органа, выдавшего документ, удостоверяющий личность</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="RUScat_ru:IssuerCode" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="RUScat_ru:AuthorityId">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Строка, идентифицирующая орган государственной власти государства-члена либо уполномоченную им организацию, выдавшую документ</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="RUScat_ru:AuthorityId" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="RUScat_ru:CountryCode">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Кодовое обозначение страны</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="RUScat_ru:CountryCode" />
            </td>
          </tr>
        </table>
      </xsl:if>
    </div>
  </xsl:template>
  <!-- Шаблон для типа RUScat_ru:RUAddressType -->
  <xsl:template match="RUScat_ru:SubjectAddressDetails">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <tr>
        <td class="graphMain bordered">
          <xsl:choose>
            <xsl:when test="RUScat_ru:AddressKindCode='1'">
              <xsl:text>адрес регистрации</xsl:text>
            </xsl:when>
            <xsl:when test="RUScat_ru:AddressKindCode='2'">
              <xsl:text>фактический адрес</xsl:text>
            </xsl:when>
            <xsl:when test="RUScat_ru:AddressKindCode='3'">
              <xsl:text>почтовый адрес</xsl:text>
            </xsl:when>
            <xsl:otherwise>
              <xsl:value-of select="RUScat_ru:AddressKindCode" />
            </xsl:otherwise>
          </xsl:choose>
        </td>
        <td class="graphMain bordered">
          <xsl:apply-templates select="RUScat_ru:PostalCode" />
        </td>
        <td class="graphMain bordered">
          <xsl:apply-templates select="RUScat_ru:CountryCode" />
        </td>
        <td class="graphMain bordered">
          <xsl:apply-templates select="RUScat_ru:CounryName" />
        </td>
        <td class="graphMain bordered">
          <xsl:apply-templates select="RUScat_ru:Region" />
        </td>
        <td class="graphMain bordered">
          <xsl:apply-templates select="RUScat_ru:District" />
        </td>
        <td class="graphMain bordered">
          <xsl:apply-templates select="RUScat_ru:Town" />
        </td>
        <td class="graphMain bordered">
          <xsl:apply-templates select="RUScat_ru:City" />
        </td>
        <td class="graphMain bordered">
          <xsl:apply-templates select="RUScat_ru:StreetHouse" />
        </td>
        <td class="graphMain bordered">
          <xsl:apply-templates select="RUScat_ru:House" />
        </td>
        <td class="graphMain bordered">
          <xsl:apply-templates select="RUScat_ru:Room" />
        </td>
        <td class="graphMain bordered">
          <xsl:apply-templates select="RUScat_ru:AddressText" />
        </td>
        <td class="graphMain bordered">
          <xsl:apply-templates select="RUScat_ru:OKTMO" />
        </td>
        <td class="graphMain bordered">
          <xsl:apply-templates select="RUScat_ru:OKATO" />
        </td>
        <td class="graphMain bordered">
          <xsl:apply-templates select="RUScat_ru:KLADR" />
        </td>
        <td class="graphMain bordered">
          <xsl:apply-templates select="RUScat_ru:AOGUID" />
        </td>
        <td class="graphMain bordered">
          <xsl:apply-templates select="RUScat_ru:AOID" />
        </td>
        <td class="graphMain bordered">
          <xsl:apply-templates select="RUScat_ru:TerritoryCode" />
        </td>
        <td class="graphMain bordered">
          <xsl:apply-templates select="RUScat_ru:PostOfficeBoxId" />
        </td>
      </tr>
    </div>
  </xsl:template>
  <!-- Шаблон для типа RUScat_ru:UITN40Type -->
  <xsl:template match="RUScat_ru:UITN">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <table>
        <tr>
          <td class="annot graphMain" style="width:50%">Код. Универсальный идентификационный таможенный номер. Строка не более 40 символов</td>
          <td class="value graphMain" style="width:50%">
            <xsl:apply-templates select="RUScat_ru:UITNCode" />
          </td>
        </tr>
      </table>
      <xsl:if test="RUScat_ru:CountryCode">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Кодовое обозначение страны, по правилам которой сформирован указанный идентификатор</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="RUScat_ru:CountryCode" />
            </td>
          </tr>
        </table>
      </xsl:if>
    </div>
  </xsl:template>
  <!-- Шаблон для типа cat_ru:ITNKZType -->
  <xsl:template match="cat_ru:ITN">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <table>
        <tr>
          <td class="annot graphMain" style="width:50%">Категория лица. Двухзначный цифровой код категории лица согласно учредительным документам или свидетельству о регистрации в качестве индивидуального предпринимателя</td>
          <td class="value graphMain" style="width:50%">
            <xsl:apply-templates select="cat_ru:CategoryCode" />
          </td>
        </tr>
      </table>
      <table>
        <tr>
          <td class="annot graphMain" style="width:50%">Код КАТО. Двухзначный код КАТО в соответствии с классификатором кодов административно-территориальных объектов</td>
          <td class="value graphMain" style="width:50%">
            <xsl:apply-templates select="cat_ru:KATOCode" />
          </td>
        </tr>
      </table>
      <xsl:if test="cat_ru:RNN">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">РНН. Регистрационный налоговый номер, присваиваемый налоговыми органами Республики Казахстан</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="cat_ru:RNN" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="cat_ru:ITNReserv">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Резерв для ИТН</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="cat_ru:ITNReserv" />
            </td>
          </tr>
        </table>
      </xsl:if>
    </div>
  </xsl:template>
  <!-- Шаблон для типа cat_ru:KGOrganizationFeaturesType -->
  <xsl:template match="cat_ru:KGOrganizationFeatures">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <xsl:if test="cat_ru:KGINN">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">ИНН - идентификационный налоговый номер налогоплательщика, ПИН - персональный идентификационный номер</td>
            <td class="value graphMain" style="width:50%">
              <xsl:choose>
                <xsl:when test="cat_ru:KGINN='ИНН'">
                  <xsl:text>идентификационный налоговый номер налогоплательщика</xsl:text>
                </xsl:when>
                <xsl:when test="cat_ru:KGINN='ПИН'">
                  <xsl:text>персональный идентификационный номер</xsl:text>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:value-of select="cat_ru:KGINN" />
                </xsl:otherwise>
              </xsl:choose>
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="cat_ru:KGOKPO">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Код Общереспубликанского классификатора предприятий и организаций (ОКПО) для юридических лиц и индивидуальных предпринимателей</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="cat_ru:KGOKPO" />
            </td>
          </tr>
        </table>
      </xsl:if>
    </div>
  </xsl:template>
  <!-- Шаблон для типа cat_ru:RAOrganizationFeaturesType -->
  <xsl:template match="cat_ru:RAOrganizationFeatures">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <xsl:if test="cat_ru:UNN">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Учетный номер налогоплательщика (УНН)</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="cat_ru:UNN" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="cat_ru:SocialServiceNumber">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Номерной знак общественных услуг (НЗОУ)</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="cat_ru:SocialServiceNumber" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="cat_ru:SocialServiceCertificate">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Номер справки об отсутствии номерного знака общественных услуг (НЗОУ)</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="cat_ru:SocialServiceCertificate" />
            </td>
          </tr>
        </table>
      </xsl:if>
    </div>
  </xsl:template>
  <!-- Шаблон для типа cat_ru:RBOrganizationFeaturesType -->
  <xsl:template match="cat_ru:RBOrganizationFeatures">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <xsl:if test="cat_ru:UNP">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Учетный номер плательщика (УНП)</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="cat_ru:UNP" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="cat_ru:RBIdentificationNumber">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Идентификационный номер физического лица</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="cat_ru:RBIdentificationNumber" />
            </td>
          </tr>
        </table>
      </xsl:if>
    </div>
  </xsl:template>
  <!-- Шаблон для типа cat_ru:RFOrganizationFeaturesType -->
  <xsl:template match="cat_ru:RFOrganizationFeatures">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <xsl:if test="cat_ru:OGRN">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">ОГРН/ОГРНИП. Основной государственный регистрационный номер</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="cat_ru:OGRN" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="cat_ru:INN">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">ИНН - Индивидуальный номер налогоплательщика</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="cat_ru:INN" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="cat_ru:KPP">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">КПП - Код причины постановки на учет</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="cat_ru:KPP" />
            </td>
          </tr>
        </table>
      </xsl:if>
    </div>
  </xsl:template>
  <!-- Шаблон для типа cat_ru:RKOrganizationFeaturesType -->
  <xsl:template match="cat_ru:RKOrganizationFeatures">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <xsl:if test="cat_ru:BIN">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Бизнес-идентификационный номер (БИН)</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="cat_ru:BIN" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="cat_ru:IIN">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Индивидуальный идентификационный номер (ИИН)</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="cat_ru:IIN" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="cat_ru:ITN">
        <div class="title marg-top">Идентификационный таможенный номер (ИТН)</div>
        <div>
          <xsl:apply-templates select="cat_ru:ITN">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </div>
      </xsl:if>
    </div>
  </xsl:template>
  <!-- Шаблон для типа rpefwg:ApplicantType -->
  <xsl:template match="rpefwg:Applicant">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <xsl:if test="cat_ru:OrganizationName">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Наименование организации / ФИО физического лица</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="cat_ru:OrganizationName" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="cat_ru:ShortName">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Краткое наименование организации</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="cat_ru:ShortName" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="cat_ru:OrganizationLanguage">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Код языка для заполнения наименования </td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="cat_ru:OrganizationLanguage" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="cat_ru:RFOrganizationFeatures">
        <div class="title marg-top">Сведения об организации. Особенности Российской Федерации</div>
        <div>
          <xsl:apply-templates select="cat_ru:RFOrganizationFeatures">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </div>
      </xsl:if>
      <xsl:if test="cat_ru:RKOrganizationFeatures">
        <div class="title marg-top">Сведения об организации. Особенности Республики Казахстан</div>
        <div>
          <xsl:apply-templates select="cat_ru:RKOrganizationFeatures">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </div>
      </xsl:if>
      <xsl:if test="cat_ru:RBOrganizationFeatures">
        <div class="title marg-top">Сведения об организации. Особенности Республики Беларусь</div>
        <div>
          <xsl:apply-templates select="cat_ru:RBOrganizationFeatures">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </div>
      </xsl:if>
      <xsl:if test="cat_ru:RAOrganizationFeatures">
        <div class="title marg-top">Сведения об организации. Особенности Республики Армения</div>
        <div>
          <xsl:apply-templates select="cat_ru:RAOrganizationFeatures">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </div>
      </xsl:if>
      <xsl:if test="cat_ru:KGOrganizationFeatures">
        <div class="title marg-top">Сведения об организации. Особенности Кыргызской Республики</div>
        <div>
          <xsl:apply-templates select="cat_ru:KGOrganizationFeatures">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </div>
      </xsl:if>
      <xsl:if test="RUScat_ru:CountryA2Code">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Кодовое обозначение страны</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="RUScat_ru:CountryA2Code" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="RUScat_ru:BusinessEntityTypeCode">
        <div class="title marg-top">Кодовое обозначение организационно-правовой формы, в которой зарегистрирован хозяйствующий субъект</div>
        <div>
          <xsl:apply-templates select="RUScat_ru:BusinessEntityTypeCode">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </div>
      </xsl:if>
      <xsl:if test="RUScat_ru:BusinessEntityTypeName">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Наименование организационно-правовой формы, в которой зарегистрирован хозяйствующий субъект</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="RUScat_ru:BusinessEntityTypeName" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="RUScat_ru:UITN">
        <div class="title marg-top">Уникальный идентификационный таможенный номер, присвоенный юридическому или физическому лицу</div>
        <div>
          <xsl:apply-templates select="RUScat_ru:UITN">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </div>
      </xsl:if>
      <xsl:if test="RUScat_ru:PersonId">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Уникальный идентификатор физического лица</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="RUScat_ru:PersonId" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="RUScat_ru:IdentityCard">
        <div class="title marg-top">Сведения о документе, удостоверяющем личность физического лица</div>
        <div>
          <xsl:apply-templates select="RUScat_ru:IdentityCard">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </div>
      </xsl:if>
      <xsl:if test="RUScat_ru:SubjectAddressDetails">
        <div class="title marg-top">Адрес</div>
        <table class="bordered">
          <tbody>
            <tr class="title">
              <td class="graphMain bordered">Кодовое обозначение вида адреса: "1" - адрес регистрации; "2" - фактический адрес; "3" - почтовый адрес</td>
              <td class="graphMain bordered">Почтовый индекс</td>
              <td class="graphMain bordered">Буквенный код страны в соответствии с классификатором стран мира</td>
              <td class="graphMain bordered">Краткое название страны в соответствии с классификатором стран мира</td>
              <td class="graphMain bordered">Регион (Наименование единицы административно-территориального деления первого уровня)</td>
              <td class="graphMain bordered">Район (Наименование единицы административно-территориального деления второго уровня)</td>
              <td class="graphMain bordered">Город</td>
              <td class="graphMain bordered">Населенный пункт</td>
              <td class="graphMain bordered">Улица (Наименование элемента улично-дорожной сети городской инфраструктуры)</td>
              <td class="graphMain bordered">Обозначение дома, корпуса, строения</td>
              <td class="graphMain bordered">Обозначение офиса или квартиры</td>
              <td class="graphMain bordered">Набор элементов адреса, представленных в свободной форме в виде текста.</td>
              <td class="graphMain bordered">Код ОКТМО (Общероссийский классификатор территорий муниципальных образований)</td>
              <td class="graphMain bordered">Код ОКАТО (Общероссийский классификатор объектов административно-территориального деления)</td>
              <td class="graphMain bordered">Код КЛАДР</td>
              <td class="graphMain bordered">Глобальный идентификатор адресного объекта по ФИАС</td>
              <td class="graphMain bordered">Уникальный идентификатор адресного объекта по ФИАС</td>
              <td class="graphMain bordered">Код единицы административно-территориального деления</td>
              <td class="graphMain bordered">Номер абонентского ящика на предприятии почтовой связи</td>
            </tr>
            <xsl:for-each select="RUScat_ru:SubjectAddressDetails">
              <xsl:apply-templates select=".">
                <xsl:with-param name="wdth" select="$w" />
              </xsl:apply-templates>
            </xsl:for-each>
          </tbody>
        </table>
      </xsl:if>
      <xsl:if test="RUScat_ru:CommunicationDetails">
        <div class="title marg-top">Контактный реквизит субъекта</div>
        <div>
          <xsl:apply-templates select="RUScat_ru:CommunicationDetails">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </div>
      </xsl:if>
      <xsl:if test="rpefwg:Certificate">
        <div class="title marg-top">Реквизиты свидетельства о включении в реестр владельцев свободных складов</div>
        <div>
          <xsl:apply-templates select="rpefwg:Certificate">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </div>
      </xsl:if>
    </div>
  </xsl:template>
  <!-- Шаблон для типа cat_ru:DocumentBaseType -->
  <xsl:template match="rpefwg:Certificate">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <xsl:if test="cat_ru:PrDocumentName">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Наименование документа</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="cat_ru:PrDocumentName" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="cat_ru:PrDocumentNumber">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Номер документа</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="cat_ru:PrDocumentNumber" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="cat_ru:PrDocumentDate">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Дата документа</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="cat_ru:PrDocumentDate" mode="russian_date" />
            </td>
          </tr>
        </table>
      </xsl:if>
    </div>
  </xsl:template>
  <!-- Шаблон для типа cat_ru:CustomsType -->
  <xsl:template match="rpefwg:Customs">
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
  <!-- Шаблон для типа rpefwg:CustomsPersonType -->
  <xsl:template match="rpefwg:CustomsPerson">
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
      <xsl:if test="rpefwg:LNP">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">ЛНП должностного лица таможенного органа</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="rpefwg:LNP" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="rpefwg:IssueDate">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Дата подписания</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="rpefwg:IssueDate" mode="russian_date" />
            </td>
          </tr>
        </table>
      </xsl:if>
    </div>
  </xsl:template>
  <!-- Шаблон для типа rpefwg:FreeWHRegisterType -->
  <xsl:template match="rpefwg:DecisionNumber">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <table>
        <tr>
          <td class="annot graphMain" style="width:50%">Код таможенного органа регистрации</td>
          <td class="value graphMain" style="width:50%">
            <xsl:apply-templates select="rpefwg:CustomsCode" />
          </td>
        </tr>
      </table>
      <table>
        <tr>
          <td class="annot graphMain" style="width:50%">Дата регистрации</td>
          <td class="value graphMain" style="width:50%">
            <xsl:apply-templates select="rpefwg:RegistrationDate" mode="russian_date" />
          </td>
        </tr>
      </table>
      <table>
        <tr>
          <td class="annot graphMain" style="width:50%">Регистрационный номер</td>
          <td class="value graphMain" style="width:50%">
            <xsl:apply-templates select="rpefwg:RegistrationNumber" />
          </td>
        </tr>
      </table>
      <table>
        <tr>
          <td class="annot graphMain" style="width:50%">Аббревиатура вида документа</td>
          <td class="value graphMain" style="width:50%">
            <xsl:apply-templates select="rpefwg:DocKind" />
          </td>
        </tr>
      </table>
    </div>
  </xsl:template>
  <!-- Шаблон для типа rpefwg:FreeWHRegisterType -->
  <xsl:template match="rpefwg:ExtensionAppNumber">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <table>
        <tr>
          <td class="annot graphMain" style="width:50%">Код таможенного органа регистрации</td>
          <td class="value graphMain" style="width:50%">
            <xsl:apply-templates select="rpefwg:CustomsCode" />
          </td>
        </tr>
      </table>
      <table>
        <tr>
          <td class="annot graphMain" style="width:50%">Дата регистрации</td>
          <td class="value graphMain" style="width:50%">
            <xsl:apply-templates select="rpefwg:RegistrationDate" mode="russian_date" />
          </td>
        </tr>
      </table>
      <table>
        <tr>
          <td class="annot graphMain" style="width:50%">Регистрационный номер</td>
          <td class="value graphMain" style="width:50%">
            <xsl:apply-templates select="rpefwg:RegistrationNumber" />
          </td>
        </tr>
      </table>
      <table>
        <tr>
          <td class="annot graphMain" style="width:50%">Аббревиатура вида документа</td>
          <td class="value graphMain" style="width:50%">
            <xsl:apply-templates select="rpefwg:DocKind" />
          </td>
        </tr>
      </table>
    </div>
	</xsl:template>
 	<xsl:template name="russian_date_gtd">
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<xsl:value-of select="substring($dateIn,9,2)"/>
				<xsl:value-of select="substring($dateIn,6,2)"/>
				<xsl:value-of select="substring($dateIn,3,2)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dateIn"/>
			</xsl:otherwise>
		</xsl:choose>
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
	<xsl:template match="//*[local-name()='RefusalProlongExpFreeWHGoods']//*" priority="-1">
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