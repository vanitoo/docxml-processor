<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.24.0" xmlns:ogc="urn:customs.ru:Information:CommercialFinanceDocuments:OfferGuaranteeContract:5.24.0">
	<!-- Шаблон для типа OfferGuaranteeContractType -->
	<xsl:template match="ogc:OfferGuaranteeContract">
		<xsl:param name="w" select="190" />
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
					{font-weight:bold;
					font-family: Arial;
					font-size: 11pt;}

					tr.title td
					{font-weight:bold;
					font-family: Arial;
					font-size: 9pt;}

					.bordered
					{border-collapse: collapse;}

					td.bordered
					{border: solid 1px windowtext;}

					td.graphMain
					{vertical-align:top;}

					td.value.graphMain
					{vertical-align:bottom;}
				</style>
			</head>
			<body>
				<div class="page" style="width: {$w}mm;">
					<table>
						<tbody>
							<tr>
								<td align="center" class="title">
									<font size="4">
										<b>Предложение о </b>
										<xsl:choose>
											<xsl:when test="ogc:TargetOffer='1'">
												<b>заключении договора поручительства</b>
											</xsl:when>
											<xsl:when test="ogc:TargetOffer='2'">
												<b>внесении изменений в договор поручительства</b>
											</xsl:when>
											<xsl:when test="ogc:TargetOffer='3'">
												<b>расторжении договора поручительства</b>
											</xsl:when>
											<xsl:otherwise>
												<xsl:value-of select="ogc:TargetOffer" />
											</xsl:otherwise>
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
					<xsl:if test="ogc:ContractNumber and ogc:TargetOffer!='1'">
						<div class="title marg-top">Реквизиты договора поручительства</div>
						<div>
							<xsl:apply-templates select="ogc:ContractNumber">
								<xsl:with-param name="wdth" select="$w" />
							</xsl:apply-templates>
						</div>
					</xsl:if>
					<xsl:if test="ogc:Guarantor">
						<div class="title marg-top">Сведения о лице, имеющем намерение стать поручителем/поручителем </div>
						<div>
							<xsl:apply-templates select="ogc:Guarantor">
								<xsl:with-param name="wdth" select="$w" />
							</xsl:apply-templates>
						</div>
					</xsl:if>
					<xsl:if test="ogc:CustomsDetails">
						<div class="title marg-top">Сведения о таможенном органе, в который направлено предложение</div>
						<div>
							<xsl:apply-templates select="ogc:CustomsDetails">
								<xsl:with-param name="wdth" select="$w" />
							</xsl:apply-templates>
						</div>
					</xsl:if>
					<xsl:if test="ogc:OfferContents">
						<table>
							<tr>
								<td class="annot graphMain" style="width:50%">Текст предложения о внесении изменений в договор поручительства: содержание вносимых изменений </td>
								<td class="value graphMain" style="width:50%">
									<xsl:apply-templates select="ogc:OfferContents" />
								</td>
							</tr>
						</table>
					</xsl:if>
				</div>
			</body>
		</html>
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
  <!-- Шаблон для типа RUScat_ru:RUAddressType -->
  <xsl:template match="ogc:Address">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <xsl:if test="RUScat_ru:AddressKindCode">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Вида адреса:</td>
            <td class="value graphMain" style="width:50%">
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
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="RUScat_ru:PostalCode">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Почтовый индекс</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="RUScat_ru:PostalCode" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="RUScat_ru:CountryCode">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Буквенный код страны в соответствии с классификатором стран мира</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="RUScat_ru:CountryCode" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="RUScat_ru:CounryName">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Краткое название страны в соответствии с классификатором стран мира</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="RUScat_ru:CounryName" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="RUScat_ru:Region">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Регион (Наименование единицы административно-территориального деления первого уровня)</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="RUScat_ru:Region" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="RUScat_ru:District">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Район (Наименование единицы административно-территориального деления второго уровня)</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="RUScat_ru:District" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="RUScat_ru:Town">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Город</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="RUScat_ru:Town" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="RUScat_ru:City">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Населенный пункт</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="RUScat_ru:City" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="RUScat_ru:StreetHouse">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Улица (Наименование элемента улично-дорожной сети городской инфраструктуры)</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="RUScat_ru:StreetHouse" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="RUScat_ru:House">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Обозначение дома, корпуса, строения</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="RUScat_ru:House" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="RUScat_ru:Room">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Обозначение офиса или квартиры</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="RUScat_ru:Room" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="RUScat_ru:AddressText">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Набор элементов адреса, представленных в свободной форме в виде текста.</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="RUScat_ru:AddressText" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="RUScat_ru:OKTMO">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Код ОКТМО (Общероссийский классификатор территорий муниципальных образований)</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="RUScat_ru:OKTMO" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="RUScat_ru:OKATO">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Код ОКАТО (Общероссийский классификатор объектов административно-территориального деления)</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="RUScat_ru:OKATO" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="RUScat_ru:KLADR">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Код КЛАДР</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="RUScat_ru:KLADR" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="RUScat_ru:AOGUID">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Глобальный идентификатор адресного объекта по ФИАС</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="RUScat_ru:AOGUID" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="RUScat_ru:AOID">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Уникальный идентификатор адресного объекта по ФИАС</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="RUScat_ru:AOID" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="RUScat_ru:TerritoryCode">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Код единицы административно-территориального деления</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="RUScat_ru:TerritoryCode" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="RUScat_ru:PostOfficeBoxId">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Номер абонентского ящика на предприятии почтовой связи</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="RUScat_ru:PostOfficeBoxId" />
            </td>
          </tr>
        </table>
      </xsl:if>
    </div>
  </xsl:template>
  <!-- Шаблон для типа cat_ru:PersonBaseType -->
  <xsl:template match="ogc:AuthorizedPerson">
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
    </div>
  </xsl:template>
  <!-- Шаблон для типа cat_ru:DocumentBaseType -->
  <xsl:template match="ogc:ConfirmingDocument">
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
  <!-- Шаблон для типа cat_ru:DocumentBaseType -->
  <xsl:template match="ogc:ContractNumber">
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
  <xsl:template match="ogc:CustomsDetails">
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
  <!-- Шаблон для типа ogc:GuarantorType -->
  <xsl:template match="ogc:Guarantor">
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
      <xsl:if test="ogc:Address">
        <div class="title marg-top">Адрес </div>
        <div>
          <xsl:apply-templates select="ogc:Address">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </div>
      </xsl:if>
      <xsl:if test="ogc:AuthorizedPerson">
        <div class="title marg-top">ФИО лица, подписавшего предложение</div>
        <div>
          <xsl:apply-templates select="ogc:AuthorizedPerson">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </div>
      </xsl:if>
      <xsl:if test="ogc:ConfirmingDocument">
        <div class="title marg-top">Документ, подтверждающий полномочия лица</div>
        <div>
          <xsl:apply-templates select="ogc:ConfirmingDocument">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </div>
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
  <xsl:template match="//*[local-name()='OfferGuaranteeContract']//*" priority="-1">
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