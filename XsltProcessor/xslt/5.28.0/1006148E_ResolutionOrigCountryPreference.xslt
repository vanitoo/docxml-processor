<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet exclude-result-prefixes="rocp cat_ru" version="1.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" xmlns:rocp="urn:customs.ru:Information:CustomsDocuments:ResolutionOrigCountryPreference:5.24.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output encoding="UTF-8" indent="yes" method="html" version="1.0"/>
	<xsl:template match="/">
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="rocp:ResolutionOrigCountryPreference">
		<html>
			<head>
				<META CONTENT="text/html; charset=UTF-8" HTTP-EQUIV="Content-Type"/>
				<title>Информация о контроле страны происхождения товаров и (или) предоставлении (отказе в предоставлении) тарифных преференций</title>
				<style type="text/css">
			body {
			background: #cccccc;
			}

			div
			{
			white-space: nowrap;
			}

			div.page {
			width: 180mm;
			max-width: 180mm;
			margin: 10px auto;
			margin-top: 6pt;
			margin-bottom: 6pt;
			padding: 10mm;
			padding-left: 20mm;
			background: #ffffff;
			border: solid 1pt #000000;
			page-break-after: always;
			}

			.marg-top
			{
			margin-top:5mm;
			}

			table
			{
			width: 100%;
			table-layout: fixed;
			word-wrap: break-word;
			border: 0;
			empty-cells: show;
			border-collapse: collapse;
			margin-top: 1px;
			}

			table.border tr td
			{
			border: 1px solid windowtext;
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

			.border_bottom
			{
			border-bottom: 1px solid black;
			}

			.graphMain
			{
			font-family: Arial;
			font-size: 11pt;
			}

			.graphLittle 
			{
			font-family: Arial;
			font-size: 7pt;
			text-align: center;
			}
	
			.graphDelim 
			{
			font-family: Arial;
			font-size: 4pt;
			}

			td.graphMain
			{
			vertical-align:top;
			}
			td.value.graphMain
			{
			vertical-align:top;
			}

			.graphHeader
			{
			font-family: Arial;
			font-size: 11pt;
			font-weight:bold;
			}

			td.graphHeader
			{
			vertical-align:top;
			}
			td.value.graphHeader
			{
			vertical-align:bottom;
			}

			.normal
			{
			font-size: 11pt;
			font-family:Arial;
			}			

			.bold
			{
			font-weight: bold;
			font-family:Arial;
			font-size: 9pt;
			}			

			.italic
			{
			font-style: italic;
			font-family:Arial;
			font-size: 11pt;
			}		
			
			.delim {
				height: 7pt;
			}

			.delim_3 {
				height: 3pt;
			}

		</style>
			</head>
			<body>
				<div class="page">
					<table class="graphMain">
						<tbody>
							<tr>
								<td>
									<table>
										<tbody>
											<tr>
												<td align="center" width="35%" class="bordered">
													<!--Наименование таможенного органа-->
													<xsl:value-of select="rocp:Customs/cat_ru:OfficeName"/>
													<br/>
													<xsl:value-of select="rocp:Customs/cat_ru:Code"/>
												</td>
												<td width="30%"/>
												<td align="center" width="35%" class="bordered">
													<!--Наименование декларанта (таможенного представителя)-->
													<xsl:value-of select="rocp:OrganizationName"/>
												</td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
							<tr>
								<td>
									<br/>
								</td>
							</tr>
							<tr>
								<td>
									<table class="graphMain">
										<tbody>
											<tr>
												<td align="center">
													<b>Информация о контроле страны происхождения товаров и (или) предоставлении (отказе в предоставлении) тарифных преференций</b>
												</td>
											</tr>
											<tr>
												<td>
													<br/>
												</td>
											</tr>
											<tr>
												<td align="center">
													<xsl:if test="rocp:ResolutionDate">&#160;от&#160;<u> &#160;						<xsl:value-of select="substring(rocp:ResolutionDate, 9,2)"/> &#160;						<xsl:choose>
																<xsl:when test="(substring(rocp:ResolutionDate,6,2))='01'">января</xsl:when>
																<xsl:when test="(substring(rocp:ResolutionDate,6,2))='02'">февраля</xsl:when>
																<xsl:when test="(substring(rocp:ResolutionDate,6,2))='03'">марта</xsl:when>
																<xsl:when test="(substring(rocp:ResolutionDate,6,2))='04'">апреля</xsl:when>
																<xsl:when test="(substring(rocp:ResolutionDate,6,2))='05'">мая</xsl:when>
																<xsl:when test="(substring(rocp:ResolutionDate,6,2))='06'">июня</xsl:when>
																<xsl:when test="(substring(rocp:ResolutionDate,6,2))='07'">июля</xsl:when>
																<xsl:when test="(substring(rocp:ResolutionDate,6,2))='08'">августа</xsl:when>
																<xsl:when test="(substring(rocp:ResolutionDate,6,2))='09'">сентября</xsl:when>
																<xsl:when test="(substring(rocp:ResolutionDate,6,2))='10'">октября</xsl:when>
																<xsl:when test="(substring(rocp:ResolutionDate,6,2))='11'">ноября</xsl:when>
																<xsl:when test="(substring(rocp:ResolutionDate,6,2))='12'">декабря</xsl:when>
															</xsl:choose>
														</u>
									20<u>
															<xsl:value-of select="substring(rocp:ResolutionDate,3,2)"/>
														</u> &#160;						</xsl:if>
													<xsl:if test="rocp:ResolutionNumber">&#160;№&#160;<u> &#160;						<xsl:value-of select="rocp:ResolutionNumber/rocp:CustomsCode"/>/<xsl:value-of select="rocp:ResolutionNumber/rocp:NomenclatureNumber"/>/<xsl:value-of select="rocp:ResolutionNumber/rocp:SerialNumber"/> &#160;						</u>
													</xsl:if>
												</td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
							<tr>
								<td>
									<br/>
								</td>
							</tr>
							<tr>
								<td>
									<table class="graphMain">
										<tbody>
											<tr>
												<td>
													<span style="text-indent: 5%; text-align: justify;">По результатам таможенного контроля таможенным органом по ДТ №&#160;</span>
													<u>
														<xsl:value-of select="rocp:GTDID/cat_ru:CustomsCode"/>/<xsl:call-template name="russian_date_gtd">
															<xsl:with-param name="date" select="rocp:GTDID/cat_ru:RegistrationDate"/>
														</xsl:call-template>/<xsl:value-of select="rocp:GTDID/cat_ru:GTDNumber"/>&#160;	</u>&#160;принято следующее решение (решения):</td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
							<tr>
								<td>
									<br/>
								</td>
							</tr>
							<tr>
								<td>
									<table class="graphMain">
										<tbody>
											<xsl:if test="rocp:ResolutionDescription/rocp:DecisionSign='1'">
												<tr>
													<td>
														<span style="border: 1pt solid #000000">
															<b> V </b>
														</span> О СТРАНЕ ПРОИСХОЖДЕНИЯ (СП) ТОВАРОВ:
														</td>
												</tr>
												<tr>
													<td>
														<br/>
													</td>
												</tr>
												<tr>
													<td>
														<span style="text-indent: 5%;">1. Заявленные сведения о стране происхождения товаров приняты в отношении следующих товаров:</span>
													</td>
												</tr>
												<tr>
													<td>
														<br/>
													</td>
												</tr>
												<tr>
													<td>
														<table class="graphMain">
															<tbody>
																<tr align="center">
																	<td class="bordered" width="25%">Номер товара по ДТ</td>
																	<td class="bordered" width="30%">Заявленный код СП</td>
																	<td class="bordered" width="45%">Номер и дата документа, подтверждающего заявленную СП</td>
																</tr>
																<xsl:choose>
																	<xsl:when test="rocp:ResolutionDescription/rocp:DecisionMeaning='1'">
																		<xsl:for-each select="rocp:ResolutionDescription/rocp:InfoCountryCode[../rocp:DecisionMeaning='1']">
																			<tr>
																				<td class="bordered">
																					<xsl:for-each select="rocp:GoodsNumber">
																						<xsl:if test="position()>1">, </xsl:if>
																						<xsl:value-of select="."/>
																					</xsl:for-each>
																				</td>
																				<td class="bordered">
																					<xsl:value-of select="rocp:DeclCountryCode"/>
																				</td>
																				<td class="bordered">
																					<xsl:for-each select="rocp:DocumentCountryCode">
																						<xsl:call-template name="document"/>
																						<xsl:if test="position()!=last()">,&#160;</xsl:if>
																					</xsl:for-each>
																				</td>
																			</tr>
																		</xsl:for-each>
																	</xsl:when>
																	<xsl:otherwise>
																		<tr style="height:25px">
																			<td/>
																			<td/>
																			<td/>
																		</tr>
																	</xsl:otherwise>
																</xsl:choose>
															</tbody>
														</table>
													</td>
												</tr>
												<tr>
													<td>
														<br/>
													</td>
												</tr>
												<tr>
													<td>
														<span style="text-indent: 5%;">2. Заявленные сведения о стране происхождения товаров скорректированы в отношении следующих товаров:		</span>
													</td>
												</tr>
												<tr>
													<td>
														<br/>
													</td>
												</tr>
												<tr>
													<td>
														<table class="graphMain">
															<tbody>
																<tr align="center">
																	<td width="12%" class="bordered">Номер товара по ДТ</td>
																	<td width="13%" class="bordered">Заявленный код СП</td>
																	<td width="23%" class="bordered">Номер и дата документа, подтверждающего заявленную СП</td>
																	<td width="23%" class="bordered">Скорректированный код СП</td>
																	<td width="29%" class="bordered">Обоснование принятого решения</td>
																</tr>
																<xsl:choose>
																	<xsl:when test="rocp:ResolutionDescription/rocp:DecisionMeaning='2'">
																		<xsl:for-each select="rocp:ResolutionDescription/rocp:InfoCountryCode[../rocp:DecisionMeaning='2']">
																			<tr>
																				<td class="bordered">
																					<xsl:for-each select="rocp:GoodsNumber">
																						<xsl:if test="position()>1">, </xsl:if>
																						<xsl:value-of select="."/>
																					</xsl:for-each>
																				</td>
																				<td class="bordered">
																					<xsl:value-of select="rocp:DeclCountryCode"/>
																				</td>
																				<td class="bordered">
																					<xsl:for-each select="rocp:DocumentCountryCode">
																						<xsl:call-template name="document"/>
																						<xsl:if test="position()!=last()">,&#160;</xsl:if>
																					</xsl:for-each>
																				</td>
																				<td class="bordered">
																					<xsl:value-of select="rocp:AdjCountryCode"/>
																				</td>
																				<td class="bordered">
																					<xsl:for-each select="rocp:RationaleDecision">
																						<xsl:value-of select="."/>
																					</xsl:for-each>
																				</td>
																			</tr>
																		</xsl:for-each>
																	</xsl:when>
																	<xsl:otherwise>
																		<tr style="height:25px">
																			<td/>
																			<td/>
																			<td/>
																			<td/>
																			<td/>
																		</tr>
																	</xsl:otherwise>
																</xsl:choose>
															</tbody>
														</table>
													</td>
												</tr>
												<tr>
													<td>
														<br/>
														<br/>
													</td>
												</tr>
											</xsl:if>
											<xsl:if test="rocp:ResolutionDescription/rocp:DecisionSign='0'">
												<tr>
													<td>
														<span style="border: 1pt solid #000000">
															<b> V </b>
														</span> 	 О ПРЕДОСТАВЛЕНИИ ТАРИФНЫХ ПРЕФЕРЕНЦИЙ</td>
												</tr>
												<tr>
													<td>
														<br/>
													</td>
												</tr>
												<tr>
													<td>
														<span style="text-indent: 5%;">1. Тарифная преференция предоставлена в отношении следующих товаров:</span>
													</td>
												</tr>
												<tr>
													<td>
														<br/>
													</td>
												</tr>
												<tr>
													<td>
														<table class="graphMain">
															<tbody>
																<tr align="center">
																	<td class="bordered" width="25%">Номер товара по ДТ</td>
																	<td class="bordered" width="30%">Заявленный код СП</td>
																	<td class="bordered" width="45%">Номер и дата документа, подтверждающего заявленную СП</td>
																</tr>
																<xsl:choose>
																	<xsl:when test="rocp:ResolutionDescription/rocp:DecisionMeaning='3'">
																		<xsl:for-each select="rocp:ResolutionDescription/rocp:InfoCountryCode[../rocp:DecisionMeaning='3']">
																			<tr>
																				<td class="bordered">
																					<xsl:for-each select="rocp:GoodsNumber">
																						<xsl:if test="position()>1">, </xsl:if>
																						<xsl:value-of select="."/>
																					</xsl:for-each>
																				</td>
																				<td class="bordered">
																					<xsl:value-of select="rocp:DeclCountryCode"/>
																				</td>
																				<td class="bordered">
																					<xsl:for-each select="rocp:DocumentCountryCode">
																						<xsl:call-template name="document"/>
																						<xsl:if test="position()!=last()">,&#160;</xsl:if>
																					</xsl:for-each>
																				</td>
																			</tr>
																		</xsl:for-each>
																	</xsl:when>
																	<xsl:otherwise>
																		<tr style="height:25px">
																			<td/>
																			<td/>
																			<td/>
																		</tr>
																	</xsl:otherwise>
																</xsl:choose>
															</tbody>
														</table>
													</td>
												</tr>
												<tr>
													<td>
														<br/>
													</td>
												</tr>
												<tr>
													<td>
														<span style="text-indent: 5%;">2. Тарифная преференция не предоставлена в отношении следующих товаров:</span>
													</td>
												</tr>
												<tr>
													<td>
														<br/>
													</td>
												</tr>
												<tr>
													<td>
														<table class="graphMain">
															<tbody>
																<tbody>
																	<tr align="center">
																		<td width="12%" class="bordered">Номер товара по ДТ</td>
																		<td width="13%" class="bordered">Заявленный код СП</td>
																		<td width="23%" class="bordered">Номер и дата документа, подтверждающего заявленную СП</td>
																		<td width="23%" class="bordered">Скорректированный код СП</td>
																		<td width="29%" class="bordered">Обоснование принятого решения</td>
																	</tr>
																	<xsl:choose>
																		<xsl:when test="rocp:ResolutionDescription/rocp:DecisionMeaning='4'">
																			<xsl:for-each select="rocp:ResolutionDescription/rocp:InfoCountryCode[../rocp:DecisionMeaning='4']">
																				<tr>
																					<td class="bordered">
																						<xsl:for-each select="rocp:GoodsNumber">
																							<xsl:if test="position()>1">, </xsl:if>
																							<xsl:value-of select="."/>
																						</xsl:for-each>
																					</td>
																					<td class="bordered">
																						<xsl:value-of select="rocp:DeclCountryCode"/>
																					</td>
																					<td class="bordered">
																						<xsl:for-each select="rocp:DocumentCountryCode">
																							<xsl:call-template name="document"/>
																						</xsl:for-each>
																					</td>
																					<td class="bordered">
																						<xsl:value-of select="rocp:AdjCountryCode"/>
																					</td>
																					<td class="bordered">
																						<xsl:for-each select="rocp:RationaleDecision">
																							<xsl:value-of select="."/>
																						</xsl:for-each>
																					</td>
																				</tr>
																			</xsl:for-each>
																		</xsl:when>
																		<xsl:otherwise>
																			<tr style="height:25px">
																				<td/>
																				<td/>
																				<td/>
																				<td/>
																				<td/>
																			</tr>
																		</xsl:otherwise>
																	</xsl:choose>
																</tbody>
															</tbody>
														</table>
													</td>
												</tr>
											</xsl:if>
										</tbody>
									</table>
								</td>
							</tr>
							<tr>
								<td>
									<br/>
									<br/>
									<br/>
								</td>
							</tr>
							<tr>
								<td>
									<table class="graphMain">
										<tbody>
											<tr>
												<td align="center" width="30%" class="value">
													<xsl:value-of select="rocp:Person/cat_ru:PersonPost"/>
												</td>
												<td width="25%"/>
												<td align="center" class="value">
													<xsl:value-of select="rocp:Person/cat_ru:PersonSurname"/> <xsl:value-of select="rocp:Person/cat_ru:PersonName"/> <xsl:value-of select="rocp:Person/cat_ru:PersonMiddleName"/>
												</td>
											</tr>
											<tr>
												<td align="center" class="graphLittle">
													(наименование должности)
												</td>
												<td/>
												<td align="center" class="graphLittle">
													(подпись)
												</td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</body>
		</html>
	</xsl:template>
	<!--Шаблоны-->
	<!--xsl:template name="Address">
		<xsl:if test="cat_ru:PostalCode">
			<xsl:value-of select="cat_ru:PostalCode"/>,&#160;
	</xsl:if>
		<xsl:if test="cat_ru:CounryName">
			<xsl:value-of select="cat_ru:CounryName"/>,&#160;
	</xsl:if>
		<xsl:if test="cat_ru:Region">
			<xsl:value-of select="cat_ru:Region"/>,&#160;
	</xsl:if>
		<xsl:if test="cat_ru:City">
			<xsl:value-of select="cat_ru:City"/>,&#160;
	</xsl:if>
		<xsl:if test="cat_ru:StreetHouse">
			<xsl:value-of select="cat_ru:StreetHouse"/>
		</xsl:if>
	</xsl:template-->
	<xsl:template match="*" name="document">
		<xsl:value-of select="cat_ru:PrDocumentName"/>&#160;№&#160;<xsl:value-of select="cat_ru:PrDocumentNumber"/>&#160;от&#160;<xsl:call-template name="russian_date">
			<xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
		</xsl:call-template>
	</xsl:template>
	<xsl:template name="russian_date">
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<xsl:value-of select="substring($dateIn,9,2)"/>.<xsl:value-of select="substring($dateIn,6,2)"/>.<xsl:value-of select="substring($dateIn,1,4)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dateIn"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="russian_date_gtd">
		<xsl:param name="date"/>
		<xsl:choose>
			<xsl:when test="substring($date,5,1)='-' and substring($date,8,1)='-'">
				<xsl:value-of select="substring($date,9,2)"/>
				<xsl:value-of select="substring($date,6,2)"/>
				<xsl:value-of select="substring($date,3,2)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$date"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<!--xsl:template name="org">
		<xsl:value-of select="cat_ru:OrganizationName"/>&#160;
		<xsl:if test="cat_ru:RFOrganizationFeatures/cat_ru:OGRN">
			<xsl:value-of select="cat_ru:RFOrganizationFeatures/cat_ru:OGRN"/>&#160;
		</xsl:if>
		<xsl:if test="cat_ru:RFOrganizationFeatures/cat_ru:INN">
			<xsl:value-of select="cat_ru:RFOrganizationFeatures/cat_ru:INN"/>&#160;
		</xsl:if>
		<xsl:if test="cat_ru:RFOrganizationFeatures/cat_ru:KPP">
			<xsl:value-of select="cat_ru:RFOrganizationFeatures/cat_ru:KPP"/>&#160;
		</xsl:if>
		<xsl:for-each select="whgd:Address">
			<xsl:call-template name="Address"/>
		</xsl:for-each>
	</xsl:template-->
</xsl:stylesheet>
