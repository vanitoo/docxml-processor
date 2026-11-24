<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" xmlns:catESAD_ru="urn:customs.ru:RUCommonAggregateTypes:5.28.0" xmlns:e_cdcm="urn:customs.ru:Information:CustomsDocuments:E_CommerceDeclarationCustomMark:5.28.0" xmlns:xs="http://www.w3.org/2001/XMLSchema">
	<!-- Шаблон для типа E_CommerceDeclarationCustomMarkType -->
	<xsl:template match="e_cdcm:E_CommerceDeclarationCustomMark">
		<xsl:param name="w" select="297"/>
		<html>
			<head>
				<style>
                  body {
                  background: #cccccc;
                  font-family: Arial;
                  font-size: 9pt;
                  }

                  div
                  {
                  white-space: normal;
                  }

                  div.page {
                  margin: 10px auto;
                  margin-top: 6pt;
                  margin-bottom: 6pt;
                  padding: 10mm 10mm 10mm 10mm;
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
										<b>Отметки таможенного органа по декларации электронной торговли</b>
									</font>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<xsl:if test="e_cdcm:E_CDRegNumber">
						<div class="title marg-top">Регистрационный номер декларации электронной торговли</div>
						<div>
							<xsl:apply-templates select="e_cdcm:E_CDRegNumber">
								<xsl:with-param name="wdth" select="$w"/>
							</xsl:apply-templates>
						</div>
					</xsl:if>
					<xsl:if test="e_cdcm:E_CDResolution">
						<div class="title marg-top">Принятые решения по ДЭТ</div>
						<div>
							<xsl:apply-templates select="e_cdcm:E_CDResolution">
								<xsl:with-param name="wdth" select="$w"/>
							</xsl:apply-templates>
						</div>
					</xsl:if>
					<xsl:if test="e_cdcm:E_CDCommonMark">
						<div class="title marg-top">Служебные отметки ДЭТ</div>
						<table class="bordered">
							<tbody>
								<tr class="title">
									<td class="graphMain bordered">Обозначение графы (подраздела графы) </td>
									<td class="graphMain bordered">Идентификатор проставленной технологической отметки - 1 (номер этапа)</td>
									<td class="graphMain bordered">Идентификатор проставленной технологической отметки  -  2 (тип примечания)</td>
									<td class="graphMain bordered">Описание отметки</td>
									<td class="graphMain bordered">Служебная запись </td>
									<td class="graphMain bordered">Информация о документе</td>
									<td class="graphMain bordered">Код основания продления срока выпуска товаров</td>
									<td class="graphMain bordered">Срок</td>
									<td class="graphMain bordered">ФИО инспектора, заверившего запись</td>
									<td class="graphMain bordered">Номер ЛНП инспектора, заверившего запись</td>
									<td class="graphMain bordered">Код таможенного органа, указанный на оттиске ЛНП</td>
									<td class="graphMain bordered">Дата и время проставления отметки</td>
									<td class="graphMain bordered">Дата предъявления товаров</td>
									<td class="graphMain bordered">Время предъявления  товаров</td>
								</tr>
								<xsl:for-each select="e_cdcm:E_CDCommonMark">
									<xsl:apply-templates select=".">
										<xsl:with-param name="wdth" select="$w"/>
									</xsl:apply-templates>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<xsl:if test="e_cdcm:Consignment">
						<div class="title marg-top">Принятые решения и служебные отметки по индивидуальным накладным</div>
						<table class="bordered">
							<tbody>
								<tr class="title">
									<td class="graphMain bordered">Код принятого решения в соответствии с классификатором решений,  принимаемых таможенными органами</td>
									<td class="graphMain bordered">Дата и время принятия решения</td>
									<td class="graphMain bordered">Код причины отказа в выпуске</td>
									<td class="graphMain bordered">Описание причины отказа в выпуске</td>
									<td class="graphMain bordered">Служебные отметки</td>
									<td class="graphMain bordered">Сведения об индивидуальной накладной</td>
									<td class="graphMain bordered">Служебные отметки и принятые решения по товарам</td>
									<td class="graphMain bordered">ФИО инспектора, заверившего запись</td>
									<td class="graphMain bordered">Номер ЛНП инспектора, заверившего запись</td>
									<td class="graphMain bordered">Код таможенного органа, указанный на оттиске ЛНП</td>
								</tr>
								<xsl:for-each select="e_cdcm:Consignment">
									<xsl:apply-templates select=".">
										<xsl:with-param name="wdth" select="$w"/>
									</xsl:apply-templates>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<xsl:if test="e_cdcm:CustomsPerson">
						<div class="title marg-top">Должностное лицо таможенного органа</div>
						<div>
							<xsl:apply-templates select="e_cdcm:CustomsPerson">
								<xsl:with-param name="wdth" select="$w"/>
							</xsl:apply-templates>
						</div>
					</xsl:if>
				</div>
			</body>
		</html>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:ITNKZType -->
	<xsl:template match="cat_ru:ITN">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Категория лица. Двухзначный цифровой код категории лица согласно учредительным документам или свидетельству о регистрации в качестве индивидуального предпринимателя</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="cat_ru:CategoryCode"/>
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Код КАТО. Двухзначный код КАТО в соответствии с классификатором кодов административно-территориальных объектов</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="cat_ru:KATOCode"/>
					</td>
				</tr>
			</table>
			<xsl:if test="cat_ru:RNN">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">РНН. Регистрационный налоговый номер, присваиваемый налоговыми органами Республики Казахстан</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="cat_ru:RNN"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:ITNReserv">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Резерв для ИТН</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="cat_ru:ITNReserv"/>
						</td>
					</tr>
				</table>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:KGOrganizationFeaturesType -->
	<xsl:template match="cat_ru:KGOrganizationFeatures">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
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
									<xsl:value-of select="cat_ru:KGINN"/>
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
							<xsl:apply-templates select="cat_ru:KGOKPO"/>
						</td>
					</tr>
				</table>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:RAOrganizationFeaturesType -->
	<xsl:template match="cat_ru:RAOrganizationFeatures">
			<xsl:if test="cat_ru:UNN">
				<xsl:text> УНН </xsl:text>
				<xsl:apply-templates select="cat_ru:UNN"/>
			</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:RBOrganizationFeaturesType -->
	<xsl:template match="cat_ru:RBOrganizationFeatures">

	<xsl:if test="cat_ru:UNP">
		<xsl:text> УНП </xsl:text>
		<xsl:apply-templates select="cat_ru:UNP"/>
	</xsl:if>
	<xsl:if test="cat_ru:RBIdentificationNumber">
		<xsl:text> ИНФЛ </xsl:text>
		<xsl:apply-templates select="cat_ru:RBIdentificationNumber"/>
	</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:RFOrganizationFeaturesType -->
	<xsl:template match="cat_ru:RFOrganizationFeatures">

		<xsl:if test="cat_ru:OGRN">
			<xsl:text> ОГРН </xsl:text>
			<xsl:apply-templates select="cat_ru:OGRN"/>
		</xsl:if>
		<xsl:if test="cat_ru:INN">
			<xsl:text> ИНН </xsl:text>
			<xsl:apply-templates select="cat_ru:INN"/>
		</xsl:if>
		<xsl:if test="cat_ru:KPP">
			<xsl:text> КПП </xsl:text>
			<xsl:apply-templates select="cat_ru:KPP"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:RKOrganizationFeaturesType -->
	<xsl:template match="cat_ru:RKOrganizationFeatures">

			<xsl:if test="cat_ru:BIN">
				<xsl:text> БИН </xsl:text>
				<xsl:apply-templates select="cat_ru:BIN"/>
			</xsl:if>
			<xsl:if test="cat_ru:IIN">
				<xsl:text> ИИН </xsl:text>
				<xsl:apply-templates select="cat_ru:IIN"/>
			</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:OrganizationBaseType -->
	<xsl:template match="e_cdcm:CommonMarkOrganization">
		<xsl:for-each select="*">
			<xsl:if test="position() != 1">, </xsl:if>
			<xsl:apply-templates select="."/>
		</xsl:for-each>
	</xsl:template>
	<!-- Шаблон для типа e_cdcm:ConsignmentType -->
	<xsl:template match="e_cdcm:Consignment">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<tr>
				<td class="graphMain bordered">
					<xsl:apply-templates select="e_cdcm:DecisionCode"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="e_cdcm:DecisionDate"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="e_cdcm:ReasonCode"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="e_cdcm:Reason"/>
				</td>
				<td class="graphMain bordered">
					<xsl:if test="e_cdcm:CustomsMark">
						<xsl:apply-templates select="e_cdcm:CustomsMark">
							<xsl:with-param name="wdth" select="$w"/>
						</xsl:apply-templates>
					</xsl:if>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="e_cdcm:IndividualWayBill">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</td>
				<td class="graphMain bordered">
					<xsl:if test="e_cdcm:GoodsResolution">
						<xsl:apply-templates select="e_cdcm:GoodsResolution">
							<xsl:with-param name="wdth" select="$w"/>
						</xsl:apply-templates>
					</xsl:if>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="e_cdcm:PersonName"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="e_cdcm:LNP"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="e_cdcm:LNPCustomsCode"/>
				</td>
			</tr>
		</div>
	</xsl:template>
	<!-- Шаблон для типа e_cdcm:CustomsMarkType -->
	<xsl:template match="e_cdcm:CustomsMark">
		<xsl:if test="position() != 1"><br/></xsl:if>
		<xsl:for-each select="*">
			<xsl:if test="position()!=1">, </xsl:if>
			<xsl:choose>
				<xsl:when test="contains(local-name(), 'Date') or contains(local-name(), 'Deadline')">
					<xsl:apply-templates select="." mode="russian_date"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:apply-templates select="."/>
				</xsl:otherwise>
			</xsl:choose>
			
		</xsl:for-each>
	</xsl:template>
	<xsl:template match="e_cdcm:DateTimeInf|e_cdcm:DecisionDate">
		<xsl:apply-templates select="." mode="russian_date"/>
		<xsl:text> </xsl:text>
		<xsl:value-of select="substring(., 12, 8)"/>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:CustomsPersonType -->
	<xsl:template match="e_cdcm:CustomsPerson">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<xsl:if test="cat_ru:PersonName">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">ФИО должностного лица таможенного органа</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="cat_ru:PersonName"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:LNP">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">ЛНП должностного лица таможенного органа</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="cat_ru:LNP"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:CustomsCode">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Код таможенного органа, указанный на оттиске ЛНП</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="cat_ru:CustomsCode"/>
						</td>
					</tr>
				</table>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:DocumentBaseType -->
	<xsl:template match="e_cdcm:DocumentInfo">

		<xsl:apply-templates select="cat_ru:PrDocumentName"/>
		<xsl:if test="cat_ru:PrDocumentNumber">
			<xsl:text> № </xsl:text>
			<xsl:apply-templates select="cat_ru:PrDocumentNumber"/>
		</xsl:if>
		<xsl:if test="cat_ru:PrDocumentDate">
			<xsl:text> от </xsl:text>
			<xsl:apply-templates select="cat_ru:PrDocumentDate" mode="russian_date"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа e_cdcm:CommonMarkType -->
	<xsl:template match="e_cdcm:E_CDCommonMark">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<tr>
				<td class="graphMain bordered">
					<xsl:apply-templates select="e_cdcm:GRNumber"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="e_cdcm:StageMarkIdentifier"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="e_cdcm:NoteMarkIdentifier"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="e_cdcm:StageDescription"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="e_cdcm:MarkDescription"/>
				</td>
				<td class="graphMain bordered">
					<xsl:if test="e_cdcm:DocumentInfo">
						<xsl:apply-templates select="e_cdcm:DocumentInfo">
							<xsl:with-param name="wdth" select="$w"/>
						</xsl:apply-templates>
					</xsl:if>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="e_cdcm:DeadlineReason"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="e_cdcm:Deadline" mode="russian_date"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="e_cdcm:PersonName"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="e_cdcm:LNP"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="e_cdcm:LNPCustomsCode"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="e_cdcm:DateTimeInf"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="e_cdcm:GoodsPresentDate" mode="russian_date"/>
				</td>
				<td class="graphMain bordered">
					<xsl:value-of select="substring(e_cdcm:GoodsPresentTime, 1,8)"/>
				</td>
			</tr>
		</div>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:GTDIDType -->
	<xsl:template match="e_cdcm:E_CDRegNumber">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Номер</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="cat_ru:CustomsCode"/>
						<xsl:text>/</xsl:text>
						<xsl:apply-templates select="cat_ru:RegistrationDate" mode="num_date"/>
						<xsl:text>/</xsl:text>
						<xsl:apply-templates select="cat_ru:GTDNumber"/>
					</td>
				</tr>
			</table>
		</div>
	</xsl:template>
	<!-- Шаблон для типа e_cdcm:ResolutionType -->
	<xsl:template match="e_cdcm:E_CDResolution">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<xsl:if test="catESAD_ru:DecisionCode">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Код решения в соответствии с классификатором решений,  принимаемых таможенными органами (**) - различно по товарам (заполняется при указании решения по декларации)</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="catESAD_ru:DecisionCode"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="catESAD_ru:DateInf">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Дата</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="catESAD_ru:DateInf" mode="russian_date"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="catESAD_ru:TimeInf">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Время</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="substring(catESAD_ru:TimeInf, 1,8)"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="catESAD_ru:LNP">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">ЛНП</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="catESAD_ru:LNP"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="catESAD_ru:LNPCustomsCode">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Код таможенного органа, указанный на оттиске ЛНП</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="catESAD_ru:LNPCustomsCode"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="catESAD_ru:Foundation">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Обоснование</td>
						<td class="graphMain value" style="width:50%">
							<xsl:for-each select="catESAD_ru:Foundation">
								<xsl:value-of select="."/>
								<xsl:if test="position()!=last()">
									<xsl:text>, </xsl:text>
								</xsl:if>
							</xsl:for-each>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="catESAD_ru:ResolutionDesc">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Описание принятого решения</td>
						<td class="graphMain value" style="width:50%">
							<xsl:for-each select="catESAD_ru:ResolutionDesc">
								<xsl:value-of select="."/>
								<xsl:if test="position()!=last()">
									<xsl:text>, </xsl:text>
								</xsl:if>
							</xsl:for-each>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="e_cdcm:FoundationDes">
				<div class="title marg-top">Обоснование принятого решения </div>
				<table class="bordered">
					<tbody>
						<tr class="title">
							<td class="graphMain bordered">Код обоснования принятого решения</td>
							<td class="graphMain bordered">Текст обоснования</td>
							<td class="graphMain bordered">Код описания принятого решения</td>
							<td class="graphMain bordered">Описание принятого решения</td>
							<td class="graphMain bordered">Рекомендации по устранению причин </td>
						</tr>
						<xsl:for-each select="e_cdcm:FoundationDes">
							<xsl:apply-templates select=".">
								<xsl:with-param name="wdth" select="$w"/>
							</xsl:apply-templates>
						</xsl:for-each>
					</tbody>
				</table>
			</xsl:if>
			<xsl:if test="e_cdcm:PersonName">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">ФИО должностного лица таможенного органа</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="e_cdcm:PersonName"/>
						</td>
					</tr>
				</table>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа e_cdcm:FoundationType -->
	<xsl:template match="e_cdcm:FoundationDes" mode="inline">
		<xsl:if test="e_cdcm:FoundationCode">
			<xsl:apply-templates select="e_cdcm:FoundationCode"/>
			<xsl:text>, </xsl:text>
		</xsl:if>
		<xsl:if test="e_cdcm:FoundationText">
			<xsl:apply-templates select="e_cdcm:FoundationText"/>
			<xsl:text>, </xsl:text>
		</xsl:if>
		<xsl:if test="e_cdcm:ResolutionCode">
			<xsl:apply-templates select="e_cdcm:ResolutionCode"/>
			<xsl:text>, </xsl:text>
		</xsl:if>
		<xsl:if test="e_cdcm:ResolutionDescription">
			<xsl:apply-templates select="e_cdcm:ResolutionDescription"/>
			<xsl:text>, </xsl:text>
		</xsl:if>
		<xsl:if test="e_cdcm:Recommendation">
			<xsl:apply-templates select="e_cdcm:Recommendation"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа e_cdcm:FoundationType -->
	<xsl:template match="e_cdcm:FoundationDes">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<tr>
				<td class="graphMain bordered">
					<xsl:apply-templates select="e_cdcm:FoundationCode"/>
				</td>
				<td class="graphMain bordered">
					<xsl:for-each select="e_cdcm:FoundationText">
						<xsl:if test="position()!=1">
							<br/>
						</xsl:if>
						<xsl:apply-templates select="."/>
					</xsl:for-each>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="e_cdcm:ResolutionCode"/>
				</td>
				<td class="graphMain bordered">
					<xsl:for-each select="e_cdcm:ResolutionDescription">
						<xsl:if test="position()!=1">
							<br/>
						</xsl:if>
						<xsl:apply-templates select="."/>
					</xsl:for-each>
				</td>
				<td class="graphMain bordered">
					<xsl:for-each select="e_cdcm:Recommendation">
						<xsl:if test="position()!=1">
							<br/>
						</xsl:if>
						<xsl:apply-templates select="."/>
					</xsl:for-each>
				</td>
			</tr>
		</div>
	</xsl:template>
	<!-- Шаблон для типа e_cdcm:GoodsMarkType -->
	<xsl:template match="e_cdcm:GoodsMark">
		<br/>
		<xsl:for-each select="*">
			<xsl:if test="position() != 1">, </xsl:if>
			<xsl:choose>
				<xsl:when test="contains(local-name(), 'Date') or contains(local-name(), 'Deadline')">
					<xsl:apply-templates select="." mode="russian_date"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:apply-templates select="."/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:for-each>
	</xsl:template>
	<!-- Шаблон для типа e_cdcm:GoodsResolutionType -->
	<xsl:template match="e_cdcm:GoodsResolution">
		<xsl:if test="position() != 1"><br/><br/></xsl:if>
		<xsl:apply-templates select="e_cdcm:GoodsNumeric"/>
		<xsl:text>, </xsl:text>
		<xsl:apply-templates select="e_cdcm:TotalGoodsNumeric"/>
		<xsl:if test="e_cdcm:GoodsResult">
			<br/>
			<xsl:text>Принятые решения по товарам:</xsl:text>
			<xsl:apply-templates select="e_cdcm:GoodsResult">
			</xsl:apply-templates>
		</xsl:if>
		<xsl:if test="e_cdcm:GoodsMark">
			<br/>
			<xsl:text>Служебные отметки по товарам:</xsl:text>
			<xsl:apply-templates select="e_cdcm:GoodsMark">
			</xsl:apply-templates>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа e_cdcm:ResolutionType -->
	<xsl:template match="e_cdcm:GoodsResult">
		<xsl:if test="position() != 1"><br/></xsl:if>

					<xsl:apply-templates select="catESAD_ru:DecisionCode"/>
					<xsl:text>, </xsl:text>
					<xsl:apply-templates select="catESAD_ru:DateInf" mode="russian_date"/>
					<xsl:text>, </xsl:text>
					<xsl:value-of select="substring(catESAD_ru:TimeInf, 1,8)"/>
					<xsl:text>, </xsl:text>
					<xsl:apply-templates select="catESAD_ru:LNP"/>
					<xsl:text>, </xsl:text>
					<xsl:apply-templates select="catESAD_ru:LNPCustomsCode"/>
					<xsl:text>, </xsl:text>
					<xsl:apply-templates select="catESAD_ru:Foundation"/>
					<xsl:text>, </xsl:text>
					<xsl:apply-templates select="catESAD_ru:ResolutionDesc"/>
					<xsl:text>, </xsl:text>
					<xsl:apply-templates select="e_cdcm:FoundationDes" mode="inline"/>
					<xsl:text>, </xsl:text>
					<xsl:apply-templates select="e_cdcm:PersonName"/>

	</xsl:template>
	<!-- Шаблон для типа e_cdcm:WayBillType -->
	<xsl:template match="e_cdcm:IndividualWayBill">
		
		<xsl:apply-templates select="cat_ru:PrDocumentName"/>
		<xsl:if test="cat_ru:PrDocumentNumber">
			<xsl:text> № </xsl:text>
			<xsl:apply-templates select="cat_ru:PrDocumentNumber"/>
		</xsl:if>
		<xsl:if test="cat_ru:PrDocumentDate">
			<xsl:text> от </xsl:text>
			<xsl:apply-templates select="cat_ru:PrDocumentDate" mode="russian_date"/>
		</xsl:if>
		<xsl:text> </xsl:text>
		<xsl:apply-templates select="e_cdcm:WayBillID"/>
		<xsl:text> </xsl:text>
		<xsl:apply-templates select="e_cdcm:ObjectOrdinal"/>
		<xsl:if test="e_cdcm:ConsigneeName">
			<xsl:text> </xsl:text>
			<xsl:apply-templates select="e_cdcm:ConsigneeName"/>
		</xsl:if>
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
	<xsl:template name="num_date">
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<xsl:value-of select="substring($dateIn,9,2)"/>
				<xsl:text></xsl:text>
				<xsl:value-of select="substring($dateIn,6,2)"/>
				<xsl:text></xsl:text>
				<xsl:value-of select="substring($dateIn,3,2)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dateIn"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="//*[local-name()='E_CommerceDeclarationCustomMark']//*" priority="-1">
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
	<xsl:template match="*" mode="date">
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
	<xsl:template match="*" mode="num_date">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:call-template name="num_date">
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
