<?xml version="1.0" encoding="utf-8"?>
<!--Приказ Министерства финансов Российской Федерации от 23 октября 2020 г. N 245н "Об установлении случая, при котором товары, помещенные под таможенную процедуру свободного склада, могут размещаться и находиться на территориях нескольких свободных складов, владельцем которых является юридическое лицо, являющееся
декларантом товаров, помещенных под таможенную процедуру свободного склада, перемещения таких товаров и товаров, изготовленных (полученных) из товаров, помещенных под таможенную процедуру свободного склада, между такими складами, а также об установлении особенностей совершения таможенных операций и проведения таможенного
контроля в отношении таких товаров"
 Приложение N 1 - Заявление о перемещении товаров-->
<xsl:stylesheet version="1.0" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.24.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" xmlns:catESAD_cu="urn:customs.ru:CUESADCommonAggregateTypesCust:5.28.0" xmlns:amfwhg="urn:customs.ru:Information:CustomsDocuments:AppMoveFreeWHGoods:5.28.0" xmlns:catProc_ru="urn:customs.ru:Information:ProcessingDocuments:ProcessingCommonAggregateTypes:5.28.0">
	<!-- Шаблон для типа AppMoveFreeWHGoodsType -->
	<xsl:template match="//*[local-name()='amfwhg:AppMoveFreeWHGoods']//*" priority="-1">
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
	<xsl:template match="amfwhg:AppMoveFreeWHGoods">
		<html>
			<head>
				<style>
                  body {
                  background: #cccccc;
                  font-family: Arial;
                  }

                  div
                  {
                  white-space: normal;
                  }

					div.page {
					width: 180mm;
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
                  vertical-align:bottom;
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

					.graphLittle 
					{
					font-family: Arial;
					font-size: 7pt;
					text-align: center;
					}

                  .bordered { border-collapse: collapse; }
                  td.bordered
                  {
                  border: solid 1px windowtext;
                  font-size: 11pt;
                  }
                  

				.delim_3 {
				height: 3pt;
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
					<table width="100%">
						<tbody>
							<tr>
								<td class="delim_3">
									<br/>
								</td>
							</tr>
							<tr>
								<td>
									<table width="100%">
										<tbody>
											<tr>
												<td align="right" valign="bottom" width="45%">В В ФТС России</td>
												<td align="center" width="55%" class="value">
													<xsl:apply-templates select="amfwhg:Customs" mode="CustomsOffice"/>
												</td>
											</tr>
											<tr>
												<td/>
												<td valign="top" class="graphLittle">
												
												</td>
											</tr>
											<tr>
												<td align="right" valign="bottom">от </td>
												<td align="center" class="value">
													<xsl:apply-templates mode="organization" select="amfwhg:Applicant"/>
												</td>
											</tr>
											<tr>
												<td/>
												<td class="graphLittle">
													<xsl:text>(наименование юридического лица, являющегося владельцем свободного склада)</xsl:text>
												</td>
											</tr>
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
							<tr>
								<td align="center" class="title">
									<font size="4">
										<b>
											<xsl:text>ЗАЯВЛЕНИЕ</xsl:text>
											<br/>
											<xsl:text>о перемещении товаров, помещенных под таможенную процедуру свободного склада, и товаров, изготовленных (полученных) из товаров, помещенных под таможенную процедуру свободного склада, между двумя или более свободными складами  </xsl:text>
										</b>
									</font>
								</td>
							</tr>
							<tr>
								<td>
									<br/>
									<br/>
								</td>
							</tr>
							<tr>
								<td style="text-align: justify">
									<xsl:text>Прошу разрешить перемещение товаров, помещенных под таможенную процедуру свободного склада, и (или) товаров, изготовленных (полученных) из товаров, помещенных под таможенную процедуру свободного склада (далее - Товары), в связи с чем сообщаю следующие сведения:</xsl:text>
								</td>
							</tr>
							<tr>
								<td class="delim_3">
									<br/>
								</td>
							</tr>
							<tr>
								<td>
									<table width="100%">
										<tbody>
											<tr>
												<td width="3%" class="bordered">1.</td>
												<td width="50%" class="bordered">О свободных складах, между которыми планируется перемещение Товаров (указываются номера свидетельств о включении в реестр владельцев свободных складов);</td>
												<td width="47%" class="bordered">
													<xsl:for-each select="amfwhg:FreeWH">
														<xsl:apply-templates select="amfwhg:FreeWHName"/>
														<xsl:text> </xsl:text>
														<xsl:apply-templates mode="ru_address" select="amfwhg:FreeWHAddress"/> свидетельство № <xsl:apply-templates select="amfwhg:CertifFreeWH" mode="Certificate"/>
														<xsl:if test="position()!=last()">, </xsl:if>
														<br/>
													</xsl:for-each>
												</td>
											</tr>
											<tr>
												<td class="bordered">2.</td>
												<td class="bordered">О Товарах, планируемых к перемещению между свободными складами (указывается общая информация о категориях товаров, планируемых к перемещению между свободными складами. Если со свободного склада вывозятся товары, изготовленные (полученные) из товаров, помещенных под таможенную процедуру свободного склада, то информация о таких товарах представляется дополнительно в соответствии с таблицей N 1); </td>
												<td class="bordered">
													<xsl:for-each select="amfwhg:GoodsInfo">
														<xsl:for-each select="amfwhg:CategoryGoods">
															<xsl:apply-templates select="."/>
														</xsl:for-each>
														<xsl:if test="position()!=last()">, </xsl:if>
													</xsl:for-each>
												</td>
											</tr>
											<tr>
												<td class="bordered">3.</td>
												<td class="bordered">Обоснование необходимости их перемещения между свободными складами
(указываются цель перемещения Товаров между свободными складами, а также если перемещение Товаров связано с производством продукции на свободных складах, - краткие сведения о производственном (технологическом) процессе с указанием свободного склада, на территории которого будут совершаться соответствующие операции с Товарами, предусмотренные статьей 213 ТК ЕАЭС). </td>
												<td class="bordered">
													<xsl:for-each select="amfwhg:MovementReason">
														<xsl:apply-templates select="."/>
													</xsl:for-each>
												</td>
											</tr>
											<tr>
												<td class="bordered">4.</td>
												<td class="bordered">Вид транспортного(ых) средства(в), на котором(ых) предполагается осуществлять транспортировку Товаров, и предполагаемый маршрут его (их) следования </td>
												<td class="bordered">
													<xsl:for-each select="amfwhg:RouteInfo">
														<xsl:apply-templates select="amfwhg:TransporKind"/>
														<xsl:if test="amfwhg:TransportName"> (<xsl:apply-templates select="amfwhg:TransportName"/>) </xsl:if>
														<xsl:apply-templates select="amfwhg:TransportNumber"/>
														<xsl:text> </xsl:text>
														<xsl:apply-templates select="amfwhg:TransportMeansNationalityCode"/>
														<xsl:for-each select="amfwhg:Route">
															<xsl:text>, </xsl:text>
															<xsl:apply-templates select="amfwhg:TransitPointNumber"/>
															<xsl:text>.</xsl:text>
															<xsl:apply-templates select="amfwhg:TransitRoutePlace"/>
														</xsl:for-each>
														<xsl:if test="position()!=last()">
															<xsl:text>, </xsl:text>
														</xsl:if>
													</xsl:for-each>
												</td>
											</tr>
											<tr>
												<td class="bordered">5.</td>
												<td class="bordered">Обязательство о размещении перемещаемых Товаров на территории свободного склада в срок, не превышающий 60 календарных дней со дня, следующего за днем вывоза Товаров с территории свободного склада, на котором Товары ранее находились или иной срок, необходимый для транспортировки размещения Товаров на свободном складе, и его обоснование </td>
												<td class="bordered">
													<xsl:for-each select="amfwhg:OblifationTerm/amfwhg:ObligationGoods">
														<xsl:choose>
															<xsl:when test="amfwhg:ObligationSign='true' or amfwhg:ObligationSign='1'">принято обязательство о размещении перемещаемых Товаров на территорию свободного склада в срок, не превышающий 60 календарных дней со дня, следующего за днем вывоза Товаров с территории свободного склада</xsl:when>
															<xsl:when test="amfwhg:ObligationSign='false' or amfwhg:ObligationSign='0'">обязательство о размещении перемещаемых Товаров на территорию свободного склада в срок, не превышающий 60 календарных дней со дня, следующего за днем вывоза Товаров с территории свободного склада не принято</xsl:when>
														</xsl:choose>
														<xsl:if test="amfwhg:ObligationDoc"> (<xsl:apply-templates mode="doc_base" select="amfwhg:ObligationDoc"/>)</xsl:if>
													</xsl:for-each>
													<xsl:for-each select="amfwhg:OblifationTerm/amfwhg:ChangeTerm">
														<xsl:apply-templates mode="russian_date" select="amfwhg:DiffTerm"/>
														<xsl:text> </xsl:text>
														<xsl:for-each select="amfwhg:Reason">
															<xsl:apply-templates select="."/>
														</xsl:for-each>
													</xsl:for-each>
												</td>
											</tr>
											<tr>
												<td class="bordered">6.</td>
												<td class="bordered">Сведения о наличии единой автоматизированной информационной системы учета Товаров, используемой владельцем свободного склада для учета Товаров, находящихся и используемых на свободных складах, между которыми осуществляется перемещение Товаров  </td>
												<td class="bordered">
													<xsl:choose>
														<xsl:when test="amfwhg:AccountSystemSign='true' or amfwhg:AccountSystemSign='1'">Да </xsl:when>
														<xsl:when test="amfwhg:AccountSystemSign='false' or amfwhg:AccountSystemSign='0'">Нет </xsl:when>
													</xsl:choose>
													<xsl:for-each select="amfwhg:AccountSystemInfo">
														<xsl:apply-templates select="."/>
													</xsl:for-each>
												</td>
											</tr>
											<tr>
												<td class="bordered">7.</td>
												<td class="bordered">Опись документов. Графа заполняется, если владельцем свободного склада одновременно с Заявлением представляются документы, подтверждающие заявленные в Заявлении сведения.  </td>
												<td class="bordered">
													<xsl:for-each select="amfwhg:PresentedDocs">
														<xsl:apply-templates select="." mode="doc_base"/>
														<xsl:if test="position()!=last()">
															<xsl:text>, </xsl:text>
														</xsl:if>
														<br/>
													</xsl:for-each>
												</td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
							<tr>
								<td class="delim_3">
									<br/>
									<br/>
								</td>
							</tr>
							<tr>
								<td>
									<table>
										<tbody>
											<tr valign="bottom">
												<td class="value" width="25%">
													<xsl:apply-templates select="amfwhg:Applicant/cat_ru:OrganizationName"/>
												</td>
												<td width="15%"/>
												<td class="value" width="15%"/>
												<td width="15%"/>
												<td class="value" width="30%">
													<xsl:apply-templates mode="PersonBase" select="amfwhg:ApproverPerson"/>
												</td>
											</tr>
											<tr>
												<td class="graphLittle">(владелец свободного склада или лицо, действующее по его поручению (Заявитель) </td>
												<td/>
												<td valign="top" class="graphLittle">(подпись)</td>
												<td/>
												<td class="graphLittle">(фамилия, имя, отчество (последнее - при наличии) </td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
							<tr>
								<td class="delim_3">
									<br/>
									<br/>
								</td>
							</tr>
							<tr>
								<td style="text-align: justify">
									<xsl:text>Таблица N 1. Товары, изготовленные (полученные) с использованием товаров, помещенных под таможенную процедуру свободного склада, и товаров Евразийского экономического союза, не помещенных под таможенную процедуру свободного склада</xsl:text>
								</td>
							</tr>
							<tr>
								<td class="delim_3">
									<br/>
								</td>
							</tr>
							<tr>
								<td style="text-align: justify">
									<xsl:text>Товары, изготовленные (полученные) с использованием товаров, помещенных под таможенную процедуру свободного склада</xsl:text>
								</td>
							</tr>
							<tr>
								<td class="delim_3"/>
							</tr>
							<tr>
								<td>
									<table class="graphMain" width="100%">
										<tbody>
											<tr>
												<td width="5%"/>
												<td width="45%"/>
												<td width="25%"/>
												<td width="25%"/>
											</tr>
											<tr>
												<td class="bordered" align="center">N п/п </td>
												<td class="bordered" align="center">Наименование товара </td>
												<td class="bordered" align="center">Код товара по ТН ВЭД ЕАЭС </td>
												<td class="bordered" align="center">Статус товара </td>
											</tr>
											<tr>
												<td class="bordered" align="center">1</td>
												<td class="bordered" align="center">2</td>
												<td class="bordered" align="center">3</td>
												<td class="bordered" align="center">4</td>
											</tr>
											<xsl:for-each select="amfwhg:GoodsInfo/amfwhg:ProducedGoods">
												<xsl:variable select="position()" name="goodsNum"/>
												<tr>
													<td class="bordered" align="center" colspan="4">
														<xsl:value-of select="$goodsNum"/>. Товары, изготовленные (полученные) с использованием товаров, помещенных под таможенную процедуру свободного склада </td>
												</tr>
												<tr>
													<td class="bordered">
														<xsl:apply-templates select="amfwhg:GoodsNumeric"/>
													</td>
													<td class="bordered">
														<xsl:for-each select="amfwhg:GoodsDescription">
															<xsl:apply-templates select="."/>
														</xsl:for-each>
													</td>
													<td class="bordered">
														<xsl:apply-templates select="amfwhg:TNVEDCode"/>
													</td>
													<td class="bordered">
														<xsl:apply-templates select="amfwhg:GoodsStatus"/>
													</td>
												</tr>
												<tr>
													<td colspan="4" class="bordered" align="left">
														<xsl:value-of select="$goodsNum"/>.1. товары, помещенные под таможенную процедуру свободного склада, использованные при изготовлении (получении) товаров </td>
												</tr>
												<xsl:for-each select="amfwhg:UsedGoods/amfwhg:PlacedGoods">
													<tr>
														<td class="bordered">
															<xsl:value-of select="$goodsNum"/>.1.<xsl:value-of select="position()"/>
														</td>
														<td class="bordered">
															<xsl:for-each select="amfwhg:GoodsDescription">
																<xsl:apply-templates select="."/>
															</xsl:for-each>
														</td>
														<td class="bordered">
															<xsl:apply-templates select="amfwhg:TNVEDCode"/>
														</td>
														<td class="bordered">
															<xsl:apply-templates select="amfwhg:GoodsStatus"/>
														</td>
													</tr>
												</xsl:for-each>
												<tr>
													<td colspan="4" class="bordered" align="left">
														<xsl:value-of select="$goodsNum"/>.2.  товары Евразийского экономического союза, не помещенные под таможенную процедуру свободного склада, использованные при изготовлении (получении) товаров </td>
												</tr>
												<xsl:for-each select="amfwhg:UsedGoods/amfwhg:EEUGoods">
													<tr>
														<td class="bordered">
															<xsl:value-of select="$goodsNum"/>.2.<xsl:value-of select="position()"/>
														</td>
														<td class="bordered">
															<xsl:for-each select="amfwhg:GoodsDescription">
																<xsl:apply-templates select="."/>
															</xsl:for-each>
														</td>
														<td class="bordered">
															<xsl:apply-templates select="amfwhg:TNVEDCode"/>
														</td>
														<td class="bordered">
															<xsl:apply-templates select="amfwhg:GoodsStatus"/>
														</td>
													</tr>
												</xsl:for-each>
											</xsl:for-each>
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
	<xsl:template match="*" mode="gtd_date">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:call-template name="gtd_date">
				<xsl:with-param name="dateIn" select="."/>
			</xsl:call-template>
		</element>
	</xsl:template>
	<xsl:template name="gtd_date">
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
	<xsl:template match="*" mode="decl">
		<xsl:apply-templates select="cat_ru:CustomsCode"/>
		<xsl:text>/</xsl:text>
		<xsl:apply-templates select="cat_ru:RegistrationDate" mode="gtd_date"/>
		<xsl:text>/</xsl:text>
		<xsl:apply-templates select="cat_ru:GTDNumber"/>
	</xsl:template>
	<xsl:template match="*" mode="doc_base">
		<xsl:apply-templates select="cat_ru:PrDocumentName"/>
		<xsl:if test="cat_ru:PrDocumentNumber">
			<xsl:text> №  </xsl:text>
			<xsl:apply-templates select="cat_ru:PrDocumentNumber"/>
		</xsl:if>
		<xsl:if test="cat_ru:PrDocumentDate">
			<xsl:text> от </xsl:text>
			<xsl:call-template name="russian_date">
				<xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
			</xsl:call-template>
		</xsl:if>
		<xsl:if test="catProc_ru:CustomsDocumentCode"> (<xsl:apply-templates select="catProc_ru:CustomsDocumentCode"/>)</xsl:if>
	</xsl:template>
	<xsl:template mode="goods_group" match="*">
		<xsl:if test="catESAD_cu:Manufacturer">
			<xsl:text> Производитель </xsl:text>
			<xsl:apply-templates select="catESAD_cu:Manufacturer"/>
		</xsl:if>
		<xsl:if test="catESAD_cu:ManufacturerINN">
			<xsl:text> ИНН производителя </xsl:text>
			<xsl:apply-templates select="catESAD_cu:ManufacturerINN"/>
		</xsl:if>
		<xsl:if test="catESAD_cu:TradeMark">
			<xsl:text> Тов.знак </xsl:text>
			<xsl:apply-templates select="catESAD_cu:TradeMark"/>
		</xsl:if>
		<xsl:if test="catESAD_cu:GoodsMark">
			<xsl:text> Торг. знак, марка </xsl:text>
			<xsl:apply-templates select="catESAD_cu:GoodsMark"/>
		</xsl:if>
		<xsl:if test="catESAD_cu:GoodsModel">
			<xsl:text> Модель </xsl:text>
			<xsl:apply-templates select="catESAD_cu:GoodsModel"/>
		</xsl:if>
		<xsl:if test="catESAD_cu:GoodsMarking">
			<xsl:text> Артикул</xsl:text>
			<xsl:apply-templates select="catESAD_cu:GoodsMarking"/>
		</xsl:if>
		<xsl:if test="catESAD_cu:GoodsStandard">
			<xsl:text> Стандарт </xsl:text>
			<xsl:apply-templates select="catESAD_cu:GoodsStandard"/>
		</xsl:if>
		<xsl:if test="catESAD_cu:GoodsSort">
			<xsl:text> Сорт: </xsl:text>
			<xsl:apply-templates select="catESAD_cu:GoodsSort"/>
		</xsl:if>
		<xsl:if test="catESAD_cu:WoodDescriptionDetails">
			<xsl:if test="catESAD_cu:WoodDescriptionDetails/catESAD_cu:WoodSortiment">
				<xsl:text> Наим.сортимента: </xsl:text>
				<xsl:apply-templates select="catESAD_cu:WoodDescriptionDetails/catESAD_cu:WoodSortiment"/>
			</xsl:if>
			<xsl:if test="catESAD_cu:WoodDescriptionDetails/catESAD_cu:WoodKind">
				<xsl:text> Порода древесины: </xsl:text>
				<xsl:apply-templates select="catESAD_cu:WoodDescriptionDetails/catESAD_cu:WoodKind"/>
			</xsl:if>
			<xsl:if test="catESAD_cu:WoodDescriptionDetails/catESAD_cu:ProductSortName">
				<xsl:text> Наименование сорта:</xsl:text>
				<xsl:apply-templates select="catESAD_cu:WoodDescriptionDetails/catESAD_cu:ProductSortName"/>
			</xsl:if>
			<xsl:if test="catESAD_cu:WoodDescriptionDetails/catESAD_cu:AllowanceDetails">
				<xsl:text> Припуск по длине, ширине, высоте: </xsl:text>
				<xsl:apply-templates mode="size_details" select="catESAD_cu:WoodDescriptionDetails/catESAD_cu:AllowanceDetails"/>
			</xsl:if>
			<xsl:if test="catESAD_cu:WoodDescriptionDetails/catESAD_cu:DeviationDetails">
				<xsl:text> Отклонения по длине, ширине, высоте: </xsl:text>
				<xsl:apply-templates mode="size_details" select="catESAD_cu:WoodDescriptionDetails/catESAD_cu:DeviationDetails"/>
			</xsl:if>
			<xsl:if test="catESAD_cu:WoodDescriptionDetails/catESAD_cu:DiameterRangeDetails">
				<xsl:text> Диапазон диаметров: </xsl:text>
				<xsl:apply-templates select="catESAD_cu:WoodDescriptionDetails/catESAD_cu:DiameterRangeDetails/catESAD_cu:MinRangeMeasure" mode="SupplementaryQuantity"/>
				<xsl:if test="catESAD_cu:WoodDescriptionDetails/catESAD_cu:DiameterRangeDetails/catESAD_cu:MaxRangeMeasure"> - <xsl:apply-templates select="catESAD_cu:WoodDescriptionDetails/catESAD_cu:DiameterRangeDetails/catESAD_cu:MaxRangeMeasure" mode="SupplementaryQuantity"/>
				</xsl:if>
			</xsl:if>
			<xsl:if test="catESAD_cu:WoodDescriptionDetails/catESAD_cu:ContractVolumeMeasure">
				<xsl:text> Объем товара в соответствии с контрактом: </xsl:text>
				<xsl:apply-templates select="catESAD_cu:WoodDescriptionDetails/catESAD_cu:ContractVolumeMeasure" mode="SupplementaryQuantity"/>
			</xsl:if>
			<xsl:if test="catESAD_cu:WoodDescriptionDetails/catESAD_cu:FactVolumeMeasure">
				<xsl:text> Фактический объем товара: </xsl:text>
				<xsl:apply-templates select="catESAD_cu:WoodDescriptionDetails/catESAD_cu:FactVolumeMeasure" mode="SupplementaryQuantity"/>
			</xsl:if>
		</xsl:if>
		<xsl:if test="catESAD_cu:Dimensions">
			<xsl:text> Размеры </xsl:text>
			<xsl:apply-templates mode="size_details" select="catESAD_cu:Dimensions"/>
		</xsl:if>
		<xsl:if test="catESAD_cu:DateIssue">
			<xsl:text> Дата выпуска </xsl:text>
			<xsl:apply-templates select="catESAD_cu:DateIssue" mode="russian_date"/>
		</xsl:if>
		<xsl:if test="catESAD_cu:SerialNumber">
			<xsl:text> Серийный номер: </xsl:text>
			<xsl:for-each select="catESAD_cu:SerialNumber">
				<xsl:apply-templates select="."/>
				<xsl:if test="position()!=last()">
					<xsl:text>, </xsl:text>
				</xsl:if>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="catESAD_cu:GoodsGroupQuantity">
			<xsl:text> Кол-во </xsl:text>
			<xsl:for-each select="catESAD_cu:GoodsGroupQuantity">
				<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
				<xsl:apply-templates select="catESAD_cu:GoodsQuantity"/>
				<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
				<xsl:apply-templates select="catESAD_cu:MeasureUnitQualifierName"/>
				<xsl:if test="catESAD_cu:MeasureUnitQualifierCode">
					<xsl:text> (</xsl:text>
					<xsl:apply-templates select="catESAD_cu:MeasureUnitQualifierCode"/>
					<xsl:text>)</xsl:text>
				</xsl:if>
			</xsl:for-each>
		</xsl:if>
	</xsl:template>
	<xsl:template mode="size_details" match="*">
		<xsl:apply-templates select="catESAD_cu:LengthMeasure/catESAD_cu:MeasuredAmount"/>&#160;<xsl:apply-templates select="catESAD_cu:LengthMeasure/catESAD_cu:MeasureUnitQualifierName"/> (<xsl:apply-templates select="catESAD_cu:LengthMeasure/catESAD_cu:MeasureUnitQualifierCode"/>)<xsl:if test="catESAD_cu:WidthMeasure">
			<xsl:if test="catESAD_cu:LengthMeasure">
				<xsl:text> x </xsl:text>
			</xsl:if>
			<xsl:apply-templates select="catESAD_cu:WidthMeasure/catESAD_cu:MeasuredAmount"/>&#160;<xsl:apply-templates select="catESAD_cu:WidthMeasure/catESAD_cu:MeasureUnitQualifierName"/> (<xsl:apply-templates select="catESAD_cu:WidthMeasure/catESAD_cu:MeasureUnitQualifierCode"/>)</xsl:if>
		<xsl:if test="catESAD_cu:HeightMeasure">
			<xsl:if test="catESAD_cu:LengthMeasure or catESAD_cu:WidthMeasure">
				<xsl:text> x </xsl:text>
			</xsl:if>
			<xsl:apply-templates select="catESAD_cu:HeightMeasure/catESAD_cu:MeasuredAmount"/>&#160;<xsl:apply-templates select="catESAD_cu:HeightMeasure/catESAD_cu:MeasureUnitQualifierName"/> (<xsl:apply-templates select="catESAD_cu:HeightMeasure/catESAD_cu:MeasureUnitQualifierCode"/>)</xsl:if>
	</xsl:template>
	<xsl:template mode="SupplementaryQuantity" match="*">
		<xsl:for-each select="*">
			<xsl:choose>
				<xsl:when test="local-name()='MeasureUnitQualifierCode'">(<xsl:apply-templates select="."/>)</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="."/>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:if test="position()!=last()">
				<xsl:text> </xsl:text>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>
	<xsl:template match="*" mode="Certificate">
		<xsl:for-each select="*">
			<xsl:choose>
				<xsl:when test="local-name()='CertiDate'">
					<xsl:call-template name="russian_date_nopoint">
						<xsl:with-param name="dateIn" select="."/>
					</xsl:call-template>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="."/>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:choose>
				<xsl:when test="position()!=last()">/</xsl:when>
				<xsl:otherwise> </xsl:otherwise>
			</xsl:choose>
		</xsl:for-each>
	</xsl:template>
	<xsl:template match="*" mode="PersonBase">
		<xsl:if test="cat_ru:PersonPost">
			<xsl:value-of select="cat_ru:PersonPost"/>
		</xsl:if>
		<xsl:if test="cat_ru:PersonSurname">
			<xsl:text>&#160;</xsl:text>
			<xsl:value-of select="cat_ru:PersonSurname"/>
		</xsl:if>
		<xsl:if test="cat_ru:PersonName">
			<xsl:text>&#160;</xsl:text>
			<xsl:value-of select="cat_ru:PersonName"/>
		</xsl:if>
		<xsl:if test="cat_ru:PersonMiddleName">
			<xsl:text>&#160;</xsl:text>
			<xsl:value-of select="cat_ru:PersonMiddleName"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="*" mode="CustomsOffice">
		<xsl:value-of select="cat_ru:OfficeName"/>
		<xsl:if test="cat_ru:Code">
			<xsl:if test="cat_ru:OfficeName">
				<xsl:text> (</xsl:text>
				<xsl:value-of select="cat_ru:Code"/>
				<xsl:text>)</xsl:text>
			</xsl:if>
		</xsl:if>
	</xsl:template>
	<xsl:template match="cat_ru:RFOrganizationFeatures">
		<xsl:if test="string-length(cat_ru:INN) &gt; 0 or string-length(cat_ru:KPP) &gt; 0">
			<span class="normal">,&#032;</span>
			<span class="italic">
				<xsl:if test="string-length(cat_ru:INN) &gt; 0">
					<span class="italic">ИНН</span>
				</xsl:if>
				<xsl:if test="string-length(cat_ru:INN) &gt; 0 and string-length(cat_ru:KPP) &gt; 0">
					<span class="normal">/</span>
				</xsl:if>
				<xsl:if test="string-length(cat_ru:KPP) &gt; 0">
					<span class="italic">КПП</span>
				</xsl:if>
				<span class="normal">:&#032;</span>
			</span>
		</xsl:if>
		<xsl:if test="cat_ru:INN">
			<xsl:value-of select="cat_ru:INN"/>
		</xsl:if>
		<xsl:if test="cat_ru:KPP">
			<xsl:if test="string-length(cat_ru:INN) &gt; 0">
				<span class="normal">&#032;/&#032;</span>
			</xsl:if>
			<xsl:value-of select="cat_ru:KPP"/>
		</xsl:if>
		<xsl:if test="cat_ru:OGRN">
			<span class="normal">,&#032;</span>
			<span class="italic">ОГРН</span>
			<span class="normal">:&#032;</span>
			<xsl:value-of select="cat_ru:OGRN"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="cat_ru:RKOrganizationFeatures">
		<xsl:if test="cat_ru:BIN">
			<span class="normal">,&#032;</span>
			<span class="italic">БИН</span>
			<span class="normal">:&#032;</span>
			<xsl:value-of select="cat_ru:BIN"/>
		</xsl:if>
		<xsl:if test="cat_ru:IIN">
			<xsl:if test="string-length(cat_ru:BIN) &gt; 0">
				<span class="normal">&#032;/&#032;</span>
			</xsl:if>
			<xsl:if test="string-length(cat_ru:BIN) = 0">
				<span class="normal">,&#032;</span>
			</xsl:if>
			<span class="italic">ИИН</span>
			<span class="normal">:&#032;</span>
			<xsl:value-of select="cat_ru:IIN"/>
		</xsl:if>
		<xsl:if test="cat_ru:ITN">
			<span class="normal">,&#032;</span>
			<span class="italic">ИТН</span>
			<span class="normal">:&#032;</span>
			<xsl:value-of select="cat_ru:CategoryCode"/>
			<span class="normal">&#032;/&#032;</span>
			<xsl:value-of select="cat_ru:KATOCode"/>
			<xsl:if test="cat_ru:RNN">
				<span class="normal">&#032;/&#032;</span>
				<xsl:value-of select="cat_ru:RNN"/>
			</xsl:if>
			<xsl:if test="cat_ru:ITNReserv">
				<span class="normal">&#032;/&#032;</span>
				<xsl:value-of select="cat_ru:ITNReserv"/>
			</xsl:if>
		</xsl:if>
	</xsl:template>
	<xsl:template match="cat_ru:RBOrganizationFeatures">
		<xsl:if test="cat_ru:UNP">
			<span class="normal">,&#032;</span>
			<span class="italic">УНП</span>
			<span class="normal">:&#032;</span>
			<xsl:value-of select="cat_ru:UNP"/>
		</xsl:if>
		<xsl:if test="cat_ru:RBIdentificationNumber">
			<span class="normal">,&#032;</span>
			<span class="italic">ИНФЛ</span>
			<span class="normal">:&#032;</span>
			<xsl:value-of select="cat_ru:RBIdentificationNumber"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="cat_ru:RAOrganizationFeatures">
		<xsl:if test="cat_ru:UNN">
			<span class="normal">,&#032;</span>
			<span class="italic">УНН</span>
			<span class="normal">:&#032;</span>
			<xsl:value-of select="cat_ru:UNN"/>
		</xsl:if>
		<xsl:if test="cat_ru:SocialServiceNumber">
			<span class="normal">,&#032;</span>
			<span class="italic">НЗОУ</span>
			<span class="normal">:&#032;</span>
			<xsl:value-of select="cat_ru:SocialServiceNumber"/>
		</xsl:if>
		<xsl:if test="cat_ru:SocialServiceCertificate">
			<span class="normal">,&#032;</span>
			<span class="italic">N справки об отсутв. НЗОУ</span>
			<span class="normal">:&#032;</span>
			<xsl:value-of select="cat_ru:SocialServiceCertificate"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="cat_ru:KGOrganizationFeatures">
		<xsl:if test="cat_ru:KGINN">
			<span class="italic">, ИНН(ПИН)</span>
			<span class="normal">:&#032;</span>
			<xsl:value-of select="cat_ru:KGINN"/>
		</xsl:if>
		<xsl:if test="cat_ru:KGOKPO">
			<span class="italic">, ОКПО</span>
			<span class="normal">:&#032;</span>
			<xsl:value-of select="cat_ru:KGOKPO"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="*" mode="ru_address">
		<xsl:choose>
			<xsl:when test="RUScat_ru:AddressText">
				<xsl:if test="RUScat_ru:AddressKindCode">
					<xsl:choose>
						<xsl:when test="RUScat_ru:AddressKindCode='1'">Адрес регистрации: </xsl:when>
						<xsl:when test="RUScat_ru:AddressKindCode='2'">Фактический адрес: </xsl:when>
						<xsl:when test="RUScat_ru:AddressKindCode='3'">Почтовый адрес: </xsl:when>
					</xsl:choose>
				</xsl:if>
				<xsl:apply-templates select="RUScat_ru:AddressText"/>
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
					<!--xsl:if test="local-name()='KLADR'">Код КЛАДР: </xsl:if>
					<xsl:if test="local-name()='AOGUID'">Глобальный ИД по ФИАС: </xsl:if>
					<xsl:if test="local-name()='AOID'">Уникальный ИД по ФИАС: </xsl:if-->
					<xsl:if test="local-name()='TerritoryCode'">Код единицы административно - территориального деления: </xsl:if>
					<xsl:if test="local-name()='PostOfficeBoxId'">Номер а/я: </xsl:if>
					<xsl:choose>
						<xsl:when test="local-name()='AddressKindCode'">
							<xsl:choose>
								<xsl:when test=".='1'">Адрес регистрации: </xsl:when>
								<xsl:when test=".='2'">Фактический адрес: </xsl:when>
								<xsl:when test=".='3'">Почтовый адрес: </xsl:when>
							</xsl:choose>
						</xsl:when>
						<xsl:when test="local-name()='CountryCode'">
							<xsl:if test="not(../RUScat_ru:CounryName)">
								<xsl:apply-templates select="."/>
								<xsl:if test="position()!=$last">, </xsl:if>
							</xsl:if>
						</xsl:when>
						<xsl:when test="local-name()='KLADR' or local-name()='AOGUID' or local-name()='AOID'">
							<!--в этом случае ничего не выводим-->
						</xsl:when>
						<xsl:otherwise>
							<xsl:apply-templates select="."/>
							<xsl:if test="position()!=$last">, </xsl:if>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:for-each>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template mode="Contact" match="*">
		<xsl:if test="cat_ru:Phone"> Тел: <xsl:for-each select="cat_ru:Phone">
				<xsl:value-of select="."/>,&#032;</xsl:for-each>
		</xsl:if>
		<xsl:if test="cat_ru:Fax">Факс: <xsl:value-of select="cat_ru:Fax"/>,&#032;</xsl:if>
		<xsl:if test="cat_ru:Telex">Телекс: <xsl:value-of select="cat_ru:Telex"/>,&#032;</xsl:if>
		<xsl:if test="cat_ru:E_mail">Email: <xsl:for-each select="cat_ru:E_mail">
				<xsl:value-of select="."/>
				<xsl:if test="position()!=last()">,&#032;</xsl:if>
			</xsl:for-each>
		</xsl:if>
	</xsl:template>
	<xsl:template mode="organization_base" match="*">
		<xsl:value-of select="cat_ru:OrganizationName"/>
		<xsl:if test="cat_ru:ShortName">
			<xsl:if test="cat_ru:OrganizationName"> (</xsl:if>
			<xsl:apply-templates select="cat_ru:ShortName"/>
			<xsl:if test="cat_ru:OrganizationName">)</xsl:if>
		</xsl:if>
		<xsl:text> </xsl:text>
		<xsl:apply-templates select="cat_ru:RFOrganizationFeatures"/>
	</xsl:template>
	<xsl:template mode="organization" match="*">
		<xsl:value-of select="cat_ru:OrganizationName"/>
		<xsl:if test="cat_ru:ShortName">
			<xsl:if test="cat_ru:OrganizationName"> (</xsl:if>
			<xsl:apply-templates select="cat_ru:ShortName"/>
			<xsl:if test="cat_ru:OrganizationName">)</xsl:if>
		</xsl:if>
		<xsl:text> </xsl:text>
		<xsl:apply-templates select="cat_ru:RFOrganizationFeatures"/>
		<xsl:text> </xsl:text>
		<xsl:apply-templates mode="identity" select="RUScat_ru:IdentityCard"/>
		<xsl:text> </xsl:text>
		<xsl:text> </xsl:text>
		<xsl:if test="RUScat_ru:CountryA2Code">
			<span class="normal">, </span>
			<span class="italic">Код страны</span>
			<span class="normal">: </span>
			<xsl:value-of select="RUScat_ru:CountryA2Code"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:BusinessEntityTypeCode">
			<xsl:apply-templates select="RUScat_ru:BusinessEntityTypeCode"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:BusinessEntityTypeName">
			<span class="normal">, </span>
			<span class="italic">ОПФ</span>
			<span class="normal">: </span>
			<xsl:value-of select="RUScat_ru:BusinessEntityTypeName"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:UITN">,&#160;<xsl:apply-templates select="RUScat_ru:UITN"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:PersonId">
			<span class="normal">, </span>
			<span class="italic">УИ ФЛ</span>
			<span class="normal">: </span>
			<xsl:value-of select="RUScat_ru:PersonId"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:IdentityCard">,&#160;<xsl:apply-templates mode="identity" select="RUScat_ru:IdentityCard"/>
		</xsl:if>
		<xsl:text> </xsl:text>
		<xsl:if test="RUScat_ru:PersonId">,&#160;<xsl:apply-templates select="RUScat_ru:PersonId"/>
		</xsl:if>
		<xsl:text> </xsl:text>
		<xsl:apply-templates mode="Contact" select="RUScat_ru:CommunicationDetails"/>
		<xsl:text> </xsl:text>
		<xsl:if test="RUScat_ru:SubjectAddressDetails">
			<xsl:text> адрес(а): </xsl:text>
			<xsl:for-each select="RUScat_ru:SubjectAddressDetails">
				<xsl:apply-templates select="." mode="ru_address"/>
				<xsl:if test="position()!=last()">
					<xsl:text>; </xsl:text>
				</xsl:if>
			</xsl:for-each>
		</xsl:if>
	</xsl:template>
	<xsl:template match="RUScat_ru:BusinessEntityTypeCode">
		<span class="normal">, </span>
		<span class="italic">Код ОПФ: </span>
		<xsl:value-of select="RUScat_ru:UnifiedCode"/>
		<xsl:if test="RUScat_ru:CodeListId">
			<span class="normal"> (</span>
			<span class="italic"> по справ. </span>
			<xsl:value-of select="RUScat_ru:CodeListId"/>
			<span class="normal">)</span>
		</xsl:if>
	</xsl:template>
	<xsl:template match="RUScat_ru:UITN">
		<span class="normal"> УИТН</span>
		<span class="normal">: </span>
		<xsl:value-of select="RUScat_ru:UITNCode"/>
		<xsl:if test="RUScat_ru:CountryCode">
			<span class="normal"> (</span>
			<span class="normal">страна </span>
			<xsl:value-of select="RUScat_ru:CountryCode"/>
			<span class="normal">)</span>
		</xsl:if>
	</xsl:template>
	<xsl:template match="*" mode="confirm_authority_doc">
		<xsl:for-each select="*">
			<xsl:choose>
				<xsl:when test="local-name()='PrDocumentNumber'">
					<xsl:text> №  </xsl:text>
				</xsl:when>
				<xsl:when test="local-name()='PrDocumentDate'">
					<xsl:text> от </xsl:text>
					<xsl:call-template name="russian_date">
						<xsl:with-param name="dateIn" select="."/>
					</xsl:call-template>
				</xsl:when>
				<xsl:when test="local-name()='ComplationAuthorityDate'">
					<xsl:text>(дата окончания полномочий:   </xsl:text>
					<xsl:call-template name="russian_date">
						<xsl:with-param name="dateIn" select="."/>
					</xsl:call-template>
					<xsl:text>)</xsl:text>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="."/>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:if test="position()!=last()">
				<xsl:text> </xsl:text>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>
	<xsl:template match="*" mode="pointSeparated">
		<xsl:for-each select="*">
			<xsl:apply-templates select="."/>
			<xsl:if test="position()!=last()">
				<xsl:text>, </xsl:text>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>
	<xsl:template mode="identity" match="*">
		<xsl:for-each select="*">
			<xsl:choose>
				<xsl:when test="local-name()='IdentityCardDate'">
					<xsl:apply-templates select="." mode="russian_date"/>
				</xsl:when>
				<xsl:when test="local-name()='DocValidityDate'">
					<xsl:text>окончание срока действия: </xsl:text>
					<xsl:apply-templates select="." mode="russian_date"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="."/>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:if test="position()!=last() and not(local-name()='IdentityCardSeries')">
				<xsl:text>, </xsl:text>
			</xsl:if>
			<xsl:if test="local-name()='IdentityCardSeries'">
				<xsl:text> </xsl:text>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>
	<xsl:template match="*" mode="date_str">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:call-template name="date_str">
				<xsl:with-param name="dateIn" select="."/>
			</xsl:call-template>
		</element>
	</xsl:template>
	<xsl:template name="date_str">
		<xsl:param name="date"/>
		<table>
			<tbody align="center" class="graphMain">
				<tr>
					<td width="2%" align="right">" </td>
					<td width="13%" class="value">
						<xsl:value-of select="substring($date,9,2)"/>
					</td>
					<td width="2%" align="left"> "</td>
					<td width="3%"> </td>
					<td width="58%" class="value">
						<xsl:variable name="month" select="substring($date, 6, 2)"/>
						<xsl:choose>
							<xsl:when test="$month=1">января</xsl:when>
							<xsl:when test="$month=2">февраля</xsl:when>
							<xsl:when test="$month=3">марта</xsl:when>
							<xsl:when test="$month=4">апреля</xsl:when>
							<xsl:when test="$month=5">мая</xsl:when>
							<xsl:when test="$month=6">июня</xsl:when>
							<xsl:when test="$month=7">июля</xsl:when>
							<xsl:when test="$month=8">августа</xsl:when>
							<xsl:when test="$month=9">сентября</xsl:when>
							<xsl:when test="$month=10">октября</xsl:when>
							<xsl:when test="$month=11">ноября</xsl:when>
							<xsl:when test="$month=12">декабря</xsl:when>
						</xsl:choose> 					
					</td>
					<td width="5%"> </td>
					<td width="2%" align="right">
						<xsl:choose>
							<xsl:when test="substring($date,1,2)">
								<xsl:value-of select="substring($date,1,2)"/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:text>20</xsl:text>
							</xsl:otherwise>
						</xsl:choose>
					</td>
					<td width="9%" class="value" align="left">
						<xsl:value-of select="substring($date,3,2)"/>
					</td>
					<td width="4%"> </td>
					<td width="2%"> г. </td>
				</tr>
			</tbody>
		</table>
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
	<xsl:template match="*" mode="russian_date_nopoint">
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
	<xsl:template name="russian_date_nopoint">
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
</xsl:stylesheet>
