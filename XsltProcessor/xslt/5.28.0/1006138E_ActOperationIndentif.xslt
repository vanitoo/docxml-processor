<?xml version="1.0" encoding="UTF-8"?>
<!--  -->
<xsl:stylesheet version="1.0" xmlns:aopin="urn:customs.ru:Information:CustomsDocuments:ActOperationIndentif:5.24.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" encoding="utf-8" indent="yes" media-type="text/html" method="html" omit-xml-declaration="yes" version="1.0"/>
	<xsl:template match="/">
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template name="Address">
		<xsl:if test="cat_ru:PostalCode">
			<xsl:apply-templates select="cat_ru:PostalCode"/> 
	</xsl:if>
		<xsl:if test="cat_ru:CounryName">
			<xsl:apply-templates select="cat_ru:CounryName"/> 
	</xsl:if>
		<xsl:if test="cat_ru:Region">
			<xsl:apply-templates select="cat_ru:Region"/> 
	</xsl:if>
		<xsl:if test="cat_ru:City">
			<xsl:apply-templates select="cat_ru:City"/> 
	</xsl:if>
		<xsl:if test="cat_ru:StreetHouse">
			<xsl:apply-templates select="cat_ru:StreetHouse"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="aopin:ActOperationIndentif">
		<html>
			<head>
				<meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
				<title>Акт об изменении, удалении, уничтожении или замене средств идентификации</title>
				<style type="text/css">
				body {
					text-align: center;
					background: #cccccc;
					}
				div.page {
					width: 210mm;
					margin-top: 6pt;
					margin-bottom: 6pt;
					padding:	10mm;
					padding-left:	10mm;
					background: #ffffff;
					border: solid .5pt #000000;
					}						
				td {
					font-family:Arial;
					}
				.normal{
					font-weight: bold;
					font-family:Arial;
					font-size: 10pt; border-left: medium none; border-right: medium none; border-top: medium none; border-bottom: 1pt solid windowtext; 
					}
				.bold{
					font-weight: bold;
					font-family:Arial;
					font-size: 13pt;
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
				.graphMain {
					font-family: Arial;
					font-size: 10pt;
					font-weight: normal;
					}
				.graphLittle {
					font-family: Arial;
					font-size: 7pt;
					}
				.graph14Bold {
					font-family: Arial;
					font-size: 14pt;
					font-weight: bold;
					}				
				.bordered {
					border-bottom: solid 1pt #000000;
					}	
				.uplined {
					border-top: solid 1pt #000000;
					}					
            </style>
			</head>
			<body>
				<div class="page">
					<table>
						<tbody>
							<tr>
								<td align="center" class="bordered">
									<xsl:apply-templates select="aopin:Customs/cat_ru:OfficeName"/>
								</td>
							</tr>
							<tr>
								<td align="center" class="graphLittle">
										(наименование таможенного органа)
									</td>
							</tr>
							<tr>
								<td>
									<br/>
									<br/>
									<span class="graph14Bold">АКТ</span>
									<br/>
									<br/>
								</td>
							</tr>
							<tr>
								<td>
									<b>об изменении, удалении, уничтожении или замене средств идентификации </b>
									<br/>
									<br/>
								</td>
							</tr>
							<tr>
								<td>
									<table style="width:210mm">
										<tr>
											<td align="left" style="width:60mm">
												<xsl:call-template name="date_month_word">
													<xsl:with-param name="date" select="aopin:CreateDate|aopin:ActNumber/cat_ru:RegistrationDate"/>
												</xsl:call-template>
											</td>
											<td style="width:90mm">
												<xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>
												<xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>
												<xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>
												<xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>
												<xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>
												<xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>
											</td>
											<td style="width:60mm">
									№ <span class="bordered">
													<xsl:apply-templates select="aopin:ActNumber"/>
												</span>
											</td>
										</tr>
									</table>
								</td>
							</tr>
							<tr>
								<td>
									<table style="width:210mm">
										<tr>
											<td align="left" style="width:20mm">В связи с</td>
											<td class="bordered" style="width:190mm">
												<xsl:apply-templates select="aopin:DescriptionCircumstances"/>
											</td>
										</tr>
									</table>
								</td>
							</tr>
							<tr>
								<td align="center" class="graphLittle">(краткое описание обстоятельств)</td>
							</tr>
							<tr>
								<td align="left">
							и на основании статьи 341 Таможенного кодекса Евразийского экономического союза со средствами идентификации проведено: 
						</td>
							</tr>
							<tr>
								<td>
									<table style="width:210mm">
										<tbody>
											<tr>
												<xsl:if test="aopin:OperationIndentif='1'">
													<td>[Х] - удаление </td>
													<td>[&#160;] - изменение</td>
													<td>[&#160;] - замена</td>
													<td>[&#160;] - уничтожение</td>
												</xsl:if>
												<xsl:if test="aopin:OperationIndentif='2'">
													<td>[&#160;] - удаление</td>
													<td>[Х] - изменение</td>
													<td>[&#160;] - замена</td>
													<td>[&#160;] - уничтожение</td>
												</xsl:if>
												<xsl:if test="aopin:OperationIndentif='3'">
													<td>[&#160;] - удаление</td>
													<td>[&#160;] - изменение</td>
													<td>[Х] - замена</td>
													<td>[&#160;] - уничтожение</td>
												</xsl:if>
												<xsl:if test="aopin:OperationIndentif='4'">
													<td>[&#160;] - удаление</td>
													<td>[&#160;] - изменение</td>
													<td>[&#160;] - замена</td>
													<td>[Х] - уничтожение</td>
												</xsl:if>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
							<tr>
								<td align="left">Место проведения операций по изменению, удалению, уничтожению или замене средств идентификации:</td>
							</tr>
							<tr>
								<td class="bordered" align="center">
									<xsl:apply-templates select="aopin:OperationPlace"/> 
							<!--xsl:if test="aopin:OperationPlace/cat_ru:OfficeName">
										<xsl:apply-templates select="aopin:OperationPlace/cat_ru:OfficeName"/> </xsl:if>
									<xsl:if test="aopin:OperationPlace/aopin:InformationTypeCode">
										<xsl:apply-templates select="aopin:OperationPlace/aopin:InformationTypeCode"/> </xsl:if>
									<xsl:if test="aopin:OperationPlace/aopin:InspPlaceDesc">&#160;
                              <xsl:for-each select="aopin:OperationPlace/aopin:InspPlaceDesc">
											<xsl:apply-templates select="."/> </xsl:for-each>
									</xsl:if>
									<xsl:if test="aopin:OperationPlace/aopin:WarehousePlace">&#160;
                              <xsl:apply-templates select="aopin:OperationPlace/aopin:WarehousePlace/cat_ru:PrDocumentName"/> 
								№ <xsl:apply-templates select="aopin:OperationPlace/aopin:WarehousePlace/cat_ru:PrDocumentNumber"/> 
								&#160;от 
								<xsl:apply-templates mode="russian_date" select="aopin:OperationPlace/aopin:WarehousePlace/cat_ru:PrDocumentDate"/>
						   </xsl:if>
									<xsl:if test="aopin:OperationPlace/aopin:Address">&#160;
                              <xsl:for-each select="aopin:OperationPlace/aopin:Address">
											<xsl:call-template name="Address"/> </xsl:for-each>
									</xsl:if-->
								</td>
							</tr>
							<tr>
								<td align="left">Номера транспортных средств и контейнеров, на которых удалены или изменены средства идентификации</td>
							</tr>
							<tr>
								<td class="bordered">
									<xsl:if test="aopin:TransportIdentifier">
										<xsl:text>Транспортные средства: </xsl:text>
										<xsl:for-each select="aopin:TransportIdentifier">
											<xsl:if test="position()!=1">; </xsl:if>
											<xsl:apply-templates select="aopin:TransportIdentifier"/>
											<xsl:if test="aopin:FirstTrailerRegId or aopin:SecondTrailerRegId">
												<xsl:text>, прицеп(ы): </xsl:text>
												<xsl:for-each select="*[local-name() = 'FirstTrailerRegId' or local-name() = 'SecondTrailerRegId']">
													<xsl:if test="position() != 1">, </xsl:if>
													<xsl:apply-templates select="."/>
												</xsl:for-each>
											</xsl:if>
										</xsl:for-each>
									</xsl:if>
									<xsl:if test="aopin:ContainerIdentity">
										<xsl:text> Контейнеры: </xsl:text>
										<xsl:for-each select="aopin:ContainerIdentity">
											<xsl:if test="position()!=1">, </xsl:if>
											<xsl:apply-templates select="."/>
										</xsl:for-each>
									</xsl:if>
								</td>
							</tr>
							<tr>
								<td align="left">Описание измененных, удаленых, уничтоженных или заменены средств идентификации:
								</td>
							</tr>
							<tr>
								<td class="bordered">
									<xsl:for-each select="aopin:DescriptionIdentif[aopin:IdentMeanState=1]">
										<xsl:if test="position()!=1">;</xsl:if>
										<xsl:apply-templates select="."/>
									</xsl:for-each>
									<xsl:if test="count(aopin:DescriptionIdentif[aopin:IdentMeanState=1]) > 0">
										<xsl:text>; количество: </xsl:text>
										<xsl:value-of select="count(aopin:DescriptionIdentif[aopin:IdentMeanState=1])"/>
									</xsl:if>
								</td>
							</tr>
							<tr>
								<td class="graphLittle">
							(номера пломб, печатей, их количество, буквенная или иная маркировка, идентификационные знаки и т.п.)
						</td>
							</tr>
							<tr>
								<td align="left">Описание новых средств идентификации:</td>
							</tr>
							<tr>
								<td class="bordered">
									<xsl:for-each select="aopin:DescriptionIdentif[aopin:IdentMeanState=2]">
										<xsl:if test="position()!=1">;</xsl:if>
										<xsl:apply-templates select="."/>
									</xsl:for-each>
									<xsl:if test="count(aopin:DescriptionIdentif[aopin:IdentMeanState=2]) > 0">
										<xsl:text>; количество: </xsl:text>
										<xsl:value-of select="count(aopin:DescriptionIdentif[aopin:IdentMeanState=2])"/>
									</xsl:if>
								</td>
							</tr>
							<tr>
								<td class="graphLittle">
							(номера пломб, печатей, их количество, буквенная или иная маркировка, идентификационные знаки и т.п.)
						</td>
							</tr>
							<tr>
								<td align="left"> Должностное лицо таможенного органа:</td>
							</tr>
							<tr>
								<td class="bordered">
									<xsl:apply-templates select="aopin:CustomsPerson/aopin:PersonPost"/>
									<xsl:text> </xsl:text> 
									<xsl:apply-templates select="aopin:CustomsPerson/cat_ru:PersonName"/>
									<xsl:text> </xsl:text> 
									<xsl:apply-templates select="aopin:CustomsPerson/cat_ru:LNP"/> 
									<!--xsl:apply-templates select="aopin:CustomsPerson/aopin:PersonPost"/-->
								</td>
							</tr>
							<tr>
								<td class="graphLittle">
							(подпись, должность, фамилия, инициалы, личная номерная печать)
						</td>
							</tr>
							<tr>
								<td align="left"> Лицо, обладающее полномочиями в отношении товаров (представитель лица):</td>
							</tr>
							<tr>
								<td class="bordered">
									<xsl:apply-templates select="aopin:PersonGoods" mode="JobPostFIO"/>
								</td>
							</tr>
							<tr>
								<td class="graphLittle">
							(подпись, место работы, должность, фамилия, инициалы)
						</td>
							</tr>
							<xsl:variable name="xpath_IssueDate">
								<xsl:call-template name="get_xpath">
									<xsl:with-param name="node" select="aopin:PersonGoods/cat_ru:IssueDate"/>
								</xsl:call-template>
							</xsl:variable>
							<tr>
								<td align="left" style="width:60mm">
							&lt;&lt;<span class="bordered">
									<element xml_node="{$xpath_IssueDate}">
										<xsl:value-of select="substring(aopin:PersonGoods/cat_ru:IssueDate,9,2)"/>
									</element>
									</span>&gt;&gt;
						   <span class="bordered">
									<element xml_node="{$xpath_IssueDate}">
										<xsl:choose>
											<xsl:when test="substring(aopin:PersonGoods/cat_ru:IssueDate,6,2)='01'">января</xsl:when>
											<xsl:when test="substring(aopin:PersonGoods/cat_ru:IssueDate,6,2)='02'">февраля</xsl:when>
											<xsl:when test="substring(aopin:PersonGoods/cat_ru:IssueDate,6,2)='03'">марта</xsl:when>
											<xsl:when test="substring(aopin:PersonGoods/cat_ru:IssueDate,6,2)='04'">апреля</xsl:when>
											<xsl:when test="substring(aopin:PersonGoods/cat_ru:IssueDate,6,2)='05'">мая</xsl:when>
											<xsl:when test="substring(aopin:PersonGoods/cat_ru:IssueDate,6,2)='06'">июня</xsl:when>
											<xsl:when test="substring(aopin:PersonGoods/cat_ru:IssueDate,6,2)='07'">июля</xsl:when>
											<xsl:when test="substring(aopin:PersonGoods/cat_ru:IssueDate,6,2)='08'">августа</xsl:when>
											<xsl:when test="substring(aopin:PersonGoods/cat_ru:IssueDate,6,2)='09'">сентября</xsl:when>
											<xsl:when test="substring(aopin:PersonGoods/cat_ru:IssueDate,6,2)='10'">октября</xsl:when>
											<xsl:when test="substring(aopin:PersonGoods/cat_ru:IssueDate,6,2)='11'">ноября</xsl:when>
											<xsl:when test="substring(aopin:PersonGoods/cat_ru:IssueDate,6,2)='12'">декабря</xsl:when>
										</xsl:choose> 
									</element>
						   </span>
								<element xml_node="{$xpath_IssueDate}">
									<xsl:value-of select="substring(aopin:PersonGoods/cat_ru:IssueDate,1,4)"/>
								</element>
								</td>
							</tr>
							<tr>
								<td align="left" class="graphLittle">Дата применения средств(а) идентификации</td>
							</tr>
							<tr>
								<td align="left"> Второй экземпляр акта на руки получил:</td>
							</tr>
							<tr>
								<td class="bordered">
									<xsl:apply-templates select="aopin:SecondCopyReceived" mode="JobPostFIO"/>
								</td>
							</tr>
							<tr>
								<td class="graphLittle">
							(подпись, место работы, должность, фамилия, инициалы лица, которому вручен второй экземпляр акта)
						</td>
							</tr>
							<xsl:variable name="xpath_SecondCopyIssueDate">
								<xsl:call-template name="get_xpath">
									<xsl:with-param name="node" select="aopin:SecondCopyReceived/cat_ru:IssueDate"/>
								</xsl:call-template>
							</xsl:variable>
							<tr>
								<td align="left" style="width:60mm">
							&lt;&lt;<span class="bordered">
									<element xml_node="{$xpath_SecondCopyIssueDate}">
										<xsl:value-of select="substring(aopin:SecondCopyReceived/cat_ru:IssueDate,9,2)"/>
									</element>
									</span>&gt;&gt;
							<span class="bordered">
									<element xml_node="{$xpath_SecondCopyIssueDate}">
										<xsl:choose>
											<xsl:when test="substring(aopin:SecondCopyReceived/cat_ru:IssueDate,6,2)='01'">января</xsl:when>
											<xsl:when test="substring(aopin:SecondCopyReceived/cat_ru:IssueDate,6,2)='02'">февраля</xsl:when>
											<xsl:when test="substring(aopin:SecondCopyReceived/cat_ru:IssueDate,6,2)='03'">марта</xsl:when>
											<xsl:when test="substring(aopin:SecondCopyReceived/cat_ru:IssueDate,6,2)='04'">апреля</xsl:when>
											<xsl:when test="substring(aopin:SecondCopyReceived/cat_ru:IssueDate,6,2)='05'">мая</xsl:when>
											<xsl:when test="substring(aopin:SecondCopyReceived/cat_ru:IssueDate,6,2)='06'">июня</xsl:when>
											<xsl:when test="substring(aopin:SecondCopyReceived/cat_ru:IssueDate,6,2)='07'">июля</xsl:when>
											<xsl:when test="substring(aopin:SecondCopyReceived/cat_ru:IssueDate,6,2)='08'">августа</xsl:when>
											<xsl:when test="substring(aopin:SecondCopyReceived/cat_ru:IssueDate,6,2)='09'">сентября</xsl:when>
											<xsl:when test="substring(aopin:SecondCopyReceived/cat_ru:IssueDate,6,2)='10'">октября</xsl:when>
											<xsl:when test="substring(aopin:SecondCopyReceived/cat_ru:IssueDate,6,2)='11'">ноября</xsl:when>
											<xsl:when test="substring(aopin:SecondCopyReceived/cat_ru:IssueDate,6,2)='12'">декабря</xsl:when>
										</xsl:choose> 
									</element>
							</span>
									<element xml_node="{$xpath_SecondCopyIssueDate}">
										<xsl:value-of select="substring(aopin:SecondCopyReceived/cat_ru:IssueDate,1,4)"/>
									</element>
								</td>
							</tr>
							<tr>
								<td align="left" class="graphLittle">Дата получения второго экземпляра</td>
							</tr>
						</tbody>
					</table>
				</div>
			</body>
		</html>
	</xsl:template>
	
	<xsl:template name="date_month_word">
		<xsl:param name="date"/>
		<xsl:variable name="xpath_ActDate">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="$date"/>
			</xsl:call-template>
		</xsl:variable>
		<xsl:text>"</xsl:text>
		<span class="bordered" style="width: 5mm; display: inline-block;">
			<element xml_node="{$xpath_ActDate}">
				<xsl:value-of select="substring($date,9,2)"/>
			</element>
		</span>
		<xsl:text>" </xsl:text>
		<span class="bordered" style="width: 30mm; display: inline-block; text-align: center;">
			<element xml_node="{$xpath_ActDate}">
				<xsl:choose>
					<xsl:when test="substring($date,6,2)='01'">января</xsl:when>
					<xsl:when test="substring($date,6,2)='02'">февраля</xsl:when>
					<xsl:when test="substring($date,6,2)='03'">марта</xsl:when>
					<xsl:when test="substring($date,6,2)='04'">апреля</xsl:when>
					<xsl:when test="substring($date,6,2)='05'">мая</xsl:when>
					<xsl:when test="substring($date,6,2)='06'">июня</xsl:when>
					<xsl:when test="substring($date,6,2)='07'">июля</xsl:when>
					<xsl:when test="substring($date,6,2)='08'">августа</xsl:when>
					<xsl:when test="substring($date,6,2)='09'">сентября</xsl:when>
					<xsl:when test="substring($date,6,2)='10'">октября</xsl:when>
					<xsl:when test="substring($date,6,2)='11'">ноября</xsl:when>
					<xsl:when test="substring($date,6,2)='12'">декабря</xsl:when>
				</xsl:choose> 
			</element>
		</span>
		<xsl:text> 20</xsl:text>
		<span class="bordered" style="width: 5mm; display: inline-block;">
			<element xml_node="{$xpath_ActDate}">
				<xsl:value-of select="substring($date,3,2)"/>
			</element>
		</span>
		<xsl:text> г.</xsl:text>
	</xsl:template>
	
	<xsl:template match="aopin:OperationPlace">
		<xsl:text>код ТО </xsl:text><xsl:apply-templates select="cat_ru:Code"/><xsl:text> </xsl:text><xsl:apply-templates select="cat_ru:OfficeName"/>
		<xsl:if test="aopin:Address">
			<xsl:text> </xsl:text>
			<xsl:apply-templates select="aopin:Address"/>
		</xsl:if>
		<xsl:if test="aopin:InspPlaceName">
			<xsl:text> </xsl:text>
			<xsl:apply-templates select="aopin:InspPlaceName"/>
		</xsl:if>
		<xsl:if test="aopin:InformationTypeCode">
			<xsl:text> </xsl:text>
			<xsl:choose>
				<xsl:when test="aopin:InformationTypeCode=11">Склад временного хранения</xsl:when>
				<xsl:when test="aopin:InformationTypeCode=21">Таможенный склад</xsl:when>
				<xsl:when test="aopin:InformationTypeCode=22">Магазин беспошлинной торговли</xsl:when>
				<xsl:when test="aopin:InformationTypeCode=25">Свободный склад</xsl:when>
				<xsl:when test="aopin:InformationTypeCode=31">Склад получателя</xsl:when>
				<xsl:when test="aopin:InformationTypeCode=41">Склад хранения собственных товаров</xsl:when>
				<xsl:when test="aopin:InformationTypeCode=52">Транспортное средство</xsl:when>
				<xsl:when test="aopin:InformationTypeCode=60">Помещение, открытая площадка и иная территория уполномоченного экономического оператора</xsl:when>
				<xsl:when test="aopin:InformationTypeCode=72">ЗТК</xsl:when>
				<xsl:when test="aopin:InformationTypeCode=80">Свободная (специальная, особая) экономическая зона</xsl:when>
				<xsl:when test="aopin:InformationTypeCode=91">Адрес места хранения</xsl:when>
				<xsl:when test="aopin:InformationTypeCode=92">Склад таможенного органа</xsl:when>
				<xsl:when test="aopin:InformationTypeCode=93">Отдельные помещения в местах международного почтового обмена</xsl:when>
				<xsl:when test="aopin:InformationTypeCode=94">Место хранения неполученного или невостребованного багажа, перемещаемого в рамках договора авиационной или железнодорожной перевозки пассажира</xsl:when>
				<xsl:when test="aopin:InformationTypeCode=95">Место разгрузки и перегрузки (перевалки) товаров в пределах территории морского (речного) порта</xsl:when>
				<xsl:when test="aopin:InformationTypeCode=96">Специально оборудованное место разгрузки и перегрузки (перевалки) иностранных товаров в пределах режимной территории аэропорта при условии, что место ввоза таких товаров в Российскую Федерацию и место их вывоза из Российской Федерации совпадают</xsl:when>
				<xsl:when test="aopin:InformationTypeCode=97">Железнодорожные пути и контейнерные площадки, расположенные в согласованных с таможенными органами местах в пределах железнодорожных станций и предназначенные для временного хранения товаров без их выгрузки из транспортных средств</xsl:when>
				<xsl:when test="aopin:InformationTypeCode=99">Иное место нахождения товаров</xsl:when>
				<xsl:otherwise>
					<xsl:apply-templates select="aopin:InformationTypeCode"/>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:text> </xsl:text>
		</xsl:if>
		
		<!--xsl:if test="aopin:WarehousePlace">
			<xsl:text> </xsl:text>
			<xsl:choose>
				<xsl:when test="aopin:WarehousePlace/aopin:DocumentModeCode=1">лицензия</xsl:when>
				<xsl:when test="aopin:WarehousePlace/aopin:DocumentModeCode=2">свидетельство</xsl:when>
			</xsl:choose>
			<xsl:text> № </xsl:text> 
			<xsl:apply-templates select="aopin:WarehousePlace/cat_ru:PrDocumentNumber"/>
			<xsl:if test="aopin:WarehousePlace/cat_ru:PrDocumentDate">
				<xsl:text> от </xsl:text>
				<xsl:apply-templates mode="russian_date" select="aopin:WarehousePlace/cat_ru:PrDocumentDate"/>
			</xsl:if>
		</xsl:if-->
	</xsl:template>
	<xsl:template match="aopin:Address">
		<xsl:for-each select="*[local-name() != 'PostalCode']">
			<xsl:apply-templates select="."/>
			<xsl:if test="position()!=last()">
				<xsl:text>, </xsl:text>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>
	
	
	<xsl:template match="*" mode="JobPostFIO"><!-- формат: работа, пост, Фамилия И.О. -->
		<xsl:if test="*[local-name() = 'Job']">
			<xsl:apply-templates select="*[local-name() = 'Job']"/>
			<xsl:text>, </xsl:text>
		</xsl:if>
		<xsl:if test="*[local-name() = 'PersonPost']">
			<xsl:apply-templates select="*[local-name() = 'PersonPost']"/>
			<xsl:text>, </xsl:text>
		</xsl:if>
		<xsl:apply-templates select="*[local-name() = 'PersonSurname']"/>
		<xsl:text> </xsl:text>
		<xsl:apply-templates select="*[local-name() = 'PersonName']" mode="initials"/>
		<xsl:apply-templates select="*[local-name() = 'PersonMiddleName']" mode="initials"/>
	</xsl:template>
	
	<xsl:template match="aopin:ActNumber">
		<xsl:apply-templates select="cat_ru:CustomsCode"/>
		<xsl:text>/</xsl:text>
		<xsl:apply-templates select="cat_ru:RegistrationDate" mode="russian_date_gtd"/>
		<xsl:text>/</xsl:text>
		<xsl:apply-templates select="cat_ru:SerialNumber"/>
	</xsl:template>
	
	<xsl:template match="aopin:DescriptionIdentif">
		<xsl:apply-templates select="aopin:IdentNumber"/>
		<xsl:text> </xsl:text>
		<xsl:variable name="xpath_IdentBreakFlag">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="aopin:IdentBreakFlag"/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_IdentBreakFlag}">
			<xsl:choose>
				<xsl:when test="aopin:IdentBreakFlag = 0 or aopin:IdentBreakFlag='false'">не нарушено</xsl:when>
				<xsl:otherwise>нарушено</xsl:otherwise>
			</xsl:choose>
		</element>
		<xsl:text> </xsl:text>
		<xsl:variable name="xpath_IdentKind">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="aopin:IdentKind"/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_IdentKind}">
			<xsl:choose>
				<xsl:when test="aopin:IdentKind=1">пломба</xsl:when>
				<xsl:when test="aopin:IdentKind=2">печать</xsl:when>
				<xsl:when test="aopin:IdentKind=3">иное</xsl:when>
			</xsl:choose>
		</element>
		<xsl:text> </xsl:text>
		<xsl:apply-templates select="aopin:IdentDesc"/>
	</xsl:template>
	
	<xsl:template match="*" mode="initials">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:value-of select="translate(substring(., 1, 1), 'abcdefghijklmnopqrstuvwxyzабвгдеёжзийклмнопрстуфхцчшщъыьэюя', 'ABCDEFGHIJKLMNOPQRSTUVWXYZАБВГДЕЁЖЗИЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯ')"/>
			<xsl:text>.</xsl:text>
		</element>
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
	<xsl:template match="//*[local-name()='ActOperationIndentif']//*" priority="-1">
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
