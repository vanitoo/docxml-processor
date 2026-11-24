<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" xmlns:catESAD_cu="urn:customs.ru:CUESADCommonAggregateTypesCust:5.28.0" xmlns:tipres="urn:customs.ru:Information:CustomsDocuments:TSMPInfoPlaceResponse:5.28.0">
	<xsl:template match="tipres:TSMPInfoPlaceResponse">
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
									<xsl:text>ОТВЕТ ЖЕЛЕЗНОДОРОЖНОГО ПЕРЕВОЗЧИКА НА ТРЕБОВАНИЕ</xsl:text>
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
								<td class="bordered" align="left">
									<xsl:text>Номер Требования о представлении информации:</xsl:text>
								</td>
								<td class="bordered" align="left">
									<xsl:value-of select="tipres:RequestNumber/tipres:CustomsCode"/>
									<xsl:text>/</xsl:text>
									<xsl:call-template name="russian_date_gtd">
										<xsl:with-param name="dateIn" select="tipres:RequestNumber/tipres:RegistrationDate"/>
									</xsl:call-template>
									<xsl:text>/</xsl:text>
									<xsl:value-of select="tipres:RequestNumber/tipres:RegistrationNumber"/>
								</td>
							</tr>
							<tr>
								<td class="bordered" align="left">
									<xsl:text>Станция местонахождения ТСМП:</xsl:text>
								</td>
								<td class="bordered" align="left">
									<xsl:value-of select="tipres:FactStation"/>
								</td>
							</tr>
							<tr>
								<td class="bordered" align="left">
									<xsl:text>Фактическое место нахождения ТСМП:</xsl:text>
								</td>
								<td class="bordered" align="left">
									<xsl:apply-templates select="cat_ru:Address">
										<xsl:with-param name="wdth" select="tipres:FactAddress"/>
									</xsl:apply-templates>
								</td>
							</tr>
							<tr>
								<td class="bordered" align="left">
									<xsl:text>Вид перевозки:</xsl:text>
								</td>
								<td class="bordered" align="left">
									<xsl:choose>
										<xsl:when test="tipres:TransportationType='1'">
											<xsl:text>После завершения международной перевозки, для выполнения которой ж/д ТСМП и (или) перевозимые на ж/д ТС контейнеры были ввезены на таможенную территорию ЕАЭС</xsl:text>
										</xsl:when>
										<xsl:when test="tipres:TransportationType='2'">
											<xsl:text>При следовании порожнего ж/д ТСМП и (или) перевозимых на ж/д ТС контейнеров по таможенной территории ЕАЭС для начала международной перевозки, для выполнения которой ж/д ТСМП и (или) перевозимые на ж/д ТС контейнеры были ввезены на таможенную территорию ЕАЭС</xsl:text>
										</xsl:when>
										<xsl:when test="tipres:TransportationType='3'">
											<xsl:text>При следовании порожнего ж/д ТСМП и (или) перевозимых на ж/д ТС контейнеров через таможенную территорию ЕАЭС</xsl:text>
										</xsl:when>
										<xsl:otherwise>
											<xsl:value-of select="tipres:TransportationType"/>
										</xsl:otherwise>
									</xsl:choose>
								</td>
							</tr>
							<tr>
								<td class="bordered" align="left">
									<xsl:text>Номер единицы железнодорожного подвижного состава, контейнера:</xsl:text>
								</td>
								<td class="bordered" align="left">
									<xsl:value-of select="tipres:RWNumber"/>
								</td>
							</tr>
							<xsl:if test="tipres:DepartureStation">
								<tr>
									<td class="bordered" align="left">
										<xsl:text>Станция отправления:</xsl:text>
									</td>
									<td class="bordered" align="left">
										<xsl:value-of select="tipres:DepartureStation"/>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="tipres:DestinationStation">
								<tr>
									<td class="bordered" align="left">
										<xsl:text>Станция назначения:</xsl:text>
									</td>
									<td class="bordered" align="left">
										<xsl:value-of select="tipres:DestinationStation"/>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="tipres:TSMPRecipient">
								<tr>
									<td class="bordered" align="left">
										<xsl:text>Получатель ТСМП:</xsl:text>
									</td>
									<td class="bordered" align="left">
										<xsl:value-of select="tipres:TSMPRecipient"/>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="tipres:Date">
								<tr>
									<td class="bordered" align="left">
										<xsl:text>Дата уведомления о передаче ТСМП:</xsl:text>
									</td>
									<td class="bordered" align="left">
										<xsl:call-template name="russian_date">
											<xsl:with-param name="dateIn" select="tipres:Date"/>
										</xsl:call-template>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="tipres:Number">
								<tr>
									<td class="bordered" align="left">
										<xsl:text>Номер уведомления о передаче ТСМП:</xsl:text>
									</td>
									<td class="bordered" align="left">
										<xsl:value-of select="tipres:Number"/>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="tipres:Customs">
								<tr>
									<td class="bordered" align="left">
										<xsl:text>Таможенный орган, которому направлено уведомление:</xsl:text>
									</td>
									<td class="bordered" align="left">
										<xsl:value-of select="tipres:Customs/cat_ru:Code"/>
										<xsl:if test="tipres:Customs/cat_ru:OfficeName">
											<xsl:text> </xsl:text>
											<xsl:value-of select="tipres:Customs/cat_ru:OfficeName"/>
										</xsl:if>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="tipres:Customs">
								<tr>
									<td class="bordered" align="left">
										<xsl:text>Номер декларации на транспортное средство:</xsl:text>
									</td>
									<td class="bordered" align="left">
										<xsl:value-of select="tipres:DTMDoc/cat_ru:CustomsCode"/>
										<xsl:text>/</xsl:text>
										<xsl:call-template name="russian_date_gtd">
											<xsl:with-param name="dateIn" select="tipres:DTMDoc/cat_ru:RegistrationDate"/>
										</xsl:call-template>
										<xsl:text>/</xsl:text>
										<xsl:value-of select="tipres:DTMDoc/catESAD_cu:TransportModeCode"/>
										<xsl:value-of select="tipres:DTMDoc/cat_ru:GTDNumber"/>
									</td>
								</tr>
							</xsl:if>
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

	<!-- Шаблон для типа cat_ru:AddressType -->
	<xsl:template match="cat_ru:Address">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<xsl:if test="cat_ru:PostalCode">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Почтовый индекс</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="cat_ru:PostalCode"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:CountryCode">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Буквенный код страны в соответствии с классификатором стран мира</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="cat_ru:CountryCode"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:CounryName">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Краткое название страны в соответствии с классификатором стран мира</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="cat_ru:CounryName"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:Region">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Область (регион, штат, провинция и т.п.)</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="cat_ru:Region"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:City">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Населенный пункт</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="cat_ru:City"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:StreetHouse">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Улица, номер дома, номер офиса</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="cat_ru:StreetHouse"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:TerritoryCode">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Код административно-территориальной единицы в соответствии с ГК СОАТЕ (для Кыргызской Республики)</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="cat_ru:TerritoryCode"/>
						</td>
					</tr>
				</table>
			</xsl:if>
		</div>
	</xsl:template>

	<!-- Шаблон для типа cat_ru:PersonBaseType -->
	<xsl:template match="tipres:CustomsPerson">
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