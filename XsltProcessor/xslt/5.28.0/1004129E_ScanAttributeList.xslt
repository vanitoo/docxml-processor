<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:sal="urn:customs.ru:Information:CustomsDocuments:ScanAttributeList:5.24.0" xmlns:xs="http://www.w3.org/2001/XMLSchema">
	<xsl:output version="1.0" method="html" indent="no" encoding="UTF-8" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN" doctype-system="http://www.w3.org/TR/html4/loose.dtd"/>
	<!-- Шаблон для типа ScanAttributeListType -->
	<xsl:template match="sal:ScanAttributeList">
		<html>
			<head>
				<!-- meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/-->
				<style>
                  body {
                  background: #cccccc;
                  font-family: Arial;
                  }

                  div
                  {
                  /*white-space: nowrap;*/
                  }

                  div.page {
                  width: 190mm;
                  margin: 10px auto;
                  margin-top: 6pt;
                  margin-bottom: 6pt;
                  padding: 10mm;
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
                  border: 1px solid gray;
                  }

                  .graph {
                  font-family: Arial;
                  font-size: 10pt;
                  }

                  .value
                  {
                  border-bottom: solid 1px black;
                  }

                  div.title, tr.title td { font-weight:bold;  }
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
				<div class="page">
					<table class="w190">
						<tr>
							<td align="center" class="graphMain">
								<font size="4">
									<b>Сканированный документ</b>
								</font>
							</td>
						</tr>
					</table>
					<xsl:apply-templates select="sal:RegNum"/>
					<xsl:if test="sal:DocumentBody">
						<div class="title marg-top">Тело  документа</div>
					</xsl:if>
					<xsl:apply-templates select="sal:DocumentBody"/>
					<xsl:if test="sal:DocList">
						<div class="title marg-top">Реквизиты сканированного документа</div>
					</xsl:if>
					<xsl:apply-templates select="sal:DocList"/>
				</div>
			</body>
		</html>
	</xsl:template>
	<xsl:template match="sal:RegNum">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Регистрационный номер запроса на сканирование</td>
				<td class="value graphMain" style="width:50%">
					<xsl:apply-templates select="cat_ru:CustomsCode"/>
					<xsl:text>/</xsl:text>
					<xsl:apply-templates select="cat_ru:RegistrationDate" mode="russian_date_gtd"/>
					<xsl:text>/</xsl:text>
					<xsl:apply-templates select="cat_ru:GTDNumber"/>
				</td>
			</tr>
		</table>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:AddressType -->
	<xsl:template match="cat_ru:Address">
		<xsl:if test="cat_ru:PostalCode">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Почтовый индекс</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="cat_ru:PostalCode"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:CountryCode">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Буквенный код страны в соответствии с классификатором стран мира</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="cat_ru:CountryCode"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:CounryName">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Краткое название страны в соответствии с классификатором стран мира</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="cat_ru:CounryName"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:Region">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Область (регион, штат, провинция и т.п.)</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="cat_ru:Region"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:City">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Населенный пункт</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="cat_ru:City"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:StreetHouse">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Улица, номер дома, номер офиса</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="cat_ru:StreetHouse"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:TerritoryCode">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Код административно-территориальной единицы в соответствии с ГК СОАТЕ (для Кыргызской Республики)</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="cat_ru:TerritoryCode"/>
					</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:ContactType -->
	<xsl:template match="cat_ru:Contact">
		<xsl:if test="cat_ru:Phone">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Номер телефона</td>
					<td class="graphMain value" style="width:50%">
						<xsl:for-each select="cat_ru:Phone">
							<xsl:apply-templates select="."/>
							<xsl:if test="position()!=last()">
								<xsl:text>, </xsl:text>
							</xsl:if>
						</xsl:for-each>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:Fax">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Номер факса</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="cat_ru:Fax"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:Telex">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Номер телекса</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="cat_ru:Telex"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:E_mail">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Адрес электронной почты</td>
					<td class="graphMain value" style="width:50%">
						<xsl:for-each select="cat_ru:E_mail">
							<xsl:apply-templates select="."/>
							<xsl:if test="position()!=last()">
								<xsl:text>, </xsl:text>
							</xsl:if>
						</xsl:for-each>
					</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:ITNKZType -->
	<xsl:template match="cat_ru:ITN">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Категория лица. Двухзначный цифровой код категории лица согласно учредительным документам или свидетельству о регистрации в качестве индивидуального предпринимателя</td>
				<td class="value graphMain" style="width:50%">
					<xsl:apply-templates select="cat_ru:CategoryCode"/>
				</td>
			</tr>
		</table>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Код КАТО. Двухзначный код КАТО в соответствии с классификатором кодов административно-территориальных объектов</td>
				<td class="value graphMain" style="width:50%">
					<xsl:apply-templates select="cat_ru:KATOCode"/>
				</td>
			</tr>
		</table>
		<xsl:if test="cat_ru:RNN">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">РНН. Регистрационный налоговый номер, присваиваемый налоговыми органами Республики Казахстан</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="cat_ru:RNN"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<!--xsl:if test="cat_ru:ITNReserv">
      <table class="w190">
        <tr>
          <td class="annot graphMain" style="width:50%">Резерв для ИТН</td>
          <td class="value graphMain" style="width:50%">
            <xsl:value-of select="cat_ru:ITNReserv"/>
          </td>
        </tr>
      </table>
    </xsl:if-->
	</xsl:template>
	<!-- Шаблон для типа cat_ru:KGOrganizationFeaturesType -->
	<xsl:template match="cat_ru:KGOrganizationFeatures">
		<xsl:if test="cat_ru:KGINN">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">ИНН - идентификационный налоговый номер налогоплательщика, ПИН - персональный идентификационный номер</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="cat_ru:KGINN"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:KGOKPO">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Код Общереспубликанского классификатора предприятий и организаций (ОКПО) для юридических лиц и индивидуальных предпринимателей</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="cat_ru:KGOKPO"/>
					</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:RAOrganizationFeaturesType -->
	<xsl:template match="cat_ru:RAOrganizationFeatures">
		<xsl:if test="cat_ru:UNN">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Учетный номер налогоплательщика (УНН)</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="cat_ru:UNN"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:SocialServiceNumber">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Номерной знак общественных услуг (НЗОУ)</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="cat_ru:SocialServiceNumber"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:SocialServiceCertificate">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Номер справки об отсутствии номерного знака общественных услуг (НЗОУ)</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="cat_ru:SocialServiceCertificate"/>
					</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:RBOrganizationFeaturesType -->
	<xsl:template match="cat_ru:RBOrganizationFeatures">
		<xsl:if test="cat_ru:UNP">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Учетный номер плательщика (УНП)</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="cat_ru:UNP"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:RBIdentificationNumber">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Идентификационный номер физического лица</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="cat_ru:RBIdentificationNumber"/>
					</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:RFOrganizationFeaturesType -->
	<xsl:template match="cat_ru:RFOrganizationFeatures">
		<xsl:if test="cat_ru:OGRN">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">ОГРН/ОГРНИП</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="cat_ru:OGRN"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:INN">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">ИНН</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="cat_ru:INN"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:KPP">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">КПП</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="cat_ru:KPP"/>
					</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:RKOrganizationFeaturesType -->
	<xsl:template match="cat_ru:RKOrganizationFeatures">
		<xsl:if test="cat_ru:BIN">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Бизнес-идентификационный номер (БИН)</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="cat_ru:BIN"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:IIN">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Индивидуальный идентификационный номер (ИИН)</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="cat_ru:IIN"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:ITN">
			<div class="title marg-top">Идентификационный таможенный номер (ИТН)</div>
		</xsl:if>
		<xsl:apply-templates select="cat_ru:ITN"/>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:OrganizationType -->
	<xsl:template match="sal:Declarant">
		<xsl:if test="cat_ru:OrganizationName">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Наименование организации / ФИО физического лица</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="cat_ru:OrganizationName"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:ShortName">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Краткое наименование организации</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="cat_ru:ShortName"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:OrganizationLanguage">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Код языка для заполнения наименования </td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="cat_ru:OrganizationLanguage"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:RFOrganizationFeatures">
			<div class="title marg-top">Сведения об организации. Особенности Российской Федерации</div>
		</xsl:if>
		<xsl:apply-templates select="cat_ru:RFOrganizationFeatures"/>
		<xsl:if test="cat_ru:RKOrganizationFeatures">
			<div class="title marg-top">Сведения об организации. Особенности Республики Казахстан</div>
		</xsl:if>
		<xsl:apply-templates select="cat_ru:RKOrganizationFeatures"/>
		<xsl:if test="cat_ru:RBOrganizationFeatures">
			<div class="title marg-top">Сведения об организации. Особенности Республики Беларусь</div>
		</xsl:if>
		<xsl:apply-templates select="cat_ru:RBOrganizationFeatures"/>
		<xsl:if test="cat_ru:RAOrganizationFeatures">
			<div class="title marg-top">Сведения об организации. Особенности Республики Армения</div>
		</xsl:if>
		<xsl:apply-templates select="cat_ru:RAOrganizationFeatures"/>
		<xsl:if test="cat_ru:KGOrganizationFeatures">
			<div class="title marg-top">Сведения об организации. Особенности Кыргызской Республики</div>
		</xsl:if>
		<xsl:apply-templates select="cat_ru:KGOrganizationFeatures"/>
		<xsl:if test="cat_ru:OKPOID">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Код организации по ОКПО</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="cat_ru:OKPOID"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:OKATOCode">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Код ОКАТО</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="cat_ru:OKATOCode"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:Address">
			<div class="title marg-top">Адрес </div>
		</xsl:if>
		<xsl:apply-templates select="cat_ru:Address"/>
		<xsl:if test="cat_ru:Contact">
			<div class="title marg-top">Контактная информация</div>
		</xsl:if>
		<xsl:apply-templates select="cat_ru:Contact"/>
	</xsl:template>
	<!-- Шаблон для типа sal:DocListType -->
	<xsl:template match="sal:DocList">
		<xsl:if test="cat_ru:PrDocumentName">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Наименование документа</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="cat_ru:PrDocumentName"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:PrDocumentNumber">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Номер документа</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="cat_ru:PrDocumentNumber"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:PrDocumentDate">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Дата документа</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="cat_ru:PrDocumentDate" mode="russian_date"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Идентификатор позиции в исходном запросе</td>
				<td class="value graphMain" style="width:50%">
					<xsl:apply-templates select="sal:RequestPositionID"/>
				</td>
			</tr>
		</table>
		<xsl:if test="sal:ScanCustoms">
			<div class="title marg-top">Сведения о сканировании</div>
		</xsl:if>
		<xsl:apply-templates select="sal:ScanCustoms"/>
		<xsl:if test="sal:DocCode">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Код вида документа (на основании сведений в графе 44)</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="sal:DocCode"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="sal:ScanID">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Идентификатор сканированного документа в архиве ТО</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="sal:ScanID"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="sal:DocumentBeginActionsDate">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Дата начала действия документа</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="sal:DocumentBeginActionsDate" mode="russian_date"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="sal:DocumentEndActionsDate">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Дата окончания действия документа</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="sal:DocumentEndActionsDate" mode="russian_date"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Порядковый номер записи в запросе на сканирование</td>
				<td class="value graphMain" style="width:50%">
					<xsl:apply-templates select="sal:Position"/>
				</td>
			</tr>
		</table>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Порядковый номер файла в случае, если документ сканирован в несколько приемов</td>
				<td class="value graphMain" style="width:50%">
					<xsl:apply-templates select="sal:NumPP"/>
				</td>
			</tr>
		</table>
		<xsl:if test="sal:CheckList">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%;font-weight: bold;"><br/>Лист проверки документа</td>
					<td class="graphMain" style="width:50%">
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<table width="100%">
							<tbody>
								<tr valign="top" align="center">
									<td class="bordered">Код типа</td>
									<td class="bordered">Описание</td>
									<td class="bordered">Результат</td>
									<td class="bordered">Комментарии</td>
								</tr>
								<xsl:apply-templates select="sal:CheckList"/>
							</tbody>
						</table>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="sal:Comments">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Общие комментарии</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="sal:Comments"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="sal:Declarant">
			<div class="title marg-top">Информация об участнике ВЭД</div>
		</xsl:if>
		<xsl:apply-templates select="sal:Declarant"/>
	</xsl:template>
	<xsl:template match="sal:CheckList">
		<tr valign="top">
			<td class="bordered" align="center">
				<xsl:apply-templates select="sal:CheckCode"/>
			</td>
			<td class="bordered">
				<xsl:apply-templates select="sal:CheckDesc"/>
			</td>
			<td class="bordered" align="center">
				<xsl:choose>
					<xsl:when test="translate(substring(sal:Result,1, 1), 'T', 't') = 't' or sal:Result = 1">Да</xsl:when>
					<xsl:when test="translate(substring(sal:Result,1, 1), 'F', 'f') = 'f' or sal:Result = 0">Нет</xsl:when>
					<xsl:when test="not(sal:Result)">Нет</xsl:when>
					<xsl:otherwise>
						<xsl:apply-templates select="sal:Result"/>
					</xsl:otherwise>
				</xsl:choose>
			</td>
			<td class="bordered">
				<xsl:apply-templates select="sal:Comment"/>
			</td>
		</tr>
	</xsl:template>
	<!-- Шаблон для типа sal:DocBodyType -->
	<xsl:template match="sal:DocumentBody">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Имя файла</td>
				<td class="value graphMain" style="width:50%">
					<xsl:apply-templates select="sal:FileName"/>
				</td>
			</tr>
		</table>
		<table class="w190">
			<tr>
				<!--td class="annot graphMain" style="width:50%">Данные файла  в кодировке BASE64</td-->
				<td class="annot graphMain">
					<xsl:if test="sal:FileData">
						<input type="button" value="Просмотр" OnClick="1004129E" Hint="Просмотр содержимого файла"/>
						<div class="data" style="display:none;">
							<xsl:value-of select="sal:FileData"/>
						</div>
					</xsl:if>
				</td>
			</tr>
		</table>
	</xsl:template>
	<!-- Шаблон для типа sal:ScanCustomsType -->
	<xsl:template match="sal:ScanCustoms">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Код ТО сканирования</td>
				<td class="value graphMain" style="width:50%">
					<xsl:apply-templates select="sal:CustomsCode"/>
				</td>
			</tr>
			<xsl:if test="sal:Comment">
				<tr>
					<td class="annot graphMain" style="width:50%">Комментарии</td>
					<td class="value graphMain" style="width:50%">
						<xsl:for-each select="sal:Comment">
							<xsl:apply-templates select="."/>
						</xsl:for-each>
					</td>
				</tr>
			</xsl:if>
			<xsl:if test="sal:LNP">
				<tr>
					<td class="annot graphMain" style="width:50%">ЛНП сканировавшего лица</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="sal:LNP"/>
					</td>
				</tr>
			</xsl:if>
			<xsl:if test="sal:LNPCustomsCode">
				<tr>
					<td class="annot graphMain" style="width:50%">Код таможенного органа, указанный на оттиске ЛНП</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="sal:LNPCustomsCode"/>
					</td>
				</tr>
			</xsl:if>
			<tr>
				<td class="annot graphMain" style="width:50%">Дата сканирования</td>
				<td class="value graphMain" style="width:50%">
					<xsl:apply-templates select="sal:ScanDate" mode="russian_date"/>
				</td>
			</tr>
		</table>
	</xsl:template>
	<xsl:template name="russian_date">
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<xsl:value-of select="substring($dateIn,9,2)"/>
				<xsl:text>.</xsl:text>
				<xsl:value-of select="substring($dateIn,6,2)"/>
				<xsl:text>.</xsl:text>
				<xsl:value-of select="substring($dateIn,1,4)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dateIn"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="russian_date_gtd">
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<xsl:value-of select="substring($dateIn,9,2)"/>
				<xsl:text/>
				<xsl:value-of select="substring($dateIn,6,2)"/>
				<xsl:text/>
				<xsl:value-of select="substring($dateIn,3,2)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dateIn"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="russian_date_time">
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<xsl:value-of select="substring($dateIn,9,2)"/>
				<xsl:text>.</xsl:text>
				<xsl:value-of select="substring($dateIn,6,2)"/>
				<xsl:text>.</xsl:text>
				<xsl:value-of select="substring($dateIn,1,4)"/>
				<xsl:text> </xsl:text>
				<xsl:value-of select="substring($dateIn, 12, 8)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dateIn"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="russian_time">
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,3,1)=':' and substring($dateIn,6,1)=':'">
				<xsl:value-of select="substring($dateIn, 1, 8)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dateIn"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="//*[local-name()='ScanAttributeList']//*" priority="-1">
		<xsl:variable name="xpath">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="current()"/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath}">
			<xsl:apply-templates/>
		</element>
	</xsl:template>
	<xsl:template name="get_xpath">
		<xsl:param name="node" select="."/>
		<xsl:variable name="xpath">
			<xsl:for-each select="$node/ancestor-or-self::*">
				<xsl:variable name="name">
					<xsl:value-of select="name()"/>
				</xsl:variable>
				<xsl:variable name="pos">
					<xsl:value-of select="count(node()/parent::*/preceding-sibling::*[name()=$name])"/>
				</xsl:variable>
				<xsl:choose>
					<xsl:when test="position()=last()">
						<xsl:value-of select="concat($name,'[',$pos,']')"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="concat($name,'[',$pos,']','/')"/>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:for-each>
		</xsl:variable>
		<xsl:value-of select="$xpath"/>
	</xsl:template>
	<xsl:template match="*" mode="russian_date">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:call-template name="russian_date">
				<xsl:with-param name="dateIn" select="."/>
			</xsl:call-template>
		</element>
	</xsl:template>
	<xsl:template match="*" mode="russian_date_time">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:call-template name="russian_date_time">
				<xsl:with-param name="dateIn" select="."/>
			</xsl:call-template>
		</element>
	</xsl:template>
	<xsl:template match="*" mode="russian_time">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:call-template name="russian_time">
				<xsl:with-param name="dateIn" select="."/>
			</xsl:call-template>
		</element>
	</xsl:template>
	<xsl:template match="*" mode="russian_date_gtd">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:call-template name="russian_date_gtd">
				<xsl:with-param name="dateIn" select="."/>
			</xsl:call-template>
		</element>
	</xsl:template>
	<xsl:template match="*" mode="translate_number">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:value-of select="translate(.,'.', ',')"/>
		</element>
	</xsl:template>
</xsl:stylesheet>
