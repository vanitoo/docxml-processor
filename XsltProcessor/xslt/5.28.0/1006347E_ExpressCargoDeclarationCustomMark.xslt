<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:ecdcm="urn:customs.ru:Information:CustomsDocuments:ExpressCargoDeclarationCustomMark:5.24.0" xmlns:xs="http://www.w3.org/2001/XMLSchema">
	<!-- Шаблон для типа ExpressCargoDeclarationCustomMarkType -->
	<xsl:template match="ecdcm:ExpressCargoDeclarationCustomMark">
		<xsl:param name="w" select="190"/>
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
										<b>Отметки таможенного органа декларации на товары для экспресс-грузов/ пассажирской таможенной декларации для экспресс-грузов</b>
									</font>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<!--table>
						<tr>
							<td class="annot graphMain" style="width:50%">Уникальный идентификатор документа</td>
							<td class="value graphMain" style="width:50%">
								<xsl:value-of select="cat_ru:DocumentID"/>
							</td>
						</tr>
					</table>
					<xsl:if test="cat_ru:RefDocumentID">
						<table>
							<tr>
								<td class="annot graphMain" style="width:50%">Уникальный идентификатор исходного документа</td>
								<td class="value graphMain" style="width:50%">
									<xsl:value-of select="cat_ru:RefDocumentID"/>
								</td>
							</tr>
						</table>
					</xsl:if-->
					<xsl:if test="ecdcm:ApplicationRegNumber">
						<div>
							<xsl:apply-templates select="ecdcm:ApplicationRegNumber">
								<xsl:with-param name="wdth" select="$w"/>
							</xsl:apply-templates>
						</div>
					</xsl:if>
					<div class="title marg-top">Принятые решения по индивидуальным накладным</div>
					<table class="bordered">
						<tbody>
							<tr class="title">
								<td class="graphMain bordered">Принятое решение</td>
								<td class="graphMain bordered">Дата и время принятия решения</td>
								<td class="graphMain bordered">Код причины отказа в выпуске</td>
								<td class="graphMain bordered">Описание причины отказа в выпуске</td>
								<td class="graphMain bordered">Сведения об индивидуальной накладной</td>
							</tr>
							<xsl:for-each select="ecdcm:Consignment">
								<xsl:apply-templates select=".">
									<xsl:with-param name="wdth" select="$w"/>
								</xsl:apply-templates>
							</xsl:for-each>
						</tbody>
					</table>
					<xsl:if test="ecdcm:CustomsPerson">
						<div class="title marg-top">Должностное лицо таможенного органа</div>
						<div>
							<xsl:apply-templates select="ecdcm:CustomsPerson">
								<xsl:with-param name="wdth" select="$w"/>
							</xsl:apply-templates>
						</div>
					</xsl:if>
				</div>
			</body>
		</html>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:GTDIDType -->
	<xsl:template match="ecdcm:ApplicationRegNumber">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%"><div class="title marg-top">Регистрационный номер ДТЭГ/ ПТДЭГ</div></td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:CustomsCode"/>
						<xsl:text>/</xsl:text>
						<xsl:call-template name="num_date">
							<xsl:with-param name="dateIn" select="cat_ru:RegistrationDate"/>
						</xsl:call-template>
						<xsl:text>/</xsl:text>
						<xsl:value-of select="cat_ru:GTDNumber"/>
					</td>
				</tr>
			</table>
		</div>
	</xsl:template>
	<!-- Шаблон для типа ecdcm:ConsignmentType -->
	<xsl:template match="ecdcm:Consignment">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<!--div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;"-->
			<tr>
				<td class="graphMain bordered" valign="top" style="vertical-align: top;">
					<xsl:choose>
						<xsl:when test="ecdcm:DecisionCode='10'">
							<xsl:text>выпуск товаров без уплаты таможенных платежей</xsl:text>
						</xsl:when>
						<xsl:when test="ecdcm:DecisionCode='30'">
							<xsl:text>выпуск возвращаемых товаров разрешен</xsl:text>
						</xsl:when>
						<xsl:when test="ecdcm:DecisionCode='31'">
							<xsl:text>требуется уплата таможенных платежей</xsl:text>
						</xsl:when>
						<xsl:when test="ecdcm:DecisionCode='32'">
							<xsl:text>выпуск товаров разрешен, таможенные платежи уплачены</xsl:text>
						</xsl:when>
						<xsl:when test="ecdcm:DecisionCode='40'">
							<xsl:text>разрешение на отзыв</xsl:text>
						</xsl:when>
						<xsl:when test="ecdcm:DecisionCode='50'">
							<xsl:text>предварительное решение, выпуск разрешен без уплаты таможенных платежей</xsl:text>
						</xsl:when>
						<xsl:when test="ecdcm:DecisionCode='51'">
							<xsl:text>предварительное решение, выпуск с уплатой таможенных платежей</xsl:text>
						</xsl:when>
						<xsl:when test="ecdcm:DecisionCode='60'">
							<xsl:text>срок выпуска товаров приостановлен</xsl:text>
						</xsl:when>
						<xsl:when test="ecdcm:DecisionCode='61'">
							<xsl:text>срок приостановления срока выпуска товаров продлен</xsl:text>
						</xsl:when>
						<xsl:when test="ecdcm:DecisionCode='62'">
							<xsl:text>приостановление срока выпуска товаров отменено</xsl:text>
						</xsl:when>
						<xsl:when test="ecdcm:DecisionCode='70'">
							<xsl:text>продление срока выпуска</xsl:text>
						</xsl:when>
						<xsl:when test="ecdcm:DecisionCode='90'">
							<xsl:text>отказ в выпуске товаров</xsl:text>
						</xsl:when>
						<xsl:when test="ecdcm:DecisionCode='92'">
							<xsl:text>требуется таможенный контроль</xsl:text>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="ecdcm:DecisionCode"/>
						</xsl:otherwise>
					</xsl:choose>
				</td>
				<td class="graphMain bordered" valign="top" style="vertical-align: top;">
					<xsl:call-template name="russian_date">
						<xsl:with-param name="dateIn" select="ecdcm:DecisionDate"/>
					</xsl:call-template>
					<xsl:text> </xsl:text>
					<xsl:value-of select="substring(ecdcm:DecisionDate, 12, 8)"/>
				</td>
				<td class="graphMain bordered" valign="top" style="vertical-align: top;">
					<xsl:value-of select="ecdcm:ReasonCode"/>
				</td>
				<td class="graphMain bordered" valign="top" style="vertical-align: top;">
					<xsl:value-of select="ecdcm:Reason"/>
				</td>
				<td class="graphMain bordered" valign="top" style="vertical-align: top;">
					<xsl:apply-templates select="ecdcm:IndividualWayBill">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</td>
			</tr>
		<!--/div-->
	</xsl:template>
	<!-- Шаблон для типа cat_ru:CustomsPersonType -->
	<xsl:template match="ecdcm:CustomsPerson">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">ФИО должностного лица таможенного органа</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:PersonName"/>
					</td>
				</tr>
			</table>
			<xsl:if test="cat_ru:LNP">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">ЛНП должностного лица таможенного органа</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="cat_ru:LNP"/>
						</td>
					</tr>
				</table>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа ecdcm:WayBillType -->
	<xsl:template match="ecdcm:IndividualWayBill">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<!--div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;"-->
			<xsl:if test="cat_ru:PrDocumentName">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Наименование</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="cat_ru:PrDocumentName"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:PrDocumentNumber">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Номер</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="cat_ru:PrDocumentNumber"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:PrDocumentDate">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Дата</td>
						<td class="value graphMain" style="width:50%">
							<xsl:call-template name="russian_date">
								<xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
							</xsl:call-template>
						</td>
					</tr>
				</table>
			</xsl:if>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">ID накладной в реестре</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="ecdcm:WayBillID"/>
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Порядковый № накладной</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="ecdcm:ObjectOrdinal"/>
					</td>
				</tr>
			</table>
			<xsl:if test="ecdcm:ConsigneeName">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Наименование получателя</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="ecdcm:ConsigneeName"/>
						</td>
					</tr>
				</table>
			</xsl:if>
		<!--/div-->
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
</xsl:stylesheet>
