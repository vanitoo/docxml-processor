<?xml version="1.0" encoding="UTF-8"?>
<!-- Приказ ФТС России от 26.03.2012 г. № 566, Приложение 5 (expas:DocSign = 0 и expas:DocSign = 1) -->
<xsl:stylesheet version="1.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.24.0" xmlns:expas="urn:customs.ru:Information:CustomsDocuments:OEZ_ExportPass:5.28.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" encoding="utf-8" indent="yes" media-type="text/html" method="html" omit-xml-declaration="yes" version="1.0"/>
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
	<xsl:template match="//*[local-name()='OEZ_ExportPass']//*" priority="-1">
		<xsl:variable name="xpath">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="current()"/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath}">
			<xsl:apply-templates/>
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
	<xsl:template match="*" mode="russian_date_gtd">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:call-template name="russian_date_gtd">
				<xsl:with-param name="dateIn2" select="."/>
			</xsl:call-template>
		</element>
	</xsl:template>
	<xsl:template match="expas:OEZ_ExportPass">
		<html>
			<head>
				<title>Пропуск на выезд средства транспорта с территории ОЭЗ</title>
				<style type="text/css">
					body {
						text-align: center;
							background: #cccccc;
							font-family: Arial;
							}
						div.page {
							width: 297mm;
							margin-top: 6pt;
							margin-bottom: 6pt;
							padding:	10mm;
							padding-left:	10mm;
							background: #ffffff;
							border: solid .5pt #000000;
							}						
						
						table
						{table-layout: fixed;
						width: 100%;
						border: 0;
						/*empty-cells: show;*/
						border-collapse: collapse;
						margin-top: 0px;}
						
						.normal{
							font-weight: bold;
							font-family:Arial;
							font-size: 10pt; border-left: medium none; border-right: medium none; border-top: medium none; border-bottom: 1pt solid windowtext; 
							}
						.bold{
							font-weight: bold;
							font-family:Arial;
							font-size: 15pt;
							}
						.italic{
							font-style: italic; 
							font-family:Arial;
							font-size: 9pt
							}
							.graph {
						font-family: Arial;
						font-size: 10pt;
						font-weight: bold;
						}
					.graphMain {
						font-family: Arial;
						font-size: 10pt;
						font-weight: normal;
						}
						
						.graphMainbold {
						font-family: Arial;
						font-size: 10pt;
						font-weight:bold;
						}
						.graphLittle {
						font-family: Arial;
						font-size: 7pt;
						}
						.graph8Bold {
						font-family: Arial;
						font-size: 10pt;
						font-weight: bold;
						}				
						.bordered {
						border: solid 1pt black;
						}	
						.borderednormal {
						border-bottom: solid 1pt #000000;
						font-weight: normal;
											}	
						.allbordered {
						border-bottom: solid 1pt #000000;
						border-top: solid 1pt #000000;
						border-left: solid 1pt #000000;
						border-right: solid 1pt #000000;
						font-weight: normal;
											}	
						 td.graphUnderline {
						border-bottom: 1px solid black;
						text-align: center;
						font-weight: normal;
						font-size: 9pt; 
						}
										   
						td.graphNotUnderline {
						border-bottom: 0px solid black;
						text-align: center;
						font-weight: normal; 
						}
						
						.inlinetable
						{border: 0;
						empty-cells: show;
						border-collapse: collapse;
						margin-top: 1px;
						display: -moz-inline-stack;/*Firefox 2*/
						display: inline-table; /*Хорошие браузеры*/
						_overflow: hidden;/*IE6, IE7*/
						*zoom: 1;/*включаем hasLayout для IE6, IE7*/
						*display: inline;/*при hasLayout true display:inline в IE6, IE7 ведёт себя как display:inline-block*/	
						text-indent: 0;
						vertical-align: top;
						align: center;
						text-align: center;}
						
						.value
						{border-bottom: solid 1px black;
						font-style: italic;
						vertical-align:bottom;}
	
						.descr
						{font-size: 7pt;
						text-align: center;
						vertical-align:top;}
                </style>
			</head>
			<body>
				<div class="page">
					<xsl:choose>
						<xsl:when test="expas:ZoneKind = 1 or expas:ZoneKind = 3 or expas:ZoneKind = 4">
							<table border="0" style="width:297mm">
								<tbody>
									<tr>
										<td align="center" style="font-weight: bold;">
											<xsl:text>Разрешение</xsl:text>
											<br/>
											на вывоз товаров с территории особой экономической зоны 
											(за исключением портовой особой экономической зоны), с участка 
											территории опережающего развития, с земельного участка, 
											предоставленного резиденту свободного порта Владивосток, с участка 
											резидента Арктической зоны Российской Федерации, на которых 
											применяется таможенная процедура свободной таможенной зоны
										</td>
									</tr>
									<tr>
										<td align="center">
											<br/>
											<xsl:text>№ </xsl:text>
											<u>
												<xsl:apply-templates select="expas:RegistrationNumber" mode="reg_num"/>
											</u>
										</td>
									</tr>
									<tr>
										<td align="left">
											<br/>
											Разрешается вывоз товаров с территории особой экономической зоны (за исключением портовой особой экономической зоны), с участка территории опережающего развития, 
											с земельного участка, предоставленного резиденту свободного порта Владивосток, с участка резидента Арктической зоны Российской Федерации, на который применяется
											<table class="inlinetable" style="width: 100%;">
												<tbody>
													<tr align="center">
														<td class="value" width="100%;">
															<xsl:apply-templates select="expas:Resident" mode="resolution"/>
														</td>
													</tr>
													<tr align="center">
														<td class="descr">
															(резидент особой экономической зоны, резидент территории опережающего развития, резидент свободного порта Владивосток, резидент Арктической зоны Российской Федерации)
														</td>
													</tr>
												</tbody>
											</table>
											таможенная процедура свободной таможенной зоны, по уведомлению
											<table class="inlinetable" style="width: 100%;">
												<tbody>
													<tr align="center">
														<td class="value" width="100%;">
															<xsl:apply-templates select="expas:ExportNoticeRegNumber" mode="reg_num"/>
														</td>
													</tr>
													<tr align="center">
														<td class="descr">
															(регистрационный номер уведомления о вывозе товаров)
														</td>
													</tr>
												</tbody>
											</table>
											общим весом
											<table class="inlinetable" style="width: 100mm;">
												<tbody>
													<tr align="center">
														<td class="value" width="100%;">
															<xsl:apply-templates select="expas:TotalWeight"/>
														</td>
													</tr>
													<tr align="center">
														<td class="descr">
															(вес транспортного средства и вывозимых товаров)
														</td>
													</tr>
												</tbody>
											</table>
											(кг) согласно следующим сведениям.
										</td>
									</tr>
								</tbody>
							</table>
							<br/>
							<table>
								<tbody>
									<tr>
										<td align="left">Таблица "Перечень товаров"</td>
									</tr>
								</tbody>
							</table>
							<table style="font-size: 9pt;">
								<tbody>
									<tr align="center" valign="top">
										<td width="2%" class="bordered">
											№ п/п
										</td>
										<td width="45%" class="bordered">
											Наименование товара
										</td>
										<td class="bordered">
											Количество /
											единица измерения
										</td>
										<td class="bordered">
											Количество грузовых мест
										</td>
										<td class="bordered">
											Вес товара, кг
										</td>
										<td class="bordered">
											Вид упаковки
										</td>
										<td width="5%" class="bordered">
											Статус товаров
										</td>
										<td class="bordered" width="20%">
											Основание для вывоза
										</td>
									</tr>
									<tr align="center" valign="top">
										<td class="bordered">1</td>
										<td class="bordered">2</td>
										<td class="bordered">3</td>
										<td class="bordered">4</td>
										<td class="bordered">5</td>
										<td class="bordered">6</td>
										<td class="bordered">7</td>
										<td class="bordered">8</td>
									</tr>
									<xsl:for-each select="expas:GoodsList">
										<tr align="left" valign="top">
											<td class="bordered" align="center">
												<xsl:apply-templates select="expas:GoodsNumber"/>
											</td>
											<td class="bordered">
												<xsl:apply-templates select="expas:GoodsDescription"/>
											</td>
											<td class="bordered" align="center">
												<xsl:apply-templates select="expas:SupplementaryQuantity" mode="quantity"/>
											</td>
											<td class="bordered" align="center">
												<xsl:apply-templates select="expas:PackagesQuantity"/>
											</td>
											<td class="bordered" align="center">
												<xsl:apply-templates select="expas:GrossWeightQuantity"/>
											</td>
											<td class="bordered" align="left">
												<xsl:apply-templates select="expas:PackagingCode"/>
												<xsl:if test="expas:PackagingKind">
													<br/>
													<xsl:apply-templates select="expas:PackagingKind"/>
												</xsl:if>
												<xsl:if test="expas:GoodsIdentification">
													<br/>
													<xsl:apply-templates select="expas:GoodsIdentification"/>
												</xsl:if>
											</td>
											<td class="bordered" align="center">
												<xsl:for-each select="expas:GoodsStatus/expas:StatusSymbolicValue">
													<xsl:if test="position() != 1"><br/></xsl:if>
													<xsl:apply-templates select="."/>
												</xsl:for-each>
											</td>
											<td class="bordered" align="center">
												<xsl:for-each select="expas:GoodsStatus/*[contains(local-name(), 'GoodsStatus')]">
													<xsl:if test="position() != 1"><br/></xsl:if>
													<xsl:apply-templates select="."/>
												</xsl:for-each>
											</td>
										</tr>
									</xsl:for-each>
								</tbody>
							</table>
							<br/>
							<table style="width:297mm">
								<tbody>
									<tr>
										<td align="left">
											<br/>Таблица "Перечень документов"<br/>
										</td>
									</tr>
									<tr>
										<td>
											<table width="70%">
												<tbody>
													<tr>
														<td class="bordered" width="10%">№ п/п</td>
														<td class="bordered" width="50%">Наименование документов</td>
														<td class="bordered" width="40%">Номер, дата документа</td>
													</tr>
													<tr align="center">
														<td class="bordered">1</td>
														<td class="bordered">2</td>
														<td class="bordered">3</td>
													</tr>
													<xsl:for-each select="expas:DocumentExp">
														<xsl:variable name="pos" select="position()"/>
														<tr>
															<td class="bordered">
																<xsl:number value="position()"/>
															</td>
															<td class="bordered">
																<xsl:apply-templates select="cat_ru:PrDocumentName"/>
															</td>
															<td class="bordered" align="center">
																№ <xsl:apply-templates select="cat_ru:PrDocumentNumber"/> от <xsl:apply-templates select="cat_ru:PrDocumentDate" mode="russian_date"/>
															</td>
														</tr>
													</xsl:for-each>
												</tbody>
											</table>
										</td>
									</tr>
								</tbody>
							</table>
							<br/>
							<table>
								<tbody>
									<tr align="left">
										<td>
											<xsl:text>Транспортное средство / без транспортного средства</xsl:text>
											<br/>
											<xsl:apply-templates select="expas:TransportMeans"/>
											<br/>
											<xsl:apply-templates select="expas:TransportMeans" mode="transport_numbers"/>
										</td>
									</tr>
								</tbody>
							</table>
							<br/>
							<table>
								<tbody>
									<tr align="left">
										<td>
											<xsl:text>Вес транспортного средства</xsl:text>
											<br/>
											<xsl:apply-templates select="expas:TransportMeans/expas:TareWeight"/>
										</td>
									</tr>
								</tbody>
							</table>
							<br/>
							<table>
								<tbody>
									<tr align="left">
										<td>
											<xsl:text>Сборный груз</xsl:text>
											<br/>
											<xsl:apply-templates select="expas:CombinedCargo"/>
										</td>
									</tr>
								</tbody>
							</table>
							<br/>
							<table>
								<tbody>
									<tr align="left">
										<td>
											<xsl:text>Срок действия настоящего разрешения </xsl:text>
											<br/>
											<xsl:apply-templates select="expas:LimitDate" mode="russian_date"/>
										</td>
									</tr>
								</tbody>
							</table>
							<br/>
							<table>
								<tbody>
									<tr align="left">
										<td>
											<xsl:text>Срок представления документов </xsl:text>
											<br/>
											<xsl:apply-templates select="expas:DeadlineForDocuments" mode="russian_date"/>
										</td>
									</tr>
								</tbody>
							</table>
							<br/><br/><br/>
							<table border="0" style="width:297mm">
								<tbody>
									<tr>
										<td align="left" style="width:137mm; border-bottom: 1pt solid windowtext;" valign="top">
											<xsl:for-each select="expas:CustomsPerson">
												<xsl:apply-templates select="*[local-name() = 'PersonPost']"/>
												<br/>
												<xsl:for-each select="*[contains(local-name(), 'ame')]">
													<xsl:if test="position()!=1"><xsl:text> </xsl:text></xsl:if>
													<xsl:apply-templates select="."/>
												</xsl:for-each>
											</xsl:for-each>
										</td>
										<td align="center" style="width:60mm;" valign="top">
											<br/>
										</td>
										<td style="width:100mm; border-bottom: 1pt solid windowtext;">
											<br/>
										</td>
									</tr>
									<tr>
										<td align="center" style="width:137mm" class="graphLittle">
											(должность, фамилия, имя, отчество (при наличии) должностного лица таможенного органа)
										</td>
										<td align="center" style="width:60mm;" valign="top">
											<br/>
										</td>
										<td align="center" style="width:100mm" class="graphLittle">
											(подпись)
										</td>
									</tr>
								</tbody>
							</table>
						</xsl:when>
						<xsl:when test="expas:ZoneKind = 2">
							<table border="0" style="width:297mm">
								<tbody>
									<tr>
										<td align="center" style="font-weight: bold;">
											<xsl:text>Разрешение</xsl:text>
											<br/>
											на вывоз товаров с портовой особой экономической зоны, с земельного участка, прилегающего 
											к автомобильному или железнодорожному пункту пропуска свободного порта Владивосток, Арктической зоны 
											Российской Федерации, на котором применяется таможенная процедура свободной таможнной зоны, 
											установленная для логистической особой экономической зоны, с отдельных участков морских портов, открытых 
											для международного сообщения и захода иностранных морских судов, включая акваторию морского порта, 
											и (или) с отдельных участков территории аэропорта, открытого для приема и отправки воздушных судов, 
											выполняющих международные воздушные перевозки, находящиеся на территории свободного порта 
											Владивосток, в Арктической зоне Российской Федерации, с отдельных участков территории свободного порта 
											Республики Крым и города федерального значения Севастополя, на которых применяется таможенная 
											процедура свободной таможенной зоны, установленная для портовой особой экономической зоны
										</td>
									</tr>
									<tr>
										<td align="center">
											<br/>
											<xsl:text>№ </xsl:text>
											<u>
												<xsl:apply-templates select="expas:RegistrationNumber" mode="reg_num"/>
											</u>
										</td>
									</tr>
									<tr>
										<td align="left">
											<br/>
											Разрешается вывоз товаров :
											<table class="inlinetable" style="width: 100%;">
												<tbody>
													<tr align="center">
														<td class="value" width="100%;">
															<xsl:apply-templates select="expas:Resident" mode="resolution"/>
														</td>
													</tr>
													<tr align="center">
														<td class="descr">
															(резидент портовой особой экономической зоны, свободного порта Владивосток, Арктической зоны Российской Федерации, участник свободной экономической зоны (далее - резидент или участник) или лицо, не являющееся резидентом или участником)
														</td>
													</tr>
												</tbody>
											</table>
											по уведомлению
											<table class="inlinetable" style="width: 100%;">
												<tbody>
													<tr align="center">
														<td class="value" width="100%;">
															<xsl:apply-templates select="expas:ExportNoticeRegNumber" mode="reg_num"/>
														</td>
													</tr>
													<tr align="center">
														<td class="descr">
															(регистрационной номер уведомления о вывозе товаров)
														</td>
													</tr>
												</tbody>
											</table>
											общим весом
											<table class="inlinetable" style="width: 100mm;">
												<tbody>
													<tr align="center">
														<td class="value" width="100%;">
															<xsl:apply-templates select="expas:TotalWeight"/>
														</td>
													</tr>
													<tr align="center">
														<td class="descr">
															(вес транспортного средства и вывозимых товаров)
														</td>
													</tr>
												</tbody>
											</table>
											(кг) согласно следующим сведениям.
										</td>
									</tr>
								</tbody>
							</table>
							<br/>
							<table>
								<tbody>
									<tr align="left">
										<td>
											<xsl:text>Сборный груз</xsl:text>
											<br/>
											<xsl:apply-templates select="expas:CombinedCargo"/>
										</td>
									</tr>
								</tbody>
							</table>
							<br/>
							<table>
								<tbody>
									<tr>
										<td align="left">Таблица "Перечень товаров"</td>
									</tr>
								</tbody>
							</table>
							<table style="font-size: 8pt;">
								<tbody>
									<tr align="center" valign="top">
										<td rowspan="3" class="bordered" style="word-break: break-all;">№ п/п</td>
										<td rowspan="3" class="bordered" style="word-break: break-all;">Наименование товара</td>
										<td rowspan="3" class="bordered" style="word-break: break-all;">Кол-во / ед. изм.</td>
										<td rowspan="3" class="bordered" style="word-break: break-all;">Кол-во грузовых мест</td>
										<td rowspan="3" class="bordered" style="word-break: break-all;">Вес товара, кг</td>
										<td rowspan="3" class="bordered" style="word-break: break-all;">Вид упаковки</td>
										<td rowspan="3" class="bordered" style="word-break: break-all;">Статус товаров</td>
										<td colspan="13" class="bordered" style="word-break: break-all;">Основание для вывоза</td>
									</tr>
									<tr align="center" valign="top">
										<td colspan="4" class="bordered" style="word-break: break-all;">завершение таможенной процедуры свободной таможенной зоны</td>
										<td colspan="2" class="bordered" style="word-break: break-all;">вывоз без завершения таможенной процедуры свободной таможенной зоны</td>
										<td colspan="2" class="bordered" style="word-break: break-all;">вывоз проб и (или) образцов</td>
										<td colspan="2" class="bordered" style="word-break: break-all;">вывоз товаров, которые не помещаются под таможенную процедуру свободной таможенной зоны</td>
										<td colspan="3" class="bordered" style="word-break: break-all;">вывоз товаров, помещенных за пределами портового (логистического) участка под таможенные процедуры, применимые к вывозимым товарам</td>
									</tr>
									<tr align="center" valign="top">
										<td class="bordered" style="word-break: break-all;">код таможенной процедуры</td>
										<td class="bordered" style="word-break: break-all;">рег.номер декларации на товары / номер товара</td>
										<td class="bordered" style="word-break: break-all;">масса нетто вывозимого товара, кг</td>
										<td class="bordered" style="word-break: break-all;">кол-во товара в ДЕИ / ед. изм.</td>
										<td class="bordered" style="word-break: break-all;">номер и дата таможенного документа</td>
										<td class="bordered" style="word-break: break-all;">кол-во / ед. изм.</td>
										<td class="bordered" style="word-break: break-all;">номер разрешения</td>
										<td class="bordered" style="word-break: break-all;">кол-во / ед. изм.</td>
										<td class="bordered" style="word-break: break-all;">рег. номер разрешения на ввоз</td>
										<td class="bordered" style="word-break: break-all;">кол-во / ед. изм.</td>
										<td class="bordered" style="word-break: break-all;">рег. номер разрешения на ввоз</td>
										<td class="bordered" style="word-break: break-all;">рег.номер декларации на товары / номер товара</td>
										<td class="bordered" style="word-break: break-all;">кол-во / ед. изм.</td>
									</tr>
									<tr align="center" valign="top">
										<td class="bordered" style="word-break: break-all;">1</td>
										<td class="bordered" style="word-break: break-all;">2</td>
										<td class="bordered" style="word-break: break-all;">3</td>
										<td class="bordered" style="word-break: break-all;">4</td>
										<td class="bordered" style="word-break: break-all;">5</td>
										<td class="bordered" style="word-break: break-all;">6</td>
										<td class="bordered" style="word-break: break-all;">7</td>
										<td class="bordered" style="word-break: break-all;">8</td>
										<td class="bordered" style="word-break: break-all;">9</td>
										<td class="bordered" style="word-break: break-all;">10</td>
										<td class="bordered" style="word-break: break-all;">11</td>
										<td class="bordered" style="word-break: break-all;">12</td>
										<td class="bordered" style="word-break: break-all;">13</td>
										<td class="bordered" style="word-break: break-all;">14</td>
										<td class="bordered" style="word-break: break-all;">15</td>
										<td class="bordered" style="word-break: break-all;">16</td>
										<td class="bordered" style="word-break: break-all;">17</td>
										<td class="bordered" style="word-break: break-all;">18</td>
										<td class="bordered" style="word-break: break-all;">19</td>
										<td class="bordered" style="word-break: break-all;">20</td>
									</tr>
									<xsl:for-each select="expas:GoodsList">
										<tr align="center" valign="top">
											<td class="bordered" style="word-break: break-all;">
												<xsl:apply-templates select="expas:GoodsNumber"/>
											</td>
											<td class="bordered" style="word-break: break-all;">
												<xsl:apply-templates select="expas:GoodsDescription"/>
											</td>
											<td class="bordered" style="word-break: break-all;">
												<xsl:apply-templates select="expas:SupplementaryQuantity" mode="quantity"/>
											</td>
											<td class="bordered" style="word-break: break-all;">
												<xsl:apply-templates select="expas:PackagesQuantity"/>
											</td>
											<td class="bordered" style="word-break: break-all;">
												<xsl:apply-templates select="expas:GrossWeightQuantity"/>
											</td>
											<td class="bordered" style="word-break: break-all;">
												<xsl:apply-templates select="expas:PackagingCode"/>
												<xsl:if test="expas:GoodsIdentification">
													<br/>
													<xsl:apply-templates select="expas:GoodsIdentification"/>
												</xsl:if>
											</td>
											<td class="bordered" style="word-break: break-all;">
												<xsl:for-each select="expas:GoodsStatus/expas:StatusSymbolicValue">
													<xsl:if test="position() != 1"><br/></xsl:if>
													<xsl:apply-templates select="."/>
												</xsl:for-each>
											</td>
											<td class="bordered" style="word-break: break-all;">
												<xsl:for-each select="expas:GoodsStatus/expas:GoodsStatus1/expas:CustomsModeCode">
													<xsl:if test="position() != 1">, </xsl:if>
													<xsl:apply-templates select="."/>
												</xsl:for-each>
											</td>
											<td class="bordered" style="word-break: break-all;">
												<xsl:for-each select="expas:GoodsStatus/expas:GoodsStatus1">
													<xsl:if test="position() != 1"><br/></xsl:if>
													<xsl:apply-templates select="."/>
												</xsl:for-each>
											</td>
											<td class="bordered" style="word-break: break-all;">
												<xsl:for-each select="expas:GoodsStatus/expas:GoodsStatus1/expas:DTInfo/expas:DTGoods/expas:NetWeightQuantity">
													<xsl:if test="position() != 1"><br/></xsl:if>
													<xsl:apply-templates select="."/>
												</xsl:for-each>
											</td>
											<td class="bordered" style="word-break: break-all;">
												<xsl:for-each select="expas:GoodsStatus/expas:GoodsStatus1/expas:DTInfo/expas:DTGoods/expas:SupplementaryQuantity">
													<xsl:if test="position() != 1"><br/></xsl:if>
													<xsl:apply-templates select="." mode="quantity"/>
												</xsl:for-each>
											</td>
											<td class="bordered" style="word-break: break-all;">
												<xsl:for-each select="expas:GoodsStatus/expas:GoodsStatus3/expas:PermitRegistrationNumber">
													<xsl:if test="position() != 1"><br/></xsl:if>
													<xsl:apply-templates select="." mode="reg_num"/>
												</xsl:for-each>
											</td>
											<td class="bordered" style="word-break: break-all;">
												<xsl:for-each select="expas:GoodsStatus/expas:GoodsStatus3/expas:SupplementaryQuantity">
													<xsl:if test="position() != 1"><br/></xsl:if>
													<xsl:apply-templates select="." mode="quantity"/>
												</xsl:for-each>
											</td>
											<td class="bordered" style="word-break: break-all;">
												<xsl:for-each select="expas:GoodsStatus/expas:GoodsStatus9/expas:PermissionTakeSamples">
													<xsl:if test="position() != 1"><br/></xsl:if>
													<xsl:apply-templates select="." mode="doc"/>
												</xsl:for-each>
											</td>
											<td class="bordered" style="word-break: break-all;">
												<xsl:for-each select="expas:GoodsStatus/expas:GoodsStatus9/expas:SupplementaryQuantity">
													<xsl:if test="position() != 1"><br/></xsl:if>
													<xsl:apply-templates select="." mode="quantity"/>
												</xsl:for-each>
											</td>
											<td class="bordered" style="word-break: break-all;">
												<xsl:for-each select="expas:GoodsStatus/expas:GoodsStatus6/expas:PermitRegistrationNumber">
													<xsl:if test="position() != 1"><br/></xsl:if>
													<xsl:apply-templates select="." mode="reg_num"/>
												</xsl:for-each>
											</td>
											<td class="bordered" style="word-break: break-all;">
												<xsl:for-each select="expas:GoodsStatus/expas:GoodsStatus6/expas:SupplementaryQuantity">
													<xsl:if test="position() != 1"><br/></xsl:if>
													<xsl:apply-templates select="." mode="quantity"/>
												</xsl:for-each>
											</td>
											<td class="bordered" style="word-break: break-all;">
												<xsl:for-each select="expas:GoodsStatus/expas:GoodsStatus2/expas:PermitRegistrationNumber">
													<xsl:if test="position() != 1"><br/></xsl:if>
													<xsl:apply-templates select="." mode="reg_num"/>
												</xsl:for-each>
											</td>
											<td class="bordered" style="word-break: break-all;">
												<xsl:for-each select="expas:GoodsStatus/expas:GoodsStatus2/expas:DTInfo/expas:GTDID">
													<xsl:if test="position() != 1"><br/></xsl:if>
													<xsl:apply-templates select="."/>
												</xsl:for-each>
											</td>
											<td class="bordered" style="word-break: break-all;">
												<xsl:for-each select="expas:GoodsStatus/expas:GoodsStatus2/expas:DTInfo/expas:DTGoods/expas:SupplementaryQuantity">
													<xsl:if test="position() != 1"><br/></xsl:if>
													<xsl:apply-templates select="." mode="quantity"/>
												</xsl:for-each>
											</td>
										</tr>
									</xsl:for-each>
								</tbody>
							</table>
							<br/>
							<table style="width:297mm">
								<tbody>
									<tr>
										<td align="left">
											<br/>Таблица "Перечень документов"<br/>
										</td>
									</tr>
									<tr>
										<td>
											<table width="70%">
												<tbody>
													<tr>
														<td class="bordered" width="10%">№ п/п</td>
														<td class="bordered" width="50%">Наименование документов</td>
														<td class="bordered" width="40%">Номер, дата документа</td>
													</tr>
													<tr align="center">
														<td class="bordered">1</td>
														<td class="bordered">2</td>
														<td class="bordered">3</td>
													</tr>
													<xsl:for-each select="expas:DocumentExp">
														<xsl:variable name="pos" select="position()"/>
														<tr>
															<td class="bordered">
																<xsl:number value="position()"/>
															</td>
															<td class="bordered">
																<xsl:apply-templates select="cat_ru:PrDocumentName"/>
															</td>
															<td class="bordered" align="center">
																№ <xsl:apply-templates select="cat_ru:PrDocumentNumber"/> от <xsl:apply-templates select="cat_ru:PrDocumentDate" mode="russian_date"/>
															</td>
														</tr>
													</xsl:for-each>
												</tbody>
											</table>
										</td>
									</tr>
								</tbody>
							</table>
							<br/>
							<table>
								<tbody>
									<tr align="left">
										<td>
											<xsl:text>Транспортное средсво / без транспортного средства</xsl:text>
											<br/>
											<xsl:apply-templates select="expas:TransportMeans"/>
											<br/>
											<xsl:apply-templates select="expas:TransportMeans" mode="transport_numbers"/>
										</td>
									</tr>
								</tbody>
							</table>
							<br/>
							<table>
								<tbody>
									<tr align="left">
										<td>
											<xsl:text>Вес транспортного средства</xsl:text>
											<br/>
											<xsl:apply-templates select="expas:TransportMeans/expas:TareWeight"/>
										</td>
									</tr>
								</tbody>
							</table>
							<br/>
							<table>
								<tbody>
									<tr align="left">
										<td>
											<xsl:text>Срок действия настоящего разрешения </xsl:text>
											<br/>
											<xsl:apply-templates select="expas:LimitDate" mode="russian_date"/>
										</td>
									</tr>
								</tbody>
							</table>
							<br/>
							<table>
								<tbody>
									<tr align="left">
										<td>
											<xsl:text>Срок представления документов </xsl:text>
											<br/>
											<xsl:apply-templates select="expas:DeadlineForDocuments" mode="russian_date"/>
										</td>
									</tr>
								</tbody>
							</table>
							<br/><br/><br/>
							<table border="0" style="width:297mm">
								<tbody>
									<tr>
										<td align="left" style="width:137mm; border-bottom: 1pt solid windowtext;" valign="top">
											<xsl:for-each select="expas:CustomsPerson">
												<xsl:apply-templates select="*[local-name() = 'PersonPost']"/>
												<br/>
												<xsl:for-each select="*[contains(local-name(), 'ame')]">
													<xsl:if test="position()!=1"><xsl:text> </xsl:text></xsl:if>
													<xsl:apply-templates select="."/>
												</xsl:for-each>
											</xsl:for-each>
										</td>
										<td align="center" style="width:60mm;" valign="top">
											<br/>
										</td>
										<td style="width:100mm; border-bottom: 1pt solid windowtext;">
											<br/>
										</td>
									</tr>
									<tr>
										<td align="center" style="width:137mm" class="graphLittle">
											(должность, фамилия, имя, отчество (при наличии) должностного лица таможенного органа)
										</td>
										<td align="center" style="width:60mm;" valign="top">
											<br/>
										</td>
										<td align="center" style="width:100mm" class="graphLittle">
											(подпись)
										</td>
									</tr>
								</tbody>
							</table>
						</xsl:when>
					</xsl:choose>
				</div>
			</body>
		</html>
	</xsl:template>
	
	<xsl:template match="expas:PackagingCode">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:choose>
				<xsl:when test=". = 1">с упаковкой</xsl:when>
				<xsl:when test=". = 2">без упаковки</xsl:when>
				<xsl:when test=". = 3">навалом / наливом / насыпом</xsl:when>
			</xsl:choose>
		</element>
	</xsl:template>
	
	<xsl:template match="*[local-name() = 'CombinedCargo']">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:choose>
				<xsl:when test=". = 1 or translate(substring(., 1, 1), 't', 'T') = 'T'">ввоз товаров в составе сборного груза</xsl:when>
				<xsl:otherwise> - </xsl:otherwise>
			</xsl:choose>
		</element>
	</xsl:template>
	
	<xsl:template match="*[local-name() = 'TransportMeans']" mode="transport_numbers">
		<xsl:if test="expas:ContainerNumber">
			<xsl:text> Контейнеры: </xsl:text>
			<xsl:for-each select="expas:ContainerNumber">
				<xsl:if test="position() != 1">, </xsl:if>
				<xsl:apply-templates select="."/>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="expas:ActiveTransportIdentifier">
			<xsl:text> Рег.номер ТС: </xsl:text>
			<xsl:apply-templates select="expas:ActiveTransportIdentifier"/>
		</xsl:if>
		<xsl:if test="*[local-name() = 'TransportRegNumber']">
			<xsl:text> Прицеп: </xsl:text>
			<xsl:for-each select="*[local-name() = 'TransportRegNumber']">
				<xsl:if test="position() != 1">, </xsl:if>
				<xsl:apply-templates select="."/>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="expas:FlightNumber">
			<xsl:text> Рейс: </xsl:text>
			<xsl:apply-templates select="expas:FlightNumber"/>
		</xsl:if>
		<xsl:if test="expas:FlightDate">
			<xsl:text> Дата рейса: </xsl:text>
			<xsl:apply-templates select="expas:FlightDate" mode="russian_date"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="*[local-name() = 'TransportMeans']">
		<xsl:apply-templates select="expas:TransportKind"/>
		<xsl:if test="expas:TransportMark">
			<xsl:text>, Марка: </xsl:text>
			<xsl:apply-templates select="expas:TransportMark"/>
		</xsl:if>
		<xsl:if test="expas:TransportModel">
			<xsl:text>, Модель: </xsl:text>
			<xsl:apply-templates select="expas:TransportModel"/>
		</xsl:if>
		<xsl:if test="expas:TrainType">
			<xsl:text>, Тип подвижного ж/д состава: </xsl:text>
			<xsl:apply-templates select="expas:TrainType"/>
		</xsl:if>
		<xsl:if test="expas:PersonDetails">
			<xsl:text>, ФИО: </xsl:text>
			<xsl:for-each select="expas:PersonDetails/*[contains(local-name(), 'ame')]">
				<xsl:if test="position() != 1">
					<xsl:text> </xsl:text>
				</xsl:if>
				<xsl:apply-templates select="."/>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="expas:PersonID">
			<xsl:text>, Документ, удостоверяющий личность: </xsl:text>
			<xsl:apply-templates select="expas:PersonID" mode="personID"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="*[local-name() = 'TransportKind']">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:choose>
				<xsl:when test=". = 1">а/м</xsl:when>
				<xsl:when test=". = 2">ж/д</xsl:when>
				<xsl:when test=". = 3">авиа</xsl:when>
				<xsl:when test=". = 4">в/т</xsl:when>
				<xsl:when test=". = 5">спецтехника</xsl:when>
				<xsl:when test=". = 6">ручная кладь (багаж)</xsl:when>
			</xsl:choose>
		</element>
	</xsl:template>
	<xsl:template match="*" mode="personID">
		<xsl:apply-templates select="*[local-name() = 'IdentityCardSeries']"/>
		<xsl:text> </xsl:text>
		<xsl:apply-templates select="*[local-name() = 'IdentityCardNumber']"/>
		<xsl:if test="*[local-name() = 'IdentityCardDate']">
			<xsl:text> от </xsl:text>
			<xsl:apply-templates select="*[local-name() = 'IdentityCardDate']" mode="russian_date"/>
		</xsl:if>
	</xsl:template>
	
	<!-- типы документов -->
	<xsl:template match="*[local-name() = 'GoodsStatus1']">
		<xsl:for-each select="*[local-name() = 'DTInfo']/*[local-name() = 'GTDID']">
			<br/>
			<xsl:apply-templates select="."/>
			<xsl:for-each select="../*[local-name() = 'DTGoods']/*[local-name() = 'GoodsNumeric']">
				<xsl:text>/</xsl:text>
				<xsl:apply-templates select="."/>
			</xsl:for-each>
		</xsl:for-each>
	</xsl:template>
	<xsl:template match="*[local-name() = 'GoodsStatus2']">
		<xsl:for-each select="*[local-name() = 'DTInfo']/*[local-name() = 'GTDID']">
			<br/>
			<xsl:apply-templates select="."/>
			<xsl:if test="*[local-name() = 'GoodsNumber']">
				<xsl:text>/</xsl:text>
				<xsl:apply-templates select="*[local-name() = 'GoodsNumber']"/>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>
	<xsl:template match="*[local-name() = 'GoodsStatus3']">
		<xsl:for-each select="*[local-name() = 'PermitRegistrationNumber']">
			<br/>
			<xsl:apply-templates select="." mode="reg_num"/>
		</xsl:for-each>
	</xsl:template>
	<xsl:template match="*[local-name() = 'GoodsStatus4']">
		<xsl:for-each select="*[local-name() = 'PermitRegistrationNumber']">
			<br/>
			<xsl:apply-templates select="." mode="reg_num"/>
		</xsl:for-each>
	</xsl:template>
	<xsl:template match="*[local-name() = 'GoodsStatus5']">
		<xsl:for-each select="*[local-name() = 'PermitRegistrationNumber']">
			<br/>
			<xsl:apply-templates select="." mode="reg_num"/>
		</xsl:for-each>
	</xsl:template>
	<xsl:template match="*[local-name() = 'GoodsStatus6']">
		<xsl:for-each select="*[local-name() = 'PermitRegistrationNumber']">
			<xsl:if test="position() != 1"><br/></xsl:if>
			<xsl:apply-templates select="." mode="reg_num"/>
		</xsl:for-each>
		<xsl:if test="*[local-name() = 'AccountingDocumentInfo']">
			<xsl:text> </xsl:text>
			<xsl:apply-templates select="*[local-name() = 'AccountingDocumentInfo']/*[local-name() = 'AccountingDoc']" mode="doc"/>
		</xsl:if>
		<xsl:if test="*[local-name() = 'expas:ConclusionIdentifi']">
			<xsl:text> </xsl:text>
			<xsl:apply-templates select="*[local-name() = 'expas:ConclusionIdentifi']" mode="reg_num"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="*[local-name() = 'GoodsStatus7']">
		<xsl:for-each select="*[local-name() = 'DTInfo']/*[local-name() = 'GTDID']">
			<xsl:if test="position() != 1"><br/></xsl:if>
			<xsl:apply-templates select="."/>
			<xsl:for-each select="../*[local-name() = 'DTGoods']/*[local-name() = 'GoodsNumeric']">
				<xsl:text>/</xsl:text>
				<xsl:apply-templates select="."/>
			</xsl:for-each>
		</xsl:for-each>
		<xsl:if test="*[local-name() = 'AccountingDocumentInfo']">
			<xsl:text> </xsl:text>
			<xsl:apply-templates select="*[local-name() = 'AccountingDocumentInfo']/*[local-name() = 'AccountingDoc']" mode="doc"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="*[local-name() = 'GoodsStatus8']">
		<xsl:for-each select="*[contains(local-name(), 'WH')]">
			<xsl:text>, </xsl:text>
			<xsl:apply-templates select="." mode="doc"/>
		</xsl:for-each>
		<xsl:if test="*[local-name() = 'TerritoryAddress']">
			<xsl:text>, </xsl:text>
			<xsl:apply-templates select="*[local-name() = 'TerritoryAddress']" mode="address"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="*[local-name() = 'GoodsStatus9']">
		<xsl:for-each select="*[local-name() = 'PermissionTakeSamples']">
			<br/>
			<xsl:apply-templates select="." mode="doc"/>
		</xsl:for-each>
	</xsl:template>
	<xsl:template match="*[local-name() = 'GoodsStatus10']">
		<xsl:apply-templates select="." mode="doc"/>
	</xsl:template>
	
	<xsl:template match="*" mode="address">
		<xsl:choose>
			<xsl:when test="RUScat_ru:AddressText">
				<xsl:value-of select="RUScat_ru:AddressText"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:variable name="last">
					<!-- надо через переменную, т.к. смещение на невыводимые KLADR, AOGUID, AOID -->
					<xsl:choose>
						<xsl:when test="local-name(*[last()])='KLADR' or local-name(*[last()])='AOGUID' or local-name(*[last()])='AOID'">
							<xsl:choose>
								<xsl:when test="RUScat_ru:KLADR and RUScat_ru:AOGUID and RUScat_ru:AOID">
									<xsl:value-of select="count(*) - 3"/>
								</xsl:when>
								<xsl:when test="(not(RUScat_ru:KLADR) and RUScat_ru:AOGUID and RUScat_ru:AOID) or (RUScat_ru:KLADR and not(RUScat_ru:AOGUID) and RUScat_ru:AOID) or (RUScat_ru:KLADR and RUScat_ru:AOGUID and not(RUScat_ru:AOID)) ">
									<xsl:value-of select="count(*) - 2"/>
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="count(*) - 1"/>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="count(*)"/>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
				<xsl:for-each select="*">
					<xsl:if test="local-name()='OKTMO'">ОКТМО: </xsl:if>
					<xsl:if test="local-name()='OKATO'"> ОКАТО: </xsl:if>
					<xsl:if test="local-name()='TerritoryCode'">Код единицы административно - территориального деления: </xsl:if>
					<xsl:if test="local-name()='PostOfficeBoxId'">Номер а/я: </xsl:if>
					<xsl:choose>
						<xsl:when test="local-name()='CountryCode'">
							<xsl:if test="not(../RUScat_ru:CounryName)">
								<xsl:value-of select="."/>
								<xsl:if test="position()!=$last">, </xsl:if>
							</xsl:if>
						</xsl:when>
						<xsl:when test="local-name()='KLADR' or local-name()='AOGUID' or local-name()='AOID'">
							<!--в этом случае ничего не выводим-->
						</xsl:when>
						<xsl:otherwise>
							<xsl:if test="not(local-name()='AddressKindCode')">
								<xsl:value-of select="."/>
								<xsl:if test="position()!=$last">, </xsl:if>
							</xsl:if>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:for-each>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
	<xsl:template match="*" mode="doc">
		<xsl:apply-templates select="*[local-name() = 'PrDocumentName']"/>
		<xsl:if test="*[local-name() = 'PrDocumentNumber']">
			<xsl:text> № </xsl:text>
			<xsl:apply-templates select="*[local-name() = 'PrDocumentNumber']"/>
		</xsl:if>
		<xsl:if test="*[local-name() = 'PrDocumentDate']">
			<xsl:text> от </xsl:text>
			<xsl:apply-templates select="*[local-name() = 'PrDocumentDate']" mode="russian_date"/>
		</xsl:if>
	</xsl:template>
	
	<xsl:template match="expas:StatusSymbolicValue">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:choose>
				<xsl:when test=". = 1">ЕАЭС</xsl:when>
				<xsl:when test=". = 2">ИНТ</xsl:when>
				<xsl:when test=". = 3">СТЗ</xsl:when>
				<xsl:when test=". = 4">ТРАНЗИТ</xsl:when>
			</xsl:choose>
		</element>
	</xsl:template>
	<xsl:template match="*" mode="quantity">
		<xsl:apply-templates select="*[local-name() = 'GoodsQuantity']"/>
		<xsl:text> </xsl:text>
		<xsl:apply-templates select="*[local-name() = 'MeasureUnitQualifierName']"/>
		<xsl:if test="*[local-name() = 'MeasureUnitQualifierCode']">
			<xsl:text> (</xsl:text>
			<xsl:apply-templates select="*[local-name() = 'MeasureUnitQualifierCode']"/>
			<xsl:text>)</xsl:text>
		</xsl:if>
	</xsl:template>
	<xsl:template match="expas:Resident" mode="resolution">
		<xsl:apply-templates select="cat_ru:OrganizationName"/>
		<xsl:if test="not(cat_ru:OrganizationName) and cat_ru:ShortName">
			<xsl:apply-templates select="cat_ru:ShortName"/>
		</xsl:if>
		<xsl:text>, </xsl:text>
		<xsl:apply-templates select="cat_ru:RFOrganizationFeatures"/>
		<xsl:if test="expas:CertificateNumber">
			<xsl:text>; </xsl:text>
			<xsl:apply-templates select="expas:CertificateNumber"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="cat_ru:RFOrganizationFeatures">
		<xsl:if test="cat_ru:OGRN">
			<span>ОГРН: <xsl:apply-templates select="cat_ru:OGRN"/>
			</span>
		</xsl:if>
		<xsl:if test="cat_ru:INN">
			<span> ИНН: <xsl:apply-templates select="cat_ru:INN"/>
			</span>
		</xsl:if>
		<xsl:if test="cat_ru:KPP">
			<span>	КПП: <xsl:apply-templates select="cat_ru:KPP"/>
			</span>
		</xsl:if>
	</xsl:template>
	<xsl:template match="expas:CertificateNumber">
		<xsl:text> Свидетельство: </xsl:text>
		<xsl:text> № </xsl:text>
		<xsl:apply-templates select="cat_ru:PrDocumentNumber"/>
		<xsl:text> от </xsl:text>
		<xsl:apply-templates select="cat_ru:PrDocumentDate" mode="russian_date"/>
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
		<xsl:param name="dateIn2"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn2,5,1)='-' and substring($dateIn2,8,1)='-'">
				<xsl:value-of select="substring($dateIn2,9,2)"/>
				<xsl:value-of select="substring($dateIn2,6,2)"/>
				<xsl:value-of select="substring($dateIn2,3,2)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dateIn2"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="russian_date_dt">
		<xsl:param name="dateIn3"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn3,5,1)='-' and substring($dateIn3,8,1)='-'">
				<xsl:value-of select="substring($dateIn3,9,2)"/>
				<xsl:value-of select="substring($dateIn3,6,2)"/>
				<xsl:value-of select="substring($dateIn3,3,2)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dateIn3"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="Address">
		<xsl:if test="cat_ru:PostalCode">
			<xsl:value-of select="cat_ru:PostalCode"/>, 
	</xsl:if>
		<xsl:if test="cat_ru:CounryName">
			<xsl:value-of select="cat_ru:CounryName"/>, 
	</xsl:if>
		<xsl:if test="cat_ru:Region">
			<xsl:value-of select="cat_ru:Region"/>, 
	</xsl:if>
		<xsl:if test="cat_ru:City">
			<xsl:value-of select="cat_ru:City"/>, 
	</xsl:if>
		<xsl:if test="cat_ru:StreetHouse">
			<xsl:value-of select="cat_ru:StreetHouse"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="expas:Resident">
		<table align="right" border="0">
			<tbody>
				<tr title="наименование организации / ФИО физического лица">
					<td class="graphNotUnderline" valign="top">В </td>
					<td class="graphUnderline">
						<xsl:value-of select="cat_ru:OrganizationName"/>
						<xsl:if test="cat_ru:Address"> <xsl:apply-templates select="cat_ru:Address"/>
						</xsl:if>
					</td>
				</tr>
				<tr title="Наименование организации / ФИО физического лица">
					<td align="center" class="graphLittle" colspan="2">
						<xsl:choose>
							<xsl:when test="//expas:DocSign='1'">(наименование/адрес резидента портовой особой экономической зоны)</xsl:when>
						</xsl:choose>
					</td>
				</tr>
				<xsl:if test="cat_ru:RFOrganizationFeatures/cat_ru:OGRN">
					<tr title="ОГРН/ОГРНИП">
						<td class="graphUnderline" colspan="2">
							<xsl:value-of select="cat_ru:RFOrganizationFeatures/cat_ru:OGRN"/>
						</td>
					</tr>
					<tr title="ОГРН/ОГРНИП">
						<td align="center" class="graphLittle" colspan="2">ОГРН/ОГРНИП</td>
					</tr>
				</xsl:if>
				<xsl:if test="cat_ru:RFOrganizationFeatures/cat_ru:INN">
					<tr title="ИНН">
						<td class="graphUnderline" colspan="2">
							<xsl:value-of select="cat_ru:RFOrganizationFeatures/cat_ru:INN"/>
						</td>
					</tr>
					<tr title="ИНН">
						<td align="center" class="graphLittle" colspan="2">ИНН</td>
					</tr>
				</xsl:if>
				<xsl:if test="cat_ru:RFOrganizationFeatures/cat_ru:KPP">
					<tr title="КПП">
						<td class="graphUnderline" colspan="2">
							<xsl:value-of select="cat_ru:RFOrganizationFeatures/cat_ru:KPP"/>
						</td>
					</tr>
					<tr title="КПП">
						<td align="center" class="graphLittle" colspan="2">КПП</td>
					</tr>
				</xsl:if>
			</tbody>
		</table>
	</xsl:template>
	<xsl:template match="cat_ru:Address">
		<xsl:if test="cat_ru:CounryName">
			<xsl:value-of select="cat_ru:CounryName"/>
		</xsl:if>
		<xsl:if test="cat_ru:CountryCode">(<xsl:value-of select="cat_ru:CountryCode"/>)</xsl:if>
		<xsl:if test="cat_ru:Region">
			<xsl:if test="cat_ru:CountryCode or cat_ru:CounryName">, </xsl:if>
			<xsl:value-of select="cat_ru:Region"/>
		</xsl:if>
		<xsl:if test="cat_ru:City">
			<xsl:if test="cat_ru:CountryCode or cat_ru:CounryName or cat_ru:Region">, </xsl:if>
			<xsl:value-of select="cat_ru:City"/>
		</xsl:if>
		<xsl:if test="cat_ru:StreetHouse">
			<xsl:if test="cat_ru:CountryCode or cat_ru:CounryName or cat_ru:Region or cat_ru:City">, </xsl:if>
			<xsl:value-of select="cat_ru:StreetHouse"/>
		</xsl:if>
		<xsl:if test="cat_ru:PostalCode">
			<br/>Почтовый индекс: <xsl:value-of select="cat_ru:PostalCode"/>
		</xsl:if>
		<br/>
	</xsl:template>
	<xsl:template match="*" mode="reg_num">
		<xsl:apply-templates select="*[local-name() = 'CustomsCode']"/>
		<xsl:text>/</xsl:text>
		<xsl:apply-templates select="*[local-name() = 'RegistrationDate']" mode="russian_date_gtd"/>
		<xsl:text>/</xsl:text>
		<xsl:apply-templates select="*[local-name() = 'Number']"/>
		<xsl:if test="*[local-name() = 'AddNumber']|*[local-name() = 'DocKind']">
			<xsl:text>/</xsl:text>
			<xsl:apply-templates select="*[local-name() = 'AddNumber']|*[local-name() = 'DocKind']"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="*[local-name() = 'GTDID']">
		<xsl:apply-templates select="*[local-name() = 'CustomsCode']"/>
		<xsl:text>/</xsl:text>
		<xsl:apply-templates select="*[local-name() = 'RegistrationDate']" mode="russian_date_gtd"/>
		<xsl:text>/</xsl:text>
		<xsl:apply-templates select="*[local-name() = 'GTDNumber']"/>
	</xsl:template>
</xsl:stylesheet>
