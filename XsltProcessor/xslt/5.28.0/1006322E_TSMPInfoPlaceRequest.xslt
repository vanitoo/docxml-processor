<?xml version="1.0" encoding="UTF-8"?>
<!-- Приказ Минфина России от 22.07.2020 № 148н "Об утверждении порядка представления железнодорожными перевозчиками таможенным органам информации о месте нахождения временно ввезенного железнодорожного транспортного средства международной перевозки и (или) перевозимых на железнодорожных транспортных средствах контейнеров, в том числе используемых для внутренних перевозок, осуществляемого с использованием информационных систем" Приложение-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.24.0" xmlns:catESAD_cu="urn:customs.ru:CUESADCommonAggregateTypesCust:5.28.0" xmlns:tipreq="urn:customs.ru:Information:CustomsDocuments:TSMPInfoPlaceRequest:5.28.0">
	<xsl:template match="tipreq:TSMPInfoPlaceRequest">
		<html>
			<head>
				<style>
					body
					{background: #cccccc;}

					div
					{white-space: nowrap;}

					div.page
					{width: 210mm;
					/*max-width:210mm;*/
					width: 100%;
					max-width: 100%;
					margin: 10px auto;
					margin-top: 6pt;
					margin-bottom: 6pt;
					padding: 10mm;
					padding-left: 20mm;
					background: #ffffff;
					border: solid 1pt #000000;
					page-break-after: always;}

					.marg-top
					{margin-top:5mm;}

					table
					{width: 100%;
					border: 1;
					empty-cells: show;
					border-collapse: collapse;
					margin-top: 1px;}

					table.border tr td
					{border: 1px solid windowtext;
					vertical-align:top;}

					.graph
					{font-family: Arial;
					font-size: 10pt;}

					.value
					{border-bottom: solid 1px black;}

					.hide_line
					{border-top: hide;
					border-bottom: hide;
					border-right: solid 1px black;
					border-left: solid 1px black;}			

					div.title, tr.title td
					{font-weight:bold;}

					.bordered
					{border-collapse: collapse;}

					td.bordered
					{border: solid 1px windowtext;}

					.border_bottom
					{border-bottom: 1px solid black;}

					.graphMain
					{font-family: Arial;
					font-size: 10pt;}

					.graphLittle 
					{font-family: Arial;
					font-size: 7pt;}

					.graphDelim 
					{font-family: Arial;
					font-size: 4pt;}

					td.graphMain
					{vertical-align:top;}

					td.value.graphMain
					{vertical-align:top;}

					.graphHeader
					{font-family: Arial;
					font-size: 12pt;
					font-weight:bold;}

					td.graphHeader
					{vertical-align:top;}

					td.value.graphHeader
					{vertical-align:bottom;}

					.normal
					{font-size: 10pt;
					font-family:Arial;}			

					.bold
					{font-weight: bold;
					font-family:Arial;
					font-size: 9pt;}			

					.italic
					{font-style: italic;
					font-family:Arial;
					font-size: 11pt;}		

					.delim
					{height: 7pt;}

					.delim_3
					{height: 3pt;}
				</style>
			</head>
			<body>
				<div class="page">
					<br/>
					<table>
						<tbody width="100%" class="graphMain">
							<tr align="center" class="graphHeader">
								<td>
									<xsl:text>ТРЕБОВАНИЕ</xsl:text>
									<br/>
									<xsl:text>О ПРЕДСТАВЛЕНИИ ИНФОРМАЦИИ О МЕСТЕ НАХОЖДЕНИЯ</xsl:text>
									<br/>
									<xsl:text>ВРЕМЕННО ВВЕЗЕННОГО ЖЕЛЕЗНОДОРОЖНОГО ТРАНСПОРТНОГО</xsl:text>
									<br/>
									<xsl:text>СРЕДСТВА МЕЖДУНАРОДНОЙ ПЕРЕВОЗКИ И (ИЛИ) ПЕРЕВОЗИМЫХ</xsl:text>
									<br/>
									<xsl:text>НА ЖЕЛЕЗНОДОРОЖНЫХ ТРАНСПОРТНЫХ СРЕДСТВАХ КОНТЕЙНЕРОВ</xsl:text>
								</td>
							</tr>
							<tr>
								<td class="delim">
									<br/>
								</td>
							</tr>
						</tbody>
					</table>
					<table>
						<tbody width="100%" class="graphMain" align="center">
							<tr>
								<td class="bordered" align="left" colspan="3">
									<xsl:text>Требование о необходимости представления железнодорожным перевозчиком сведений:</xsl:text>
									<br/>
									<br/>
									<xsl:text>о фактическом месте нахождения ТСМП</xsl:text><sup>1</sup><xsl:text> и виде перевозки с учетом пункта 5 статьи 275 ТК ЕАЭС</xsl:text><sup>2</sup><xsl:text>, либо об ином перевозчике, получателе ТСМП в случае передачи ТСМП таким лицам - о дате, номере уведомления о передаче ТСМП и таможенном органе, которому было направлено такое уведомление;</xsl:text>
									<br/>
									<br/>
									<xsl:text>о станциях отправления и назначения - в случае осуществления внутренней перевозки.</xsl:text>
								</td>
							</tr>
							<tr>
								<td class="bordered" colspan="3">
									<xsl:text>№ </xsl:text>
									<xsl:value-of select="tipreq:RequestNumber/tipreq:CustomsCode"/>
									<xsl:text>/</xsl:text>
									<xsl:call-template name="russian_date_gtd">
										<xsl:with-param name="dateIn" select="tipreq:RequestNumber/tipreq:RegistrationDate"/>
									</xsl:call-template>
									<xsl:text>/</xsl:text>
									<xsl:value-of select="tipreq:RequestNumber/tipreq:RegistrationNumber"/>
								</td>
							</tr>
							<tr>
								<td class="bordered" align="left" colspan="3">
									<xsl:text>1. Сведения о железнодорожном перевозчике:</xsl:text>
								</td>
							</tr>
							<tr>
								<td class="bordered" align="center">
									<xsl:value-of select="tipreq:RWCarrier/RUScat_ru:RFOrganizationFeatures/cat_ru:INN"/>
								</td>
								<td class="bordered" align="center" colspan="2">
									<xsl:choose>
										<xsl:when test="tipreq:RWCarrier/RUScat_ru:OrganizationName">
											<xsl:value-of select="tipreq:RWCarrier/RUScat_ru:OrganizationName"/>
										</xsl:when>
										<xsl:otherwise>
											<xsl:value-of select="tipreq:RWCarrier/RUScat_ru:ShortName"/>
										</xsl:otherwise>
									</xsl:choose>
									<br/>
									<xsl:text>Адрес: </xsl:text>
									<xsl:value-of select="tipreq:RWCarrier/RUScat_ru:Address"/>
								</td>
							</tr>
							<tr>
								<td class="bordered" align="center">
									<xsl:text>(идентификационный номер налоплательщика)</xsl:text>
								</td>
								<td class="bordered" align="center" colspan="2">
									<xsl:text>(полное или краткое (сокращенное) наименование (при наличии) юридического лица, организации, не являющейся юридическим лицом, адрес юридического лица, организации, не являющейся юридическим лицом)</xsl:text>
								</td>
							</tr>
							<tr>
								<td class="bordered" align="left">
									<xsl:text>2. Номер декларации на транспортное средство</xsl:text>
								</td>
								<td class="bordered" align="left">
									<xsl:text>3. Номер единицы железнодорожного подвижного состава, контейнера</xsl:text>
								</td>
								<td class="bordered" align="left">
									<xsl:text>4. Срок временного ввоза</xsl:text>
								</td>
							</tr>
							<tr>
								<td class="bordered">
									<xsl:value-of select="tipreq:DTMDoc/cat_ru:CustomsCode"/>
									<xsl:text>/</xsl:text>
									<xsl:call-template name="russian_date_gtd">
										<xsl:with-param name="dateIn" select="tipreq:DTMDoc/cat_ru:RegistrationDate"/>
									</xsl:call-template>
									<xsl:text>/</xsl:text>
									<xsl:value-of select="tipreq:DTMDoc/catESAD_cu:TransportModeCode"/>
									<xsl:value-of select="tipreq:DTMDoc/cat_ru:GTDNumber"/>
								</td>
								<td class="bordered">
									<xsl:value-of select="tipreq:RWNumber"/>
								</td>
								<td class="bordered">
									<xsl:call-template name="russian_date">
										<xsl:with-param name="dateIn" select="tipreq:TemporaryImportDate"/>
									</xsl:call-template>
								</td>
							</tr>
							<tr>
								<td class="bordered" align="left">
									<xsl:text>5. Срок представления информации:</xsl:text>
								</td>
								<td class="bordered" colspan="2">
									<xsl:call-template name="russian_date">
										<xsl:with-param name="dateIn" select="tipreq:ResponseDate"/>
									</xsl:call-template>
								</td>
							</tr>
							<tr>
								<td class="bordered" align="left" colspan="3">
									<xsl:text>Должностное лицо контролирующего таможенного органа:</xsl:text>
								</td>
							</tr>
							<tr>
								<td class="bordered" align="center">
									<xsl:value-of select="tipreq:CustomsPerson/cat_ru:PersonPost"/>
								</td>
								<td class="bordered"></td>
								<td class="bordered" align="center">
									<xsl:apply-templates select="tipreq:CustomsPerson"/>
								</td>
							</tr>
							<tr>
								<td class="bordered" align="center">
									<xsl:text>(должность)</xsl:text>
								</td>
								<td class="bordered" align="center">
									<xsl:text>(подпись)</xsl:text>
								</td>
								<td class="bordered" align="center">
									<xsl:text>(инициалы, фамилия)</xsl:text>
								</td>
							</tr>
						</tbody>
					</table>
					<table>
						<tbody>
							<tr>
								<td width="2%"/>
								<td width="98%"/>
							</tr>
							<tr>
								<td colspan="2" class="graphDelim">
									<br/>
								</td>
							</tr>
							<tr>
								<td class="graphLittle"><sup>1</sup></td>
								<td class="graphLittle">
									<xsl:text>ТСМП - транспортное средство международной перевозки и (или) перевозимые на железнодорожных транспортных средствах контейнеры.</xsl:text>
								</td>
							</tr>
							<tr>
								<td class="graphLittle"><sup>2</sup></td>
								<td class="graphLittle">
									<xsl:text>ТК ЕАЭС - Таможенный кодекс Евразийского экономического союза (Федеральный закон от 14 ноября 2017 г. N 317-ФЗ "О ратификации Договора о Таможенном кодексе Евразийского экономического союза" (Собрание законодательства Российской Федерации, 2017, N 47, ст. 6843).</xsl:text>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</body>
		</html>
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
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<span class="normal">
					<xsl:value-of select="substring($dateIn,9,2)"/>
				</span>
				<span class="normal">.</span>
				<span class="normal">
					<xsl:value-of select="substring($dateIn,6,2)"/>
				</span>
				<span class="normal">.</span>
				<span class="normal">
					<xsl:value-of select="substring($dateIn,1,4)"/>
				</span>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dateIn"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<!-- Шаблон для типа cat_ru:PersonBaseType -->
	<xsl:template match="tipreq:CustomsPerson">
		<xsl:value-of select="cat_ru:PersonSurname"/>
		<xsl:text> </xsl:text>
		<xsl:value-of select="substring(cat_ru:PersonName,1,1)"/>
		<xsl:if test="cat_ru:PersonName">
			<xsl:text>.</xsl:text>
		</xsl:if>
		<xsl:value-of select="substring(cat_ru:PersonMiddleName,1,1)"/>
		<xsl:if test="cat_ru:PersonMiddleName">
			<xsl:text>.</xsl:text>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>