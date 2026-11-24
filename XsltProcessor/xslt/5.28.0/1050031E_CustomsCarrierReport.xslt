<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.24.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:ccr="urn:customs.ru:Information:ExchangeDocuments:CustomsCarrierReport:5.28.0" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:catESAD_cu="urn:customs.ru:CUESADCommonAggregateTypesCust:5.28.0">
	<!-- Шаблон для типа CustomsCarrierReportType -->
	<xsl:template match="ccr:CustomsCarrierReport">
		<xsl:param name="w" select="270"/>
		<html>
			<head>
				<style>
                  body {
                  background: #cccccc;
                  font-family: Arial;
                  font-size: 10pt;
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
                  
                  .inlinetable
					{
					border: 0;
					empty-cells: show;
					border-collapse: collapse;
					margin-top: 1px;
					display:-moz-inline-stack;/*Firefox 2*/
					display:inline-table; /*Хорошие браузеры*/
					_overflow:hidden;/*IE6, IE7*/
					*zoom:1;/*включаем hasLayout для IE6, IE7*/
					*display:inline;/*при hasLayout true display:inline в IE6, IE7 ведёт себя как display:inline-block*/	
					text-indent: 0;
					vertical-align: top;
					align: center;
					text-align: center;
					}
				.descr{
					font-size: 8pt;
					text-align: center;
					vertical-align:top;
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
										<b>Отчет таможенного перевозчика</b>
									</font>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<table>
						<tbody>
							<tr align="center">
								<td style="width:7mm">
								от
								</td>
								<td style="width:30mm" class="value">
									<xsl:apply-templates select="ccr:ReportDate" mode="russian_date"/>
								</td>
								<td style="width:7mm">
								№
								</td>
								<td style="width:30mm" class="value">
									<xsl:apply-templates select="ccr:ReportNumber"/>
								</td>
								<td/>
							</tr>
							<tr>
								<td colspan="5"><br/></td>
							</tr>
							<tr align="center">
								<td>
								c
								</td>
								<td class="value">
									<xsl:apply-templates select="ccr:StartDate" mode="russian_date"/>
								</td>
								<td>
								по
								</td>
								<td class="value">
									<xsl:apply-templates select="ccr:EndDate" mode="russian_date"/>
								</td>
								<td/>
							</tr>
						</tbody>
					</table>
					<br/>
					<table width="100%">
						<tbody>
							<tr>
								<td>
									<xsl:text>Таможенный перевозчик </xsl:text>
									<table class="inlinetable" style="width: 200mm;">
										<tbody>
											<tr align="center">
												<td class="value" width="100%">
													<xsl:apply-templates select="ccr:Carrier/cat_ru:OrganizationName"/>
													<xsl:if test="not(ccr:Carrier/cat_ru:OrganizationName) and ccr:Carrier/cat_ru:ShortName">
														<xsl:apply-templates select="ccr:Carrier/cat_ru:ShortName"/>
													</xsl:if>
													<br/>
												</td>
											</tr>
											<tr align="center">
												<td class="descr" width="100%">
													<xsl:text>(наименование органиации)</xsl:text>
												</td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
							<tr>
								<td>
									<br/>
									<xsl:text>Свидетельство о включении в реестр таможенных перевозчиков от </xsl:text>
									<table class="inlinetable" style="width: 30mm;">
										<tbody>
											<tr align="center">
												<td class="value" width="100%">
													<xsl:apply-templates select="ccr:CertificateDate" mode="russian_date"/>
													<br/>
												</td>
											</tr>
										</tbody>
									</table>
									<xsl:text> № </xsl:text>
									<table class="inlinetable" style="width: 30mm;">
										<tbody>
											<tr align="center">
												<td class="value" width="100%">
													<xsl:apply-templates select="ccr:CertificateNumber"/>
													<br/>
												</td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<table style="font-size:9pt;">
						<tbody>
							<tr align="center" valign="top">
								<td class="bordered">№ п/п</td>
								<td class="bordered">Номер транзитной декларации</td>
								<td class="bordered">Номер транспортного (перевозочного) документа</td>
								<td class="bordered">Сведения о транспортном средстве</td>
								<td class="bordered">Вид транспорта</td>
								<td class="bordered">Таможенный орган отправления</td>
								<td class="bordered">Таможенный орган назначения</td>
								<td class="bordered">Наименование товара</td>
								<td class="bordered">Код ТН ВЭД ЕАЭС<sup>*</sup> (не менее первых шести знаков)</td>
								<td class="bordered">Вес брутто, кг.</td>
								<td class="bordered">Количество грузовых мест</td>
								<td class="bordered">Стоимость товара</td>
								<td class="bordered">Буквенный код валюты</td>
								<td class="bordered">Номер и дата дела об административном правонарушении</td>
							</tr>
							<tr align="center">
								<td class="bordered">1</td>
								<td class="bordered">2</td>
								<td class="bordered">3</td>
								<td class="bordered">4</td>
								<td class="bordered">5</td>
								<td class="bordered">6</td>
								<td class="bordered">7</td>
								<td class="bordered">8</td>
								<td class="bordered">9</td>
								<td class="bordered">10</td>
								<td class="bordered">11</td>
								<td class="bordered">12</td>
								<td class="bordered">13</td>
								<td class="bordered">14</td>
							</tr>
							<xsl:for-each select="ccr:ReportData">
								<tr align="center" valign="top">
									<td class="bordered">
										<xsl:apply-templates select="ccr:TDSerialNumber"/>
									</td>
									<td class="bordered">
										<xsl:apply-templates select="ccr:TDNumber"/>
									</td>
									<td class="bordered">
										<xsl:apply-templates select="ccr:TransportDocNumber"/>
									</td>
									<td class="bordered">
										<xsl:for-each select="ccr:TransportInfo">
											<xsl:if test="position()!=1"><br/></xsl:if>
											<xsl:apply-templates select="cat_ru:TransportIdentifier"/>
										</xsl:for-each>
									</td>
									<td class="bordered">
										<xsl:for-each select="ccr:TransportInfo">
											<xsl:if test="position()!=1"><br/></xsl:if>
											<xsl:apply-templates select="cat_ru:TransportKindCode"/>
										</xsl:for-each>
									</td>
									<td class="bordered">
										<xsl:for-each select="ccr:DepartureCustoms/*">
											<xsl:if test="position()!=1"><xsl:text> </xsl:text></xsl:if>
											<xsl:apply-templates select="."/>
										</xsl:for-each>
									</td>
									<td class="bordered">
										<xsl:for-each select="ccr:ArrivalCustoms/*">
											<xsl:if test="position()!=1"><xsl:text> </xsl:text></xsl:if>
											<xsl:apply-templates select="."/>
										</xsl:for-each>
									</td>
									<td class="bordered">
										<xsl:for-each select="ccr:GoodsInfo">
											<xsl:if test="position()!=1">;<br/></xsl:if>
											<xsl:apply-templates select="ccr:GoodsDescription"/>
										</xsl:for-each>
									</td>
									<td class="bordered">
										<xsl:for-each select="ccr:GoodsInfo">
											<xsl:if test="position()!=1">;<br/></xsl:if>
											<xsl:apply-templates select="ccr:GoodsTNVEDCode"/>
										</xsl:for-each>
									</td>
									<td class="bordered">
										<xsl:for-each select="ccr:GoodsInfo">
											<xsl:if test="position()!=1">;<br/></xsl:if>
											<xsl:apply-templates select="ccr:GrossWeightQuantity"/>
										</xsl:for-each>
									</td>
									<td class="bordered">
										<xsl:if test="not(ccr:GoodsInfo/ccr:CargoPlaces/catESAD_cu:PakageQuantity)">0</xsl:if>
										<xsl:for-each select="ccr:GoodsInfo">
											<xsl:if test="position()!=1">;<br/></xsl:if>
											<xsl:apply-templates select="ccr:CargoPlaces/catESAD_cu:PakageQuantity"/>
										</xsl:for-each>
									</td>
									<td class="bordered">
										<xsl:apply-templates select="ccr:TotalCost/RUScat_ru:Amount"/>
									</td>
									<td class="bordered">
										<xsl:apply-templates select="ccr:TotalCost/RUScat_ru:CurrencyCode"/>
									</td>
									<td class="bordered">
										<xsl:for-each select="ccr:AdministrativeOffense">
											<xsl:text>№ </xsl:text>
											<xsl:apply-templates select="ccr:CaseNumber"/>
											<xsl:text> от </xsl:text>
											<xsl:apply-templates select="ccr:CaseDate" mode="russian_date"/>
										</xsl:for-each>
									</td>
								</tr>
							</xsl:for-each>
						</tbody>
					</table>
					<br/>
					<table class="inlinetable" style="width: 100%;">
						<tbody>
							<tr align="left">
								<td class="value" width="30%">
									<br/>
								</td>
								<td width="5%"></td>
								<td class="value" width="35%" align="center">
									<xsl:apply-templates select="ccr:Person" mode="fio"/>
								</td>
								<td width="5%"></td>
								<td class="value" width="35%" align="center">
									<xsl:apply-templates select="ccr:Person/cat_ru:IssueDate" mode="russian_date"/>
								</td>
							</tr>
							<tr align="center">
								<td class="descr" width="40%">
									(подпись руководителя организации<br/>либо лица, им уполномоченного)
								</td>
								<td width="5%"></td>
								<td class="descr" width="40%">(инициалы, фамилия)</td>
								<td width="5%"></td>
								<td class="descr" width="30%">(дата)</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<br/>
					<div style="font-size:8pt;" align="left">
					<xsl:text>____________________________</xsl:text>
					<br/>
					<sup>*</sup><xsl:text> Товарная номенклатура внешнеэкономической деятельности Евразийского экономического союза</xsl:text>
					</div>
				</div>
			</body>
		</html>
	</xsl:template>
	
	<xsl:template match="*" mode="fio">
		<xsl:apply-templates select="cat_ru:PersonName" mode="initial"/>
		<xsl:apply-templates select="cat_ru:PersonMiddleName" mode="initial"/>
		<xsl:apply-templates select="cat_ru:PersonSurname"/>
	</xsl:template>
	<xsl:template match="*" mode="initial">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:value-of select="concat(substring(., 1, 1), '.')"/>
		</element>
	</xsl:template>
	
	<xsl:template match="ccr:TDNumber">
		<xsl:apply-templates select="cat_ru:CustomsCode"/>
		<xsl:text>/</xsl:text>
		<xsl:apply-templates select="cat_ru:RegistrationDate" mode="russian_date_gtd"/>
		<xsl:text>/</xsl:text>
		<xsl:apply-templates select="cat_ru:GTDNumber"/>
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
	<xsl:template match="//*[local-name()='CustomsCarrierReport']//*" priority="-1">
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
