<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.24.0" xmlns:catESAD_cu="urn:customs.ru:CUESADCommonAggregateTypesCust:5.28.0" xmlns:mpco="urn:customs.ru:Information:CustomsDocuments:MPOCommon:5.24.0" xmlns:mpod="urn:customs.ru:Information:CustomsDocuments:MPO_Declaration:5.28.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" encoding="utf-8" indent="yes" media-type="text/html" method="html" omit-xml-declaration="yes" version="1.0"/>
	<xsl:template match="/">
		<xsl:apply-templates/>
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
	<xsl:template match="//*[local-name()='MPO_Declaration']//*" priority="-1">
		<xsl:variable name="xpath">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="current()"/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath}">
			<xsl:apply-templates/>
		</element>
	</xsl:template>
	<xsl:template match="*" mode="date">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:call-template name="date">
				<xsl:with-param name="dateIn" select="."/>
			</xsl:call-template>
		</element>
	</xsl:template>
	<xsl:template match="*" mode="MPOdate">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:call-template name="MPOdate">
				<xsl:with-param name="dateIn" select="."/>
			</xsl:call-template>
		</element>
	</xsl:template>
	<xsl:template match="mpod:MPO_Declaration">
		<html>
			<head>
				<meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
				<title>Лицевая сторона бланка таможенной декларации CN 23</title>
				<style type="text/css">
			body {
					background: #cccccc;
				}

				div.page {
					width: 210mm;
					margin: auto;
					margin-top: 6pt;
					margin-bottom: 6pt;
					padding: 10mm;
					/*padding-left: 20mm;*/
					background: #ffffff;
					border: solid 0pt #000000;
				}
				
				div.album_page {
					width: 297mm;
					height: 210mm;
					margin: auto;
					margin-top: 6pt;
					margin-bottom: 6pt;
					padding: 10mm;
					padding-left: 20mm;
					background: #ffffff;
					border: solid 0pt #000000;
				}

				h2 {
					text-align:center;
					font: 20 ;
					font-family: Arial, serif;
				}
				
				.remark {
					text-align:right;
					font: 15;
					font-family: Arial, serif;
					text-decoration: underline;
				}
				
				.header {
					font-weight: bold;
					margin-top:20px;
				}
				
				 table {
					width: 100%;
					border: 0;
					empty-cells: show;
					border-collapse: collapse;
					margin-top: 1px;
				}

				td {
					border: 1px solid gray;
					font-family: Courier, serif;
					vertical-align:top;
				}
				
				.low {
					font: 12;
					font-fase: Courier;
				}
				.graph {
							font-family: Arial;
							font-size: 8pt;
							}
				jh {
				font: 16;
				font-face: Arial;
				}
				dog1 {
	            position:relative;
	            left: 50px;
	            bottom: 50px;
	            }
	            .gra {
							font-family: Arial;
							font-size: 6pt;
							}
				.g{
							border-right:0pt solid;
							}
				</style>
			</head>
			<body>
				<div class="page">
					<table>
						<tr>
							<td align="center" class="graph" style="border:solid 0pt">
								<font face="Times new roman" size="5">
									<b>
										<i>Лицевая сторона бланка таможенной декларации CN 23</i>
									</b>
								</font>
							</td>
						</tr>
					</table>
					<table border="2" height="150mm" style="border-color: black" width="210mm">
						<span class="graph">
							<!--<table>-->
							<tr>
								<td/>
								<td colspan="5" style="border-left-color: #ffffff" valign="bottom">
									<span class="graph">(Назначенный оператор) <xsl:apply-templates select="mpod:DesignatedOperator"/>
									</span>
								</td>
								<td align="left" colspan="3" style="border-left-color: #ffffff">
									<span class="graph">
										<b>ТАМОЖЕННАЯ ДЕКЛАРАЦИЯ</b>
									</span>
								</td>
								<td style="border-left-color: #ffffff">
									<span class="graph">
										<b>
                              CN23
                              <br/>
									<xsl:variable name="xpath_DocSign">
										<xsl:call-template name="get_xpath">
											<xsl:with-param name="node" select="mpod:DocSign"/>
										</xsl:call-template>
									</xsl:variable>
									<element xml_node="{$xpath_DocSign}">
										<xsl:choose>
											<xsl:when test="mpod:DocSign='0'">Основная</xsl:when>
											<xsl:when test="mpod:DocSign='1'">Предварительная</xsl:when>
											<xsl:when test="mpod:DocSign='3'">Возвращамое МПО</xsl:when>
											<xsl:when test="mpod:DocSign='4'">Дополнительная МПО</xsl:when>
											<xsl:otherwise>
												<xsl:apply-templates select="mpod:DocSign"/>
											</xsl:otherwise>
										</xsl:choose>
									</element>
										</b>
									</span>
								</td>
								<td rowspan="8" style="border-left-color: #ffffff"/>
							</tr>
							<tr>
								<td rowspan="2" style="padding:5pt" width="10%">
									<span class="graph">Из</span>
								</td>
								<td colspan="3" style="padding:0pt 5pt">
									<span class="graph">Фамилия<br/>
										<xsl:if test="mpod:Consignor/mpod:Person">
											<xsl:apply-templates select="mpod:Consignor/mpod:Person"/>
										</xsl:if>
										<xsl:if test="mpod:Consignor/mpod:Person and mpod:ConsignorRUS/mpod:Person"> / </xsl:if>
										<xsl:apply-templates select="mpod:ConsignorRUS/mpod:Person"/>
									</span>
								</td>
								<td colspan="2" rowspan="2" style="padding:0pt 5pt">
									<span class="graph">
						Таможенная ссылка отправителя (если имеется)<br/>
									</span>
								</td>
								<td colspan="4" rowspan="7" style="border-top-color: #ffffff;">
									<table cellspacing="6">
										<tr>
											<td style="border:solid 0pt">
												<span class="graph">№ отправления (штриховой код, если он имеется)<br/>
													<xsl:if test="mpod:MPO_Number">
														<xsl:apply-templates select="mpod:MPO_Number"/>
													</xsl:if>
												</span>
											</td>
											<td style="border:solid 0pt">
												<span class="graph">Может быть вскрыто в служебном порядке<br/>
												</span>
											</td>
											<td style="border:solid 0pt">
												<span class="graph">
													<b>Внимание!</b>
													<br/>Инструкции на обратной  
							стороне<br/>
												</span>
											</td>
										</tr>
										<tr>
											<td colspan="3" style="border:0pt solid;">
												<span class="graph">
										</span>
											</td>
										</tr>
										<xsl:if test="mpod:MPO_Registration">
											<tr>
												<td colspan="3" style="border:0pt solid;">
													<span class="graph">
														<xsl:text>№ исходного МПО: </xsl:text>
														<xsl:apply-templates select="mpod:MPO_Registration"/>
													</span>
												</td>
											</tr>
										</xsl:if>
										<tr>
											<td colspan="3" style="border:0pt solid;">
												<span class="graph">
													<xsl:text>Получатель/отправитель: </xsl:text>
													<xsl:variable name="xpath_individual_flag">
														<xsl:call-template name="get_xpath">
															<xsl:with-param name="node" select="mpod:individual_flag"/>
														</xsl:call-template>
													</xsl:variable>
													<element xml_node="{$xpath_individual_flag}">
														<xsl:choose>
															<xsl:when test="mpod:individual_flag='0' or mpod:individual_flag='false' or mpod:individual_flag='f'">юридическое лицо</xsl:when>
															<xsl:when test="mpod:individual_flag='1' or mpod:individual_flag='true' or mpod:individual_flag='t'">физическое лицо</xsl:when>
															<xsl:otherwise>
																<xsl:value-of select="mpod:individual_flag"/>
															</xsl:otherwise>
														</xsl:choose>
													</element>
												</span>
											</td>
										</tr>
										<xsl:if test="mpod:MPOFactWeight">
											<tr>
												<td colspan="3" style="border:0pt solid;">
													<xsl:variable name="factW" select="mpod:MPOFactWeight"/>
													<xsl:variable name="grossW">
														<xsl:choose>
															<xsl:when test="mpod:TotalGrossWeight">
																<xsl:value-of select="mpod:TotalGrossWeight"/>
															</xsl:when>
															<xsl:otherwise>
																<xsl:value-of select="0"/>
															</xsl:otherwise>
														</xsl:choose>
													</xsl:variable>
													<span class="graph">
														<xsl:text>Разница в весе: </xsl:text>
														<!--xsl:value-of select="format-number(mpod:MPOFactWeight - mpod:TotalGrossWeight, '0.##')"/-->
														<xsl:value-of select="format-number($factW - $grossW, '0.##')"/>
														<xsl:text> кг</xsl:text>
													</span>
												</td>
											</tr>
										</xsl:if>
										<xsl:if test="mpod:Information/mpod:PackingState">
											<tr>
												<td colspan="3" style="border:0pt solid;">
													<span class="graph">
														<xsl:text>Сведения о целостности: </xsl:text>
														<xsl:variable name="xpath_PackingStateValue">
															<xsl:call-template name="get_xpath">
																<xsl:with-param name="node" select="mpod:Information/mpod:PackingState/mpod:Value"/>
															</xsl:call-template>
														</xsl:variable>
														<element xml_node="{$xpath_PackingStateValue}">
															<xsl:choose>
																<xsl:when test="mpod:Information/mpod:PackingState/mpod:Value='0' or mpod:Information/mpod:PackingState/mpod:Value='false' or mpod:Information/mpod:PackingState/mpod:Value='f'">Нарушена</xsl:when>
																<xsl:when test="mpod:Information/mpod:PackingState/mpod:Value='1' or mpod:Information/mpod:PackingState/mpod:Value='true' or mpod:Information/mpod:PackingState/mpod:Value='t'">Целостна</xsl:when>
																<xsl:otherwise>
																	<xsl:value-of select="mpod:Information/mpod:PackingState/mpod:Value"/>
																</xsl:otherwise>
															</xsl:choose>
														</element>
														<xsl:if test="mpod:Information/mpod:PackingState/mpod:Remark">
															<xsl:text>, </xsl:text>
															<xsl:apply-templates select="mpod:Information/mpod:PackingState/mpod:Remark"/>
														</xsl:if>
													</span>
												</td>
											</tr>
										</xsl:if>
										<xsl:if test="mpod:ConsignmentCategory">
											<tr>
												<td colspan="3" style="border:0pt solid;">
													<span class="graph">
														<xsl:text>Категория отправления: </xsl:text>
														<xsl:for-each select="mpod:ConsignmentCategory/*">
															<xsl:apply-templates select="."/>
															<xsl:if test="position()!=last()">, </xsl:if>
														</xsl:for-each>
													</span>
												</td>
											</tr>
										</xsl:if>
										<xsl:if test="mpod:MPOKind">
											<tr>
												<td colspan="3" style="border:0pt solid;">
													<span class="graph">
														<xsl:text>Вид отправления: </xsl:text>
														<xsl:for-each select="mpod:MPOKind/*">
															<xsl:apply-templates select="."/>
															<xsl:if test="position()!=last()">, </xsl:if>
														</xsl:for-each>
													</span>
												</td>
											</tr>
										</xsl:if>
										<xsl:if test="mpod:DeclaredValue">
											<tr>
												<td colspan="3" style="border:0pt solid;">
													<span class="graph">
														<xsl:text>Объявленная ценность: </xsl:text>
														<xsl:apply-templates select="mpod:DeclaredValue"/>
														<xsl:text> </xsl:text>
														<xsl:apply-templates select="mpod:DeclValueCurrencyCode"/>
													</span>
												</td>
											</tr>
										</xsl:if>
										<xsl:if test="mpod:CustomsProcedure">
											<tr>
												<td colspan="3" style="border:0pt solid;">
													<span class="graph">
														<xsl:text>Направление перемещения: </xsl:text>
														<xsl:variable name="xpath_CustomsProcedure">
															<xsl:call-template name="get_xpath">
																<xsl:with-param name="node" select="mpod:CustomsProcedure"/>
															</xsl:call-template>
														</xsl:variable>
														<element xml_node="{$xpath_CustomsProcedure}">
															<xsl:choose>
																<xsl:when test="mpod:CustomsProcedure='ИМ'">ввоз МПО</xsl:when>
																<xsl:when test="mpod:CustomsProcedure='ЭК'">вывоз МПО</xsl:when>
															</xsl:choose>
														</element>
													</span>
												</td>
											</tr>
										</xsl:if>
										<xsl:if test="mpod:CustomsCode">
											<tr>
												<td colspan="3" style="border:0pt solid;">
													<span class="graph">
														<xsl:text>Предполагаемый код таможенного органа оформления: </xsl:text>
														<xsl:apply-templates select="mpod:CustomsCode"/>
													</span>
												</td>
											</tr>
										</xsl:if>
									</table>
								</td>
							</tr>
							<tr>
								<td colspan="3" style="padding:0pt 5pt">
									<span class="graph">Компания/Фирма<br/>
										<xsl:apply-templates select="mpod:Consignor/cat_ru:OrganizationName"/>
										<xsl:if test="mpod:Consignor/cat_ru:OrganizationName and mpod:ConsignorRUS/cat_ru:OrganizationName">
											<xsl:text> / </xsl:text>
										</xsl:if>
										<xsl:apply-templates select="mpod:ConsignorRUS/cat_ru:OrganizationName"/>
										<xsl:text> </xsl:text>
										<xsl:call-template name="innkppogrnWithForeign">
											<xsl:with-param name="base" select="mpod:Consignor"/>
										</xsl:call-template>
									</span>
								</td>
							</tr>
							<tr>
								<td rowspan="3"/>
								<td colspan="5" style="padding:0pt 5pt">
									<span class="graph">Улица<br/>
										<xsl:if test="mpod:Consignor/RUScat_ru:SubjectAddressDetails/RUScat_ru:StreetHouse">
											<xsl:apply-templates select="mpod:Consignor/RUScat_ru:SubjectAddressDetails/RUScat_ru:StreetHouse"/>
											<xsl:if test="mpod:Consignor/RUScat_ru:SubjectAddressDetails/RUScat_ru:House">
												<xsl:text>, </xsl:text>
												<xsl:apply-templates select="mpod:Consignor/RUScat_ru:SubjectAddressDetails/RUScat_ru:House"/>
											</xsl:if>
											<xsl:if test="mpod:Consignor/RUScat_ru:SubjectAddressDetails/RUScat_ru:Room">
												<xsl:text>, </xsl:text>
												<xsl:apply-templates select="mpod:Consignor/RUScat_ru:SubjectAddressDetails/RUScat_ru:Room"/>
											</xsl:if>
										</xsl:if>
										<xsl:if test="mpod:Consignor/RUScat_ru:SubjectAddressDetails/RUScat_ru:StreetHouse and mpod:ConsignorRUS/RUScat_ru:SubjectAddressDetails/RUScat_ru:StreetHouse">
											<xsl:text> / </xsl:text>
											<xsl:apply-templates select="mpod:ConsignorRUS/RUScat_ru:SubjectAddressDetails/RUScat_ru:StreetHouse"/>
											<xsl:if test="mpod:ConsignorRUS/RUScat_ru:SubjectAddressDetails/RUScat_ru:House">
												<xsl:text>, </xsl:text>
												<xsl:apply-templates select="mpod:ConsignorRUS/RUScat_ru:SubjectAddressDetails/RUScat_ru:House"/>
											</xsl:if>
											<xsl:if test="mpod:ConsignorRUS/RUScat_ru:SubjectAddressDetails/RUScat_ru:Room">
												<xsl:text>, </xsl:text>
												<xsl:apply-templates select="mpod:ConsignorRUS/RUScat_ru:SubjectAddressDetails/RUScat_ru:Room"/>
											</xsl:if>
										</xsl:if>
									</span>
								</td>
							</tr>
							<tr>
								<td colspan="5">
									<table cellspacing="6">
										<tr>
											<td style="border:solid 0pt">
												<span class="graph">Почтовый индекс<br/>
													<xsl:apply-templates select="mpod:Consignor/RUScat_ru:SubjectAddressDetails/RUScat_ru:PostalCode|mpod:ConsignorRUS/RUScat_ru:SubjectAddressDetails/RUScat_ru:PostalCode"/>
												</span>
											</td>
											<td style="border:solid 0pt">
												<span class="graph">Город<br/>
													<xsl:if test="mpod:Consignor/RUScat_ru:SubjectAddressDetails/RUScat_ru:City">
														<xsl:apply-templates select="mpod:Consignor/RUScat_ru:SubjectAddressDetails/RUScat_ru:City"/>
													</xsl:if>
													<xsl:if test="mpod:Consignor/RUScat_ru:SubjectAddressDetails/RUScat_ru:City and mpod:ConsignorRUS/RUScat_ru:SubjectAddressDetails/RUScat_ru:City">
														<xsl:text> / </xsl:text>
														<xsl:apply-templates select="mpod:ConsignorRUS/RUScat_ru:SubjectAddressDetails/RUScat_ru:City"/>
													</xsl:if>
													<xsl:if test="mpod:Consignor/RUScat_ru:SubjectAddressDetails/RUScat_ru:Town and mpod:Consignor/RUScat_ru:SubjectAddressDetails/RUScat_ru:City">
														<xsl:text> ; </xsl:text>
													</xsl:if>
													<xsl:if test="mpod:Consignor/RUScat_ru:SubjectAddressDetails/RUScat_ru:Town">
														<xsl:apply-templates select="mpod:Consignor/RUScat_ru:SubjectAddressDetails/RUScat_ru:Town"/>
													</xsl:if>
													<xsl:if test="mpod:Consignor/RUScat_ru:SubjectAddressDetails/RUScat_ru:Town and mpod:ConsignorRUS/RUScat_ru:SubjectAddressDetails/RUScat_ru:Town">
														<xsl:text> / </xsl:text>
														<xsl:apply-templates select="mpod:ConsignorRUS/RUScat_ru:SubjectAddressDetails/RUScat_ru:Town"/>
													</xsl:if>
												</span>
											</td>
										</tr>
									</table>
								</td>
							</tr>
							<tr>
								<td colspan="5" style="padding:0pt 5pt">
									<span class="graph">Страна<br/>
										<xsl:if test="mpod:Consignor/RUScat_ru:SubjectAddressDetails/RUScat_ru:CountryCode">
											<xsl:apply-templates select="mpod:Consignor/RUScat_ru:SubjectAddressDetails/RUScat_ru:CountryCode"/> 
							</xsl:if>
										<xsl:if test="mpod:Consignor/RUScat_ru:SubjectAddressDetails/RUScat_ru:CounryName">
											<xsl:apply-templates select="mpod:Consignor/RUScat_ru:SubjectAddressDetails/RUScat_ru:CounryName"/>
										</xsl:if>
										<xsl:if test="mpod:Consignor/RUScat_ru:SubjectAddressDetails/RUScat_ru:CounryName and mpod:ConsignorRUS/RUScat_ru:SubjectAddressDetails/RUScat_ru:CounryName">
											<xsl:text> / </xsl:text>
										</xsl:if>
										<xsl:if test="mpod:ConsignorRUS/RUScat_ru:SubjectAddressDetails/RUScat_ru:CounryName">
											<xsl:apply-templates select="mpod:ConsignorRUS/RUScat_ru:SubjectAddressDetails/RUScat_ru:CounryName"/>
										</xsl:if>
									</span>
								</td>
							</tr>
							<tr>
								<td rowspan="17" style="padding:0pt 5pt">
									<span class="graph">В</span>
								</td>
								<td colspan="5" style="padding:0pt 5pt">
									<span class="graph">Фамилия<br/>
										<xsl:apply-templates select="mpod:Consignee/mpco:NominativeName"/>
									</span>
								</td>
							</tr>
							<tr>
								<td colspan="5" style="padding:0pt 5pt">
									<span class="graph">Компания/Фирма<br/>
										<!--	<xsl:if test="mpod:Consignee/cat_ru:ShortName">-->
										<xsl:apply-templates select="mpod:Consignee/cat_ru:OrganizationName"/>
										<!--</xsl:if>-->
										<xsl:text> </xsl:text>
										<xsl:call-template name="innkppogrn">
											<xsl:with-param name="base" select="mpod:Consignee"/>
										</xsl:call-template>
									</span>
								</td>
							</tr>
							<tr>
								<td colspan="5" style="padding:0pt 5pt">
									<span class="graph">Улица<br/>
										<xsl:choose>
											<xsl:when test="mpod:Consignee/RUScat_ru:SubjectAddressDetails/RUScat_ru:AddressText">
												<xsl:apply-templates select="mpod:Consignee/RUScat_ru:SubjectAddressDetails/RUScat_ru:AddressText"/>
											</xsl:when>
											<xsl:otherwise>
												<xsl:if test="mpod:Consignee/RUScat_ru:SubjectAddressDetails/RUScat_ru:StreetHouse">
													<xsl:apply-templates select="mpod:Consignee/RUScat_ru:SubjectAddressDetails/RUScat_ru:StreetHouse"/>
													<xsl:if test="mpod:Consignee/RUScat_ru:SubjectAddressDetails/RUScat_ru:House or mpod:Consignee/RUScat_ru:SubjectAddressDetails/RUScat_ru:Room">
														<xsl:text>, </xsl:text>
													</xsl:if>
												</xsl:if>
												<xsl:if test="mpod:Consignee/RUScat_ru:SubjectAddressDetails/RUScat_ru:House">
													<xsl:apply-templates select="mpod:Consignee/RUScat_ru:SubjectAddressDetails/RUScat_ru:House"/>
													<xsl:if test="mpod:Consignee/RUScat_ru:SubjectAddressDetails/RUScat_ru:Room">
														<xsl:text>, </xsl:text>
													</xsl:if>
												</xsl:if>
												<xsl:if test="mpod:Consignee/RUScat_ru:SubjectAddressDetails/RUScat_ru:Room">
													<xsl:apply-templates select="mpod:Consignee/RUScat_ru:SubjectAddressDetails/RUScat_ru:Room"/>
												</xsl:if>
											</xsl:otherwise>
										</xsl:choose>
									</span>
								</td>
								<td colspan="4" rowspan="3">
									<table cellspacing="6">
										<tr>
											<td style="border:solid 0pt">
												<span class="graph">Реквизиты импортера (если имеются) (ИНН/№НДС/индекс импортера) (факультативно)<br/>
													<xsl:apply-templates select="mpod:Importer/cat_ru:RFOrganizationFeatures/cat_ru:INN | mpod:Importer/cat_ru:RFOrganizationFeatures/cat_ru:KPP | mpod:Importer/mpod:ImporterIndex | mpod:Importer/mpod:VAT_Number"/>
													<!--<xsl:call-template name="Importer"/>-->
													<!--<xsl:variable name="c" select="mpod:Importer"/>
							<xsl:if test="$c/cat_ru:RFOrganizationFeatures/cat_ru:INN">
							<xsl:apply-templates select="$c/cat_ru:RFOrganizationFeatures/cat_ru:INN"/>/-->
													<!--<xsl:if test="not(position()=last())">, </xsl:if>-->
													<!--</xsl:if>
							<xsl:if test="$c/cat_ru:RFOrganizationFeatures/cat_ru:KPP">
							<xsl:apply-templates select="$c/cat_ru:RFOrganizationFeatures/cat_ru:KPP"/>/
							</xsl:if>
							<xsl:if test="$c/mpod:ImporterIndex">
							<xsl:apply-templates select="$c/mpod:ImporterIndex"/>/
							</xsl:if>
							<xsl:if test="$c/mpod:VAT_Number">
							<xsl:apply-templates select="$c/mpod:VAT_Number"/>
							</xsl:if>-->
													<!--<xsl:if test="position()=last()">.</xsl:if>
							<xsl:if test="position()!=last()"><xsl:text>, </xsl:text></xsl:if>-->
												</span>
											</td>
										</tr>
										<tr>
											<td style="border:solid 0pt">
												<span class="graph">№ телефона/факса/e-mail импортера (если известен)
							<br/>
													<xsl:apply-templates select="mpod:Importer/cat_ru:Contact/cat_ru:Phone | mpod:Importer/cat_ru:Contact/cat_ru:Fax | mpod:Importer/cat_ru:Contact/cat_ru:E_mail"/>
													<!--<xsl:variable name="c" select="mpod:Importer"/>
							<xsl:if test="$c/cat_ru:Phone">
							<xsl:apply-templates select="$c/cat_ru:Phone"/>/
							</xsl:if>
							<xsl:if test="$c/cat_ru:Fax">
							<xsl:apply-templates select="$c/cat_ru:Fax"/>/
							</xsl:if>
							<xsl:if test="$c/mpod:E_mail">
							<xsl:apply-templates select="$c/mpod:E_mail"/>
							</xsl:if>-->
												</span>
											</td>
										</tr>
									</table>
								</td>
								<td rowspan="12" style="border-top:1px solid #ffffff;" width="20%"/>
							</tr>
							<tr>
								<td colspan="5">
									<table cellspacing="6">
										<tr>
											<td style="border:solid 0pt">
												<span class="graph">Почтовый индекс<br/>
													<xsl:choose>
														<xsl:when test="mpod:Consignee/mpco:ExPostalCode">
															<xsl:apply-templates select="mpod:Consignee/mpco:ExPostalCode"/>
														</xsl:when>
														<xsl:otherwise>
															<xsl:apply-templates select="mpod:Consignee/RUScat_ru:SubjectAddressDetails/RUScat_ru:PostalCode"/>
														</xsl:otherwise>
													</xsl:choose>
												</span>
											</td>
											<td style="border:solid 0pt">
												<span class="graph">Город<br/>
													<xsl:if test="mpod:Consignee/RUScat_ru:SubjectAddressDetails/RUScat_ru:Region">
														<xsl:apply-templates select="mpod:Consignee/RUScat_ru:SubjectAddressDetails/RUScat_ru:Region"/>
													</xsl:if>
													<xsl:if test="mpod:Consignee/RUScat_ru:SubjectAddressDetails/RUScat_ru:Town">
														<xsl:if test="mpod:Consignee/RUScat_ru:SubjectAddressDetails/RUScat_ru:Region">
															<xsl:text>, </xsl:text>
														</xsl:if>
														<xsl:apply-templates select="mpod:Consignee/RUScat_ru:SubjectAddressDetails/RUScat_ru:Town"/>
													</xsl:if>
													<xsl:if test="mpod:Consignee/RUScat_ru:SubjectAddressDetails/RUScat_ru:City">
														<xsl:if test="mpod:Consignee/RUScat_ru:SubjectAddressDetails/RUScat_ru:Town or mpod:Consignee/RUScat_ru:SubjectAddressDetails/RUScat_ru:Region">
															<xsl:text>, </xsl:text>
														</xsl:if>
														<xsl:apply-templates select="mpod:Consignee/RUScat_ru:SubjectAddressDetails/RUScat_ru:City"/>
													</xsl:if>
													<xsl:if test="mpod:Consignee/RUScat_ru:SubjectAddressDetails/RUScat_ru:District">
														<xsl:if test="mpod:Consignee/RUScat_ru:SubjectAddressDetails/RUScat_ru:Town or mpod:Consignee/RUScat_ru:SubjectAddressDetails/RUScat_ru:Region or mpco:Consignor/RUScat_ru:SubjectAddressDetails/RUScat_ru:City">
															<xsl:text>, </xsl:text>
														</xsl:if>
														<xsl:apply-templates select="mpod:Consignee/RUScat_ru:SubjectAddressDetails/RUScat_ru:District"/>
													</xsl:if>
												</span>
											</td>
										</tr>
									</table>
								</td>
							</tr>
							<tr>
								<td colspan="5" style="padding:0pt 5pt">
									<span class="graph">Страна<br/>
										<xsl:if test="mpod:Consignee/RUScat_ru:SubjectAddressDetails/RUScat_ru:CountryCode">
											<xsl:apply-templates select="mpod:Consignee/RUScat_ru:SubjectAddressDetails/RUScat_ru:CountryCode"/> 
										</xsl:if>
										<xsl:if test="mpod:Consignee/RUScat_ru:SubjectAddressDetails/RUScat_ru:CounryName">
											<xsl:if test="mpod:Consignee/RUScat_ru:SubjectAddressDetails/RUScat_ru:CountryCode">
												<xsl:text> </xsl:text>
											</xsl:if>
											<xsl:apply-templates select="mpod:Consignee/RUScat_ru:SubjectAddressDetails/RUScat_ru:CounryName"/>
										</xsl:if>
									</span>
								</td>
							</tr>
							<tr>
								<td colspan="2" rowspan="2" style="padding:0pt 5pt" width="20%">
									<span class="graph">Подробное описание вложения<br/>(торговая марка)</span>
								</td>
								<td rowspan="2" style="padding:0pt 5pt" width="15%">
									<span class="graph">Количество</span>
								</td>
								<td colspan="3" rowspan="2" style="padding:0pt 5pt" width="10%">
									<span class="graph">Вес нетто (в кг)</span>
								</td>
								<td rowspan="2" style="padding:0pt 5pt" width="10%">
									<span class="graph">Стоимость</span>
								</td>
								<td colspan="2" style="padding:0pt 5pt">
									<span class="graph">Только для коммерческих отправлений</span>
								</td>
							</tr>
							<tr>
								<td style="padding:0pt 5pt" width="15%">
									<span class="graph">Код ТН ВЭД ЕАЭС</span>
								</td>
								<td style="padding:0pt 5pt" width="15%">
									<span class="graph">Страна происхождения товаров</span>
								</td>
							</tr>
							<xsl:for-each select="mpod:Goods">
								<tr>
									<td colspan="2" style="padding:0pt 5pt">
										<span class="graph">
											<xsl:for-each select="mpod:GoodDescription">
												<xsl:apply-templates select="."/> </xsl:for-each>
											<xsl:if test="mpod:GoodDescription and mpod:GoodDescriptionForeign">
												<xsl:text> / </xsl:text>
											</xsl:if>
											<xsl:for-each select="mpod:GoodDescriptionForeign">
												<xsl:apply-templates select="."/>
											</xsl:for-each>
											<xsl:if test="mpod:TradeMark or mpod:GoodsMark or mpod:GoodsModel">
												<xsl:text> (</xsl:text>
												<xsl:apply-templates select="mpod:TradeMark"/>
												<xsl:if test="mpod:TradeMark and (mpod:GoodsMark or mpod:GoodsModel)">
													<xsl:text>, </xsl:text>
												</xsl:if>
												<xsl:apply-templates select="mpod:GoodsMark"/>
												<xsl:if test="(mpod:TradeMark or mpod:GoodsMark) and mpod:GoodsModel">
													<xsl:text>, </xsl:text>
												</xsl:if>
												<xsl:apply-templates select="mpod:GoodsModel"/>
												<xsl:text>)</xsl:text>
											</xsl:if>
											<xsl:if test="mpod:IPObjectRegistryNum">
												<xsl:if test="count(mpod:IPObjectRegistryNum[catESAD_cu:DocumentModeCode='1']) &gt; 0">
													<br/>
													<span class="graph">Единый ТРОИС ЕАЭС: </span>
													<xsl:for-each select="mpod:IPObjectRegistryNum[catESAD_cu:DocumentModeCode='1']">
														<xsl:if test="catESAD_cu:CountryCode">
															<span class="graph">(</span>
															<xsl:apply-templates select="catESAD_cu:CountryCode"/>
															<span class="graph">) </span>
														</xsl:if>
														<xsl:apply-templates select="catESAD_cu:IPORegistryNumber"/>
														<xsl:if test="position()!=last()">, </xsl:if>
													</xsl:for-each>
												</xsl:if>
												<xsl:if test="count(mpod:IPObjectRegistryNum[catESAD_cu:DocumentModeCode='2']) &gt; 0">
													<br/>
													<span class="graph">Национальный ТРОИС: </span>
													<xsl:for-each select="mpod:IPObjectRegistryNum[catESAD_cu:DocumentModeCode='2']">
														<xsl:if test="catESAD_cu:CountryCode">
															<span class="graph">(</span>
															<xsl:apply-templates select="catESAD_cu:CountryCode"/>
															<span class="graph">) </span>
														</xsl:if>
														<xsl:apply-templates select="catESAD_cu:IPORegistryNumber"/>
														<xsl:if test="position()!=last()">, </xsl:if>
													</xsl:for-each>
												</xsl:if>
											</xsl:if>
										</span>
									</td>
									<td style="padding:0pt 5pt">
										<span class="graph">
											<xsl:if test="mpod:GoodsQuantity/cat_ru:GoodsQuantity">
												<xsl:apply-templates select="mpod:GoodsQuantity/cat_ru:GoodsQuantity"/> </xsl:if>
											<xsl:if test="mpod:GoodsQuantity/cat_ru:MeasureUnitQualifierName">
												<xsl:apply-templates select="mpod:GoodsQuantity/cat_ru:MeasureUnitQualifierName"/>
											</xsl:if>
										</span>
									</td>
									<td colspan="3" style="padding:0pt 5pt">
										<span class="graph">
											<xsl:apply-templates select="mpod:NetWeight"/>
										</span>
									</td>
									<td style="padding:0pt 5pt">
										<span class="graph">
											<xsl:apply-templates select="mpod:Cost"/> 
						<xsl:if test="mpod:CurrencyCode">(<xsl:apply-templates select="mpod:CurrencyCode"/>)</xsl:if>
										</span>
									</td>
									<td style="padding:0pt 5pt">
										<span class="graph">
											<xsl:if test="mpod:TNVEDCode">
												<xsl:apply-templates select="mpod:TNVEDCode"/>
											</xsl:if>
										</span>
									</td>
									<td style="padding:0pt 5pt">
										<span class="graph">
											<xsl:if test="mpod:OriginCountryCode">
												<xsl:apply-templates select="mpod:OriginCountryCode"/>
											</xsl:if>
										</span>
									</td>
								</tr>
							</xsl:for-each>
							<tr>
								<td colspan="2"/>
								<td/>
								<td colspan="3" style="padding:0pt 5pt">
									<span class="graph">Общий вес брутто<br/>
										<xsl:apply-templates select="mpod:TotalGrossWeight"/>
									</span>
									<xsl:if test="mpod:MPOFactWeight">
										<br/>
										<span class="graph">Фактический вес<br/>
											<xsl:apply-templates select="mpod:MPOFactWeight"/>
										</span>
									</xsl:if>
								</td>
								<td style="padding:0pt 5pt">
									<span class="graph">Общая стоимость<br/>
										<xsl:apply-templates select="mpod:TotalCost"/>
										<xsl:if test="mpod:CurrencyCode">(<xsl:apply-templates select="mpod:CurrencyCode"/>)</xsl:if>
									</span>
								</td>
								<td colspan="2" style="padding:0pt 5pt">
									<span class="graph">Почтовые сборы/Расходы<br/>
										<xsl:if test="mpod:PostalFees">
											<xsl:for-each select="mpod:PostalFees">
												<xsl:apply-templates select="."/>
												<br/>
											</xsl:for-each>
										</xsl:if>
									</span>
								</td>
							</tr>
							<tr>
								<td colspan="7">
									<table cellspacing="6">
										<tr>
											<td style="border:solid 0pt"/>
											<td style="border:solid 0pt">
												<span class="graph">Категория отправления</span>
											</td>
											<td align="center" style="border:solid 0.8pt; width:5mm">
												<span class="graph">
													<xsl:if test="mpod:ConsignmentCategory/mpod:CategoryCode=32">x</xsl:if>
													<xsl:if test="mpod:ConsignmentCategory">
														<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
													</xsl:if>
												</span>
											</td>
											<td align="left" style="border:solid 0pt">
												<span class="graph">Коммерческий образец</span>
											</td>
											<td width="30%" rowspan="4" style="border:solid 0pt">
												<span class="graph">Пояснение:<br/>
														<xsl:apply-templates select="mpod:ConsignmentCategory/mpod:CategoryDescription"/>
														<xsl:if test="mpod:ConsignmentCategory/mpod:CategoryDescription and mpod:Explication"><br/></xsl:if>
														<xsl:apply-templates select="mpod:Explication"/>
												</span>
											</td>
										</tr>
										<tr>
											<td align="center" style="border:solid 0.8pt; width:5mm">
												<span class="graph">
													<xsl:if test="mpod:ConsignmentCategory/mpod:CategoryCode=31">x</xsl:if>
													<xsl:if test="mpod:ConsignmentCategory">
														<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
													</xsl:if>
												</span>
											</td>
											<td align="left" style="border:solid 0pt">
												<span class="graph">Подарок</span>
											</td>
											<td align="center" style="border:solid 0.8pt; width:5mm">
												<span class="graph">
													<xsl:if test="mpod:ConsignmentCategory/mpod:CategoryCode=21">x</xsl:if>
													<xsl:if test="mpod:ConsignmentCategory">
														<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
													</xsl:if>
												</span>
											</td>
											<td align="left" style="border:solid 0pt">
												<span class="graph">Возврат товара</span>
											</td>
										</tr>
										<tr>
											<td align="center" style="border:solid 0.8pt; width:5mm">
												<span class="graph">
													<xsl:if test="mpod:ConsignmentCategory/mpod:CategoryCode=91">x</xsl:if>
													<xsl:if test="mpod:ConsignmentCategory">
														<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
													</xsl:if>
												</span>
											</td>
											<td align="left" style="border:solid 0pt">
												<span class="graph">Документ</span>
											</td>
											<td align="center" style="border:solid 0.8pt; width:5mm">
												<span class="graph">
													<xsl:if test="mpod:ConsignmentCategory/mpod:CategoryCode=999">x</xsl:if>
													<xsl:if test="mpod:ConsignmentCategory">
														<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
													</xsl:if>
												</span>
											</td>
											<td align="left" style="border:solid 0pt">
												<span class="graph">Прочее</span>
											</td>
										</tr>
										<tr>
											<td align="center" style="border:solid 0.8pt; width:5mm">
												<span class="graph">
													<xsl:if test="mpod:ConsignmentCategory/mpod:CategoryCode=11">x</xsl:if>
													<xsl:if test="mpod:ConsignmentCategory">
														<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
													</xsl:if>
												</span>
											</td>
											<td align="left" style="border:solid 0pt">
												<span class="graph">Продажа товаров</span>
											</td>
											<td align="center" style="border:solid 0pt">
											</td>
											<td align="left" style="border:solid 0pt">
											</td>
										</tr>
									</table>
								</td>
								<td colspan="2" rowspan="2" style="padding:0pt 5pt">
									<span class="graph">Учреждение подачи/Дата подачи
						<br/>
										<xsl:if test="mpod:FeedBillAgency">
											<xsl:apply-templates select="mpod:FeedBillAgency"/>/</xsl:if>
										<xsl:if test="mpod:FeedBillDate">
											<xsl:apply-templates select="mpod:FeedBillDate" mode="date"/>
										</xsl:if>
									</span>
								</td>
							</tr>
							<tr>
								<td colspan="7" rowspan="2" style="padding:0pt 5pt">
									<span class="graph">
						Примечания: (напр., товар, подлежащий карантину/санитарному, фитосанитарному контролю или подпадающий под другие ограничения)<br/>
										<xsl:if test="mpod:Comment">
											<xsl:apply-templates select="mpod:Comment"/>
										</xsl:if>
									</span>
								</td>
							</tr>
							<tr>
								<td colspan="2" rowspan="2" style="padding:0pt 5pt">
									<span class="gra">Я подтверждаю, что указанные в настоящей таможенной декларации сведения являются достоверными, и что в этом отправлении не содержится никаких опасных предметов или запрещенных законодательством или почтовой или таможенной регламентацией предметов<br/>
									</span>
									<span class="graph">Дата и подпись отправителя<br/>
										<xsl:apply-templates select="mpod:Consignor/mpod:IssueDate" mode="date"/>
										<xsl:text> </xsl:text>
										<xsl:apply-templates select="mpod:Consignor/cat_ru:OrganizationName"/>
									</span>
								</td>
							</tr>
							<tr>
								<td width="22%">
									<table cellspacing="5">
										<tr>
											<td align="center" style="border:solid 0.8pt; width:5mm">
												<span class="graph">
													<xsl:variable name="xpath_DocumentCodeLIC">
														<xsl:call-template name="get_xpath">
															<xsl:with-param name="node" select="mpod:DocumentInfo[mpod:DocumentCode='LIC']/mpod:DocumentCode"/>
														</xsl:call-template>
													</xsl:variable>
													<element xml_node="{$xpath_DocumentCodeLIC}">
														<xsl:choose>
															<xsl:when test="mpod:DocumentInfo/mpod:DocumentCode='LIC'">x</xsl:when>
															<xsl:otherwise> </xsl:otherwise>
														</xsl:choose>
													</element>
												</span>
											</td>
											<td rowspan="2" style="border:solid 0pt">
												<span class="graph">Лицензия/№лицензии(-ий)</span>
											</td>
										</tr>
										<tr>
											<td colspan="2" style="border:solid 0pt">
												<span class="graph">
													<xsl:if test="mpod:DocumentInfo/mpod:DocumentCode='LIC'">
														<xsl:if test="mpod:DocumentInfo[mpod:DocumentCode='LIC']/cat_ru:PrDocumentName">
															<xsl:apply-templates select="mpod:DocumentInfo[mpod:DocumentCode='LIC']/cat_ru:PrDocumentName"/>/
										</xsl:if>
														<xsl:if test="mpod:DocumentInfo[mpod:DocumentCode='LIC']/cat_ru:PrDocumentNumber">№
										<xsl:apply-templates select="mpod:DocumentInfo[mpod:DocumentCode='LIC']/cat_ru:PrDocumentNumber"/>/
										</xsl:if>
														<xsl:if test="mpod:DocumentInfo[mpod:DocumentCode='LIC']/cat_ru:PrDocumentDate">
															<xsl:apply-templates select="mpod:DocumentInfo[mpod:DocumentCode='LIC']/cat_ru:PrDocumentDate" mode="date"/>
														</xsl:if>
													</xsl:if> </span>
											</td>
										</tr>
									</table>
								</td>
								<td colspan="3">
									<table cellspacing="5">
										<tr>
											<td align="center" style="border:solid 0.8pt; width:5mm">
												<span class="graph">
													<xsl:variable name="xpath_DocumentCodeCRT">
														<xsl:call-template name="get_xpath">
															<xsl:with-param name="node" select="mpod:DocumentInfo[mpod:DocumentCode='CRT']/mpod:DocumentCode"/>
														</xsl:call-template>
													</xsl:variable>
													<element xml_node="{$xpath_DocumentCodeCRT}">
														<xsl:choose>
															<xsl:when test="mpod:DocumentInfo/mpod:DocumentCode='CRT'">x</xsl:when>
															<xsl:otherwise> </xsl:otherwise>
														</xsl:choose>
													</element>
												</span>
											</td>
											<td rowspan="2" style="border:solid 0pt">
												<span class="graph">Сертификат/№сертификата(-ов) 
									</span>
											</td>
										</tr>
										<tr>
											<td colspan="3" style="border:solid 0pt">
												<span class="graph">
													<br/>
													<xsl:if test="mpod:DocumentInfo/mpod:DocumentCode='CRT'">
														<xsl:if test="mpod:DocumentInfo[mpod:DocumentCode='CRT']/cat_ru:PrDocumentName">
															<xsl:apply-templates select="mpod:DocumentInfo[mpod:DocumentCode='CRT']/cat_ru:PrDocumentName"/>/
										</xsl:if>
														<xsl:if test="mpod:DocumentInfo[mpod:DocumentCode='CRT']/cat_ru:PrDocumentNumber">№
										<xsl:apply-templates select="mpod:DocumentInfo[mpod:DocumentCode='CRT']/cat_ru:PrDocumentNumber"/>/
										</xsl:if>
														<xsl:if test="mpod:DocumentInfo[mpod:DocumentCode='CRT']/cat_ru:PrDocumentDate">
															<xsl:apply-templates select="mpod:DocumentInfo[mpod:DocumentCode='CRT']/cat_ru:PrDocumentDate" mode="date"/>
														</xsl:if>
													</xsl:if> </span>
											</td>
										</tr>
									</table>
								</td>
								<td colspan="3">
									<table cellspacing="5">
										<tr>
											<td align="center" style="border:solid 0.8pt; width:5mm">
												<span class="graph">
													<xsl:variable name="xpath_DocumentCodeINV">
														<xsl:call-template name="get_xpath">
															<xsl:with-param name="node" select="mpod:DocumentInfo[mpod:DocumentCode='INV']/mpod:DocumentCode"/>
														</xsl:call-template>
													</xsl:variable>
													<element xml_node="{$xpath_DocumentCodeINV}">
														<xsl:choose>
															<xsl:when test="mpod:DocumentInfo/mpod:DocumentCode='INV'">x</xsl:when>
															<xsl:otherwise> </xsl:otherwise>
														</xsl:choose>
													</element>
												</span>
											</td>
											<td rowspan="2" style="border:solid 0pt">
												<span class="graph">Счет/№ счета</span>
											</td>
										</tr>
										<tr>
											<td colspan="2" style="border:solid 0pt">
												<span class="graph">
													<xsl:if test="mpod:DocumentInfo/mpod:DocumentCode='INV'">
														<xsl:if test="mpod:DocumentInfo[mpod:DocumentCode='INV']/cat_ru:PrDocumentName">
															<xsl:apply-templates select="mpod:DocumentInfo[mpod:DocumentCode='INV']/cat_ru:PrDocumentName"/>/
										</xsl:if>
														<xsl:if test="mpod:DocumentInfo[mpod:DocumentCode='INV']/cat_ru:PrDocumentNumber">№
										<xsl:apply-templates select="mpod:DocumentInfo[mpod:DocumentCode='INV']/cat_ru:PrDocumentNumber"/>/
										</xsl:if>
														<xsl:if test="mpod:DocumentInfo[mpod:DocumentCode='INV']/cat_ru:PrDocumentDate">
															<xsl:apply-templates select="mpod:DocumentInfo[mpod:DocumentCode='INV']/cat_ru:PrDocumentDate" mode="date"/>
														</xsl:if>
													</xsl:if> </span>
											</td>
										</tr>
									</table>
								</td>
							</tr>
							<tr>
								<td colspan="9" style="border-left:1px solid #ffffff;"> </td>
								<td style="border-left:1px solid #ffffff; border-top:1px solid #ffffff;"/>
							</tr>
							<!--</table>-->
						</span>
					</table>
				</div>
			</body>
		</html>
	</xsl:template>
	<xsl:template name="innkppogrn">
		<xsl:param name="base"/>
		<xsl:if test="$base/cat_ru:RFOrganizationFeatures">
			<xsl:text> (</xsl:text>
			<xsl:if test="$base/cat_ru:RFOrganizationFeatures/cat_ru:INN">ИНН:<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
				<xsl:apply-templates select="$base/cat_ru:RFOrganizationFeatures/cat_ru:INN"/>
				<xsl:text>, </xsl:text>
			</xsl:if>
			<xsl:if test="$base/cat_ru:RFOrganizationFeatures/cat_ru:KPP">КПП:<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
				<xsl:apply-templates select="$base/cat_ru:RFOrganizationFeatures/cat_ru:KPP"/>
				<xsl:text>, </xsl:text>
			</xsl:if>
			<xsl:if test="$base/cat_ru:RFOrganizationFeatures/cat_ru:OGRN">ОГРН:<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
				<xsl:apply-templates select="$base/cat_ru:RFOrganizationFeatures/cat_ru:OGRN"/>
			</xsl:if>
			<xsl:text>)</xsl:text>
		</xsl:if>
	</xsl:template>
	<xsl:template name="innkppogrnWithForeign">
		<xsl:param name="base"/>
		<xsl:if test="$base/cat_ru:RFOrganizationFeatures">
			<xsl:text> (</xsl:text>
			<xsl:if test="$base/cat_ru:RFOrganizationFeatures/cat_ru:INN|$base/../mpod:ConsignorRUS/cat_ru:RFOrganizationFeatures/cat_ru:INN">ИНН:<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
				<xsl:apply-templates select="$base/cat_ru:RFOrganizationFeatures/cat_ru:INN|$base/../mpod:ConsignorRUS/cat_ru:RFOrganizationFeatures/cat_ru:INN"/>
				<xsl:text>, </xsl:text>
			</xsl:if>
			<xsl:if test="$base/cat_ru:RFOrganizationFeatures/cat_ru:KPP|$base/../mpod:ConsignorRUS/cat_ru:RFOrganizationFeatures/cat_ru:KPP">КПП:<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
				<xsl:apply-templates select="$base/cat_ru:RFOrganizationFeatures/cat_ru:KPP|$base/../mpod:ConsignorRUS/cat_ru:RFOrganizationFeatures/cat_ru:KPP"/>
				<xsl:text>, </xsl:text>
			</xsl:if>
			<xsl:if test="$base/cat_ru:RFOrganizationFeatures/cat_ru:OGRN|$base/../mpod:ConsignorRUS/cat_ru:RFOrganizationFeatures/cat_ru:OGRN">ОГРН:<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
				<xsl:apply-templates select="$base/cat_ru:RFOrganizationFeatures/cat_ru:OGRN|$base/../mpod:ConsignorRUS/cat_ru:RFOrganizationFeatures/cat_ru:OGRN"/>
			</xsl:if>
			<xsl:text>)</xsl:text>
		</xsl:if>
	</xsl:template>
	<xsl:template match="mpod:MPO_Registration">
		<xsl:apply-templates select="mpod:CustomsCode"/>
		<xsl:text>/</xsl:text>
		<xsl:apply-templates select="mpod:RegistrationDate" mode="MPOdate"/>
		<xsl:text>/</xsl:text>
		<xsl:apply-templates select="mpod:MPO_Number"/>
	</xsl:template>
	<xsl:template name="MPOdate">
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
	<xsl:template name="date">
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
	<xsl:template match="mpod:Importer/cat_ru:RFOrganizationFeatures/cat_ru:INN | mpod:Importer/cat_ru:RFOrganizationFeatures/cat_ru:KPP | mpod:Importer/mpod:ImporterIndex | mpod:Importer/mpod:VAT_Number | mpod:Importer/cat_ru:Contact/cat_ru:Phone | mpod:Importer/cat_ru:Contact/cat_ru:Fax | mpod:Importer/cat_ru:Contact/cat_ru:E_mail">
		<xsl:variable name="xpath_el">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_el}">
			<xsl:apply-templates/>
		</element>
		<xsl:if test="not(position()=last())">/ </xsl:if>
	</xsl:template>
</xsl:stylesheet>
