<?xml version="1.0" encoding="utf-8"?>
<!--Приказ ФТС от 18 ноября 2020 г. N 994 "Об утверждении формы заявления о завершении таможенной процедуры свободной таможенной зоны в отношении товаров, помещенных под
таможенную процедуру свободной таможенной зоны, и (или) товаров, изготовленных (полученных) из товаров, помещенных под таможенную процедуру свободной таможенной зоны, которые были потреблены в соответствии с подпунктом 5 пункта 1 статьи 205 Таможенного кодекса Евразийского экономического союза, и порядка ее заполнения"
-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:oeznr="urn:customs.ru:Information:CustomsDocuments:OEZ_NotifReg:5.26.0" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.24.0" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" xmlns:catESAD_cu="urn:customs.ru:CUESADCommonAggregateTypesCust:5.28.0" xmlns:accg_stz="urn:customs.ru:Information:CustomsDocuments:AppCloseConsumedGoodsSTZ:5.28.0" xmlns:catProc_ru="urn:customs.ru:Information:ProcessingDocuments:ProcessingCommonAggregateTypes:5.28.0">
	<xsl:param name="OEZ_NotifReg"/>
	<!-- Шаблон для типа AppCloseConsumedGoodsSTZType -->
	<xsl:template match="accg_stz:AppCloseConsumedGoodsSTZ">
		<xsl:param name="w" select="190"/>
		<html>
			<head>
				<style>
                  body {
                  background: #cccccc;
                  }

                  div
                  {
                  /*white-space: normal;*/
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
                  font-size: 10pt;
                  /*font-style: italic;*/
                  }

                  .annot
                  {
                  font-family: Arial;
                  font-size: 10pt;
                  }
                  
                  .descr
                  {
                  font-family: Arial;
                  font-size: 7pt;
                  }


                  .title
                  {
                  font-weight:bold;
                  font-family: Arial;
                  font-size: 10pt;
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
                </style>
			</head>
			<body>
				<div class="page" style="width: {$w}mm;">
					<table>
						<tbody>
							<tr valign="top">
								<td width="50%" align="left" valign="middle">
									<table width="95%">
										<tbody>
											<tr>
												<td class="bordered annot" style="height: 7mm;" valign="middle">
													<xsl:choose>
														<xsl:when test="$OEZ_NotifReg">
															<xsl:text>Регистрационный № </xsl:text>
															<xsl:apply-templates select="$OEZ_NotifReg/oeznr:RegistrationNumber" mode="reg_num"/>
															<xsl:text>/ЗВП</xsl:text>
														</xsl:when>
														<xsl:otherwise>
															<xsl:text>Регистрационный № _______/______/_______/ЗВП</xsl:text>
														</xsl:otherwise>
													</xsl:choose>
												</td>
											</tr>
										</tbody>
									</table>
								</td>
								<td width="50%">
									<table>
										<tbody>
											<tr valign="top">
												<td width="1%" class="annot">В</td>
												<td width="99%" class="value">
													<xsl:apply-templates select="accg_stz:Customs"/>
												</td>
											</tr>
											<tr>
												<td></td>
												<td class="descr">(наименование таможенного органа (с указанием кода таможенного органа))</td>
											</tr>
											<tr valign="top">
												<td class="annot">от</td>
												<td class="value">
													<xsl:apply-templates select="accg_stz:Resident"/>
												</td>
											</tr>
											<tr>
												<td></td>
												<td class="descr">(резидент Арктической зоны Российской Федерации (наименование организации, содержащее указание на ее организационно-правовую форму (сокращенное наименование, 
													если такое наименование предусмотрено учредительным документом
													юридического лица), основной государственный регистрационный номер (ОГРН), идентификационный номер налогоплательщика (ИНН) и код причины постановки на учет в налоговом органе (КПП),
													присвоенные юридическому лицу в соответствии с законодательством Российской Федерации о государственной регистрации юридических лиц и индивидуальных предпринимателей, адрес
													юридического лица - для юридического лица; фамилия, имя, отчество (при наличии), адрес, по которому постоянно проживает или зарегистрировано физическое лицо, идентификационный номер
													налогоплательщика (ИНН), основной государственный регистрационный номер индивидуального предпринимателя (ОГРНИП) и сведения о документе, удостоверяющем личность физического лица - для
													физического лица; реквизиты свидетельства о включении в реестр резидентов Арктической зоны Российской Федерации)
												</td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<table>
						<tbody>
							<tr>
								<td align="center" class="title">
										Заявление<br/>
        о завершении таможенной процедуры свободной таможенной зоны<br/>
         в отношении товаров, помещенных под таможенную процедуру<br/>
         свободной таможенной зоны, и (или) товаров, изготовленных<br/>
       (полученных) из товаров, помещенных под таможенную процедуру<br/>
            свободной таможенной зоны, которые были потреблены<br/>
             в соответствии с подпунктом 5 пункта 1 статьи 205<br/>
           Таможенного кодекса Евразийского экономического союза
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<table>
						<tbody>
							<tr>
								<td class="annot">&#160;&#160;&#160;&#160;1.  Прошу  завершить  таможенную процедуру свободной таможенной зоны на основании  подпункта 5 пункта 1 статьи 205 Таможенного кодекса Евразийского экономического  союза  в  отношении  товаров  согласно  представленным ниже
сведениям на _<u><xsl:apply-templates select="accg_stz:SheetsNumber"/></u>_ л. и отчетности о товарах, помещенных под таможенную процедуру  свободной таможенной зоны, товарах, изготовленных (полученных) с использованием  товаров,  помещенных  под  таможенную  процедуру  свободной
таможенной зоны, и совершаемых с ними операциях за 
									<table class="inlinetable" style="width: 50mm;">
										<tbody>
											<tr align="center">
												<td class="value" width="100%">
													<xsl:apply-templates select="accg_stz:StartReportDate" mode="russian_date"/>
													<xsl:text> - </xsl:text>
													<xsl:apply-templates select="accg_stz:EndReportDate" mode="russian_date"/>
													<br/>
												</td>
											</tr>
											<tr align="center">
												<td class="descr" width="100%">
													(период представления отчетности)
												</td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
							<tr>
								<td class="annot">&#160;&#160;&#160;&#160;2.  Сведения  о  товарах, помещенных под таможенную процедуру свободной таможенной   зоны,   и  товарах,  изготовленных  (полученных)  из  товаров, помещенных под таможенную процедуру свободной таможенной зоны, которые были
потреблены  в  соответствии  с подпунктом 5 пункта 1 статьи 205 Таможенного кодекса Евразийского экономического союза.
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<div class="annot">&#160;&#160;&#160;&#160;Раздел   1.  Товары,  помещенные  под  таможенную  процедуру  свободной таможенной   зоны,   и   товары,  изготовленные  (полученные)  из  товаров, помещенных под таможенную процедуру свободной таможенной зоны, потребленные
при   создании   объектов  недвижимости  на  территории  участка  резидента Арктической   зоны  и  являющиеся  составной  (неотъемлемой)  частью  таких объектов недвижимости
					</div>
					<br/>
					<xsl:for-each select="accg_stz:GoodsInfo/accg_stz:PropertyCreateGoods">
						<xsl:if test="position()!=1"><br/></xsl:if>
						<table>
							<tbody>
								<tr align="center">
									<td class="bordered annot" colspan="6">I. Объект недвижимости</td>
								</tr>
								<tr align="center" valign="top">
									<td class="bordered annot">Вид объекта недвижимости (с указанием наименования объекта недвижимости при наличии такого наименования) </td>
									<td class="bordered annot">Место нахождения объекта недвижимости (адрес) </td>
									<td class="bordered annot">Сведения о технической документации </td>
									<td class="bordered annot">Сведения о постановке объекта недвижимости на баланс заявителя и дате ввода его в эксплуатацию </td>
									<td class="bordered annot">Сведения о праве собственности на объект недвижимости</td>
									<td class="bordered annot">Примечание</td>
								</tr>
								<tr align="center" valign="top">
									<td class="bordered annot">1</td>
									<td class="bordered annot">2</td>
									<td class="bordered annot">3</td>
									<td class="bordered annot">4</td>
									<td class="bordered annot">5</td>
									<td class="bordered annot">6</td>
								</tr>
								<tr valign="top">
									<td class="bordered annot">
										<xsl:apply-templates select="accg_stz:PropertyName"/>
									</td>
									<td class="bordered annot">
										<xsl:apply-templates select="accg_stz:PropertyLocation"/>
									</td>
									<td class="bordered annot">
										<xsl:for-each select="accg_stz:TechDoc">
											<xsl:if test="position()!=1"><br1/></xsl:if>
											<xsl:apply-templates select="." mode="doc"/>
										</xsl:for-each>
									</td>
									<td class="bordered annot">
										<xsl:for-each select="accg_stz:PropertyBalanceSheet">
											<xsl:if test="position()!=1"><br1/></xsl:if>
											<xsl:apply-templates select="." mode="doc"/>
										</xsl:for-each>
									</td>
									<td class="bordered annot">
										<xsl:for-each select="accg_stz:OwnershipDoc">
											<xsl:if test="position()!=1"><br1/></xsl:if>
											<xsl:apply-templates select="." mode="doc"/>
										</xsl:for-each>
									</td>
									<td class="bordered annot">
										<xsl:apply-templates select="accg_stz:Comment"/>
									</td>
								</tr>
							</tbody>
						</table>
						<table>
							<tbody>
								<tr align="center">
									<td class="bordered annot" colspan="8">II. Товары, помещенные под таможенную процедуру свободной таможенной зоны и потребленные при создании объекта недвижимости</td>
								</tr>
								<tr align="center" valign="top">
									<td class="bordered annot">N п/п</td>
									<td class="bordered annot">Наименование товара/код товара </td>
									<td class="bordered annot">Регистрационный номер декларации на товары</td>
									<td class="bordered annot">Номер товара </td>
									<td class="bordered annot">Количество товара в основной единице измерения/кг</td>
									<td class="bordered annot">Количество товара/единица измерения количества</td>
									<td class="bordered annot">Наименование составной (неотъемлемой) части объекта недвижимости, при создании которой был потреблен товар</td>
									<td class="bordered annot">Сведения о документах бухгалтерского учета </td>
								</tr>
								<tr align="center" valign="top">
									<td class="bordered annot">1</td>
									<td class="bordered annot">2</td>
									<td class="bordered annot">3</td>
									<td class="bordered annot">4</td>
									<td class="bordered annot">5</td>
									<td class="bordered annot">6</td>
									<td class="bordered annot">7</td>
									<td class="bordered annot">8</td>
								</tr>
								<xsl:for-each select="accg_stz:PropertyGoodsSTZ">
									<xsl:variable name="countGoods" select="count(accg_stz:PropertyGoodsDecl/accg_stz:GoodsDeclnfo)"/>
									<tr valign="top">
										<td class="bordered annot" rowspan="{$countGoods}">
											<xsl:apply-templates select="accg_stz:Position"/>
										</td>
										<td class="bordered annot" rowspan="{$countGoods}">
											<xsl:apply-templates select="accg_stz:GoodsDescription"/>
											<xsl:text> / </xsl:text>
											<xsl:apply-templates select="accg_stz:GoodsTNVEDCode"/>
										</td>
										<xsl:variable name="goodsPerDT" select="count(accg_stz:PropertyGoodsDecl[1]/accg_stz:GoodsDeclnfo)"/>
										<td class="bordered annot" rowspan="{$goodsPerDT}">
											<xsl:apply-templates select="accg_stz:PropertyGoodsDecl[1]"/>
										</td>
										<td class="bordered annot">
											<xsl:apply-templates select="accg_stz:PropertyGoodsDecl[1]/accg_stz:GoodsDeclnfo[1]/accg_stz:GoodsNumber"/>
										</td>
										<td class="bordered annot">
											<xsl:for-each select="accg_stz:PropertyGoodsDecl[1]/accg_stz:GoodsDeclnfo[1]/accg_stz:GoodsQuantity">
												<xsl:if test="position()!=1"><br/></xsl:if>
												<xsl:apply-templates select="." mode="quantity"/>
											</xsl:for-each>
										</td>
										<td class="bordered annot" rowspan="{$countGoods}">
											<xsl:for-each select="accg_stz:GoodsQuantity">
												<xsl:if test="position()!=1"><br/></xsl:if>
												<xsl:apply-templates select="." mode="quantity"/>
											</xsl:for-each>
										</td>
										<td class="bordered annot" rowspan="{$countGoods}">
											<xsl:apply-templates select="accg_stz:ComponentUseName"/>
										</td>
										<td class="bordered annot" rowspan="{$countGoods}">
											<xsl:for-each select="accg_stz:AccountDoc">
												<xsl:if test="position()!=1"><br/></xsl:if>
												<xsl:apply-templates select="." mode="doc"/>
											</xsl:for-each>
										</td>
									</tr>
									<xsl:for-each select="accg_stz:PropertyGoodsDecl[1]/accg_stz:GoodsDeclnfo[position() &gt; 1]">
										<tr valign="top">
											<td class="bordered annot">
												<xsl:apply-templates select="accg_stz:GoodsNumber"/>
											</td>
											<td class="bordered annot">
												<xsl:for-each select="accg_stz:GoodsQuantity">
													<xsl:if test="position()!=1"><br/></xsl:if>
													<xsl:apply-templates select="." mode="quantity"/>
												</xsl:for-each>
											</td>
										</tr>
									</xsl:for-each>
									<xsl:for-each select="accg_stz:PropertyGoodsDecl[position() &gt; 1]">
										<xsl:variable name="goodsPerDT2" select="count(accg_stz:GoodsDeclnfo)"/>
										<tr valign="top">
											<td class="bordered annot" rowspan="{$goodsPerDT2}">
												<xsl:apply-templates select="."/>
											</td>
											<td class="bordered annot">
												<xsl:apply-templates select="accg_stz:GoodsDeclnfo[1]/accg_stz:GoodsNumber"/>
											</td>
											<td class="bordered annot">
												<xsl:for-each select="accg_stz:GoodsDeclnfo[1]/accg_stz:GoodsQuantity">
													<xsl:if test="position()!=1"><br/></xsl:if>
													<xsl:apply-templates select="." mode="quantity"/>
												</xsl:for-each>
											</td>
										</tr>
										<xsl:for-each select="accg_stz:GoodsDeclnfo[position() &gt; 1]">
											<tr valign="top">
												<td class="bordered annot">
													<xsl:apply-templates select="accg_stz:GoodsNumber"/>
												</td>
												<td class="bordered annot">
													<xsl:for-each select="accg_stz:GoodsQuantity">
														<xsl:if test="position()!=1"><br/></xsl:if>
														<xsl:apply-templates select="." mode="quantity"/>
													</xsl:for-each>
												</td>
											</tr>
										</xsl:for-each>
									</xsl:for-each>
								</xsl:for-each>
							</tbody>
						</table>
						<table>
							<tbody>
								<tr align="center">
									<td class="bordered annot" colspan="7">III. Товары, изготовленные (полученные) из товаров, помещенных под таможенную процедуру свободной таможенной зоны и потребленные при создании объекта недвижимости </td>
								</tr>
								<tr align="center" valign="top">
									<td class="bordered annot">N п/п</td>
									<td class="bordered annot">Наименование товара/код товара</td>
									<td class="bordered annot">Код товара</td>
									<td class="bordered annot">Количество товара/единица измерения</td>
									<td class="bordered annot">Сведения об операциях по переработке</td>
									<td class="bordered annot">Наименование составной (неотъемлемой) части объекта недвижимости, при создании которой был потреблен товар</td>
									<td class="bordered annot">Сведения о документах бухгалтерского учета</td>
								</tr>
								<tr align="center" valign="top">
									<td class="bordered annot">1</td>
									<td class="bordered annot">2</td>
									<td class="bordered annot">3</td>
									<td class="bordered annot">4</td>
									<td class="bordered annot">5</td>
									<td class="bordered annot">6</td>
									<td class="bordered annot">7</td>
								</tr>
								<xsl:for-each select="accg_stz:PropertyProcessingGoods">
									<tr valign="top">
										<td class="bordered annot">
											<xsl:apply-templates select="accg_stz:Position"/>
										</td>
										<td class="bordered annot">
											<xsl:apply-templates select="accg_stz:GoodsDescription"/>											
										</td>
										<td class="bordered annot">
											<xsl:apply-templates select="accg_stz:GoodsTNVEDCode"/>
										</td>
										<td class="bordered annot">
											<xsl:for-each select="accg_stz:GoodsQuantity">
												<xsl:if test="position()!=1"><br1/></xsl:if>
												<xsl:apply-templates select="." mode="quantity"/>
											</xsl:for-each>
										</td>
										<td class="bordered annot">
											<xsl:apply-templates select="accg_stz:ProcessingOperations"/>
										</td>
										<td class="bordered annot">
											<xsl:apply-templates select="accg_stz:ComponentName"/>
										</td>
										<td class="bordered annot">
											<xsl:for-each select="accg_stz:AccountDoc">
												<xsl:if test="position() != 1"><br/></xsl:if>
												<xsl:apply-templates select="." mode="doc"/>
											</xsl:for-each>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
						<table>
							<tbody>
								<tr align="center">
									<td class="bordered annot" colspan="6">IV. Товары, помещенные под таможенную процедуру свободной таможенной зоны и использованные при изготовлении товара</td>
								</tr>
								<tr align="center" valign="top">
									<td class="bordered annot">N п/п</td>
									<td class="bordered annot">Наименование товара</td>
									<td class="bordered annot">Регистрационный номер декларации на товары</td>
									<td class="bordered annot">Номер товара </td>
									<td class="bordered annot">Количество товара в основной единице измерения/кг</td>
									<td class="bordered annot">Количество товара/единица измерения количества</td>
								</tr>
								<tr align="center" valign="top">
									<td class="bordered annot">1</td>
									<td class="bordered annot">2</td>
									<td class="bordered annot">3</td>
									<td class="bordered annot">4</td>
									<td class="bordered annot">5</td>
									<td class="bordered annot">6</td>
								</tr>
								<xsl:for-each select="accg_stz:PropertyProcessingGoods/accg_stz:UsedGoods">
									<xsl:variable name="countGoods" select="count(accg_stz:GoodsDecl/accg_stz:GoodsDeclnfo)"/>
									<tr valign="top">
										<td class="bordered annot" rowspan="{$countGoods}">
											<xsl:apply-templates select="accg_stz:Position"/>
										</td>
										<td class="bordered annot" rowspan="{$countGoods}">
											<xsl:apply-templates select="accg_stz:GoodsDescription"/>
											<xsl:text> / </xsl:text>
											<xsl:apply-templates select="accg_stz:GoodsTNVEDCode"/>
										</td>
										<xsl:variable name="goodsPerDT" select="count(accg_stz:GoodsDecl[1]/accg_stz:GoodsDeclnfo)"/>
										<td class="bordered annot" rowspan="{$goodsPerDT}">
											<xsl:apply-templates select="accg_stz:GoodsDecl[1]"/>
										</td>
										<td class="bordered annot">
											<xsl:apply-templates select="accg_stz:GoodsDecl[1]/accg_stz:GoodsDeclnfo[1]/accg_stz:GoodsNumber"/>
										</td>
										<td class="bordered annot">
											<xsl:for-each select="accg_stz:GoodsDecl[1]/accg_stz:GoodsDeclnfo[1]/accg_stz:GoodsQuantity">
												<xsl:if test="position()!=1"><br/></xsl:if>
												<xsl:apply-templates select="." mode="quantity"/>
											</xsl:for-each>
										</td>
										<td class="bordered annot" rowspan="{$countGoods}">
											<xsl:for-each select="accg_stz:GoodsQuantity">
												<xsl:if test="position()!=1"><br/></xsl:if>
												<xsl:apply-templates select="." mode="quantity"/>
											</xsl:for-each>
										</td>
									</tr>
									<xsl:for-each select="accg_stz:GoodsDecl[1]/accg_stz:GoodsDeclnfo[position() &gt; 1]">
										<tr valign="top">
											<td class="bordered annot">
												<xsl:apply-templates select="accg_stz:GoodsNumber"/>
											</td>
											<td class="bordered annot">
												<xsl:for-each select="accg_stz:GoodsQuantity">
													<xsl:if test="position()!=1"><br/></xsl:if>
													<xsl:apply-templates select="." mode="quantity"/>
												</xsl:for-each>
											</td>
										</tr>
									</xsl:for-each>
									<xsl:for-each select="accg_stz:GoodsDecl[position() &gt; 1]">
										<xsl:variable name="goodsPerDT2" select="count(accg_stz:GoodsDeclnfo)"/>
										<tr valign="top">
											<td class="bordered annot" rowspan="{$goodsPerDT2}">
												<xsl:apply-templates select="."/>
											</td>
											<td class="bordered annot">
												<xsl:apply-templates select="accg_stz:GoodsDeclnfo[1]/accg_stz:GoodsNumber"/>
											</td>
											<td class="bordered annot">
												<xsl:for-each select="accg_stz:GoodsDeclnfo[1]/accg_stz:GoodsQuantity">
													<xsl:if test="position()!=1"><br/></xsl:if>
													<xsl:apply-templates select="." mode="quantity"/>
												</xsl:for-each>
											</td>
										</tr>
										<xsl:for-each select="accg_stz:GoodsDeclnfo[position() &gt; 1]">
											<tr valign="top">
												<td class="bordered annot">
													<xsl:apply-templates select="accg_stz:GoodsNumber"/>
												</td>
												<td class="bordered annot">
													<xsl:for-each select="accg_stz:GoodsQuantity">
														<xsl:if test="position()!=1"><br/></xsl:if>
														<xsl:apply-templates select="." mode="quantity"/>
													</xsl:for-each>
												</td>
											</tr>
										</xsl:for-each>
									</xsl:for-each>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:for-each>
					<br/>
					<div class="annot">&#160;&#160;&#160;&#160; Раздел 2. Товары, помещенные под таможенную процедуру свободной таможенной зоны, и товары, изготовленные (полученные) из товаров,
помещенных под таможенную процедуру свободной таможенной зоны, потребленные при эксплуатации (содержании) объекта недвижимости, находящегося на территории участка резидента Арктической зоны
					</div>
					<br/>
					<xsl:for-each select="accg_stz:GoodsInfo/accg_stz:PropertyExplGoods">
						<xsl:if test="position()!=1"><br/></xsl:if>
						<table>
							<tbody>
								<tr align="center">
									<td class="bordered annot" colspan="6">I. Объект недвижимости</td>
								</tr>
								<tr align="center" valign="top">
									<td class="bordered annot">№ п/п</td>
									<td class="bordered annot">Вид объекта недвижимости (с указанием наименования объекта недвижимости при наличии такого наименования) </td>
									<td class="bordered annot">Место нахождения объекта недвижимости (адрес) </td>
									<td class="bordered annot">Сведения о документах, подтверждающих право собственности на объект недвижимости</td>
									<td class="bordered annot">Примечание</td>
								</tr>
								<tr align="center" valign="top">
									<td class="bordered annot">1</td>
									<td class="bordered annot">2</td>
									<td class="bordered annot">3</td>
									<td class="bordered annot">4</td>
									<td class="bordered annot">5</td>
								</tr>
								<tr valign="top">
									<td class="bordered annot">
										<xsl:apply-templates select="accg_stz:Position"/>
									</td>
									<td class="bordered annot">
										<xsl:apply-templates select="accg_stz:PropertyName"/>
									</td>
									<td class="bordered annot">
										<xsl:apply-templates select="accg_stz:PropertyLocation"/>
									</td>
									<td class="bordered annot">
										<xsl:for-each select="accg_stz:OwnershipDoc">
											<xsl:if test="position()!=1"><br1/></xsl:if>
											<xsl:apply-templates select="." mode="doc"/>
										</xsl:for-each>
									</td>
									<td class="bordered annot">
										<xsl:apply-templates select="accg_stz:Comment"/>
									</td>
								</tr>
							</tbody>
						</table>
						<table>
							<tbody>
								<tr align="center">
									<td class="bordered annot" colspan="8">II. Товары, помещенные под таможенную процедуру свободной таможенной зоны и потребленные при эксплуатации (содержании) объекта недвижимости</td>
								</tr>
								<tr align="center" valign="top">
									<td class="bordered annot">N п/п</td>
									<td class="bordered annot">Наименование товара/код товара </td>
									<td class="bordered annot">Регистрационный номер декларации на товары</td>
									<td class="bordered annot">Номер товара </td>
									<td class="bordered annot">Количество товара в основной единице измерения/кг</td>
									<td class="bordered annot">Количество товара/единица измерения количества</td>
									<td class="bordered annot">Сведения о документах, регламентирующих выполнение работ и нормативных затрат при эксплуатации (содержании) объекта недвижимости </td>
									<td class="bordered annot">Сведения о документах бухгалтерского учета </td>
								</tr>
								<tr align="center" valign="top">
									<td class="bordered annot">1</td>
									<td class="bordered annot">2</td>
									<td class="bordered annot">3</td>
									<td class="bordered annot">4</td>
									<td class="bordered annot">5</td>
									<td class="bordered annot">6</td>
									<td class="bordered annot">7</td>
									<td class="bordered annot">8</td>
								</tr>
								<xsl:for-each select="accg_stz:ExploitationGoodsSTZ">
									<xsl:variable name="countGoods" select="count(accg_stz:ExploitationGoodsDecl/accg_stz:GoodsDeclnfo)"/>
									<tr valign="top">
										<td class="bordered annot" rowspan="{$countGoods}">
											<xsl:apply-templates select="accg_stz:Position"/>
										</td>
										<td class="bordered annot" rowspan="{$countGoods}">
											<xsl:apply-templates select="accg_stz:GoodsDescription"/>
											<xsl:text> / </xsl:text>
											<xsl:apply-templates select="accg_stz:GoodsTNVEDCode"/>
										</td>
										<xsl:variable name="goodsPerDT" select="count(accg_stz:ExploitationGoodsDecl[1]/accg_stz:GoodsDeclnfo)"/>
										<td class="bordered annot" rowspan="{$goodsPerDT}">
											<xsl:apply-templates select="accg_stz:ExploitationGoodsDecl[1]"/>
										</td>
										<td class="bordered annot">
											<xsl:apply-templates select="accg_stz:ExploitationGoodsDecl[1]/accg_stz:GoodsDeclnfo[1]/accg_stz:GoodsNumber"/>
										</td>
										<td class="bordered annot">
											<xsl:for-each select="accg_stz:ExploitationGoodsDecl[1]/accg_stz:GoodsDeclnfo[1]/accg_stz:GoodsQuantity">
												<xsl:if test="position()!=1"><br/></xsl:if>
												<xsl:apply-templates select="." mode="quantity"/>
											</xsl:for-each>
										</td>
										<td class="bordered annot" rowspan="{$countGoods}">
											<xsl:for-each select="accg_stz:GoodsQuantity">
												<xsl:if test="position()!=1"><br/></xsl:if>
												<xsl:apply-templates select="." mode="quantity"/>
											</xsl:for-each>
										</td>
										<td class="bordered annot" rowspan="{$countGoods}">
											<xsl:for-each select="accg_stz:RegulatingDoc">
												<xsl:if test="position()!=1"><br/></xsl:if>
												<xsl:apply-templates select="." mode="doc"/>
											</xsl:for-each>
										</td>
										<td class="bordered annot" rowspan="{$countGoods}">
											<xsl:for-each select="accg_stz:AccountDoc">
												<xsl:if test="position()!=1"><br/></xsl:if>
												<xsl:apply-templates select="." mode="doc"/>
											</xsl:for-each>
										</td>
									</tr>
									<xsl:for-each select="accg_stz:ExploitationGoodsDecl[1]/accg_stz:GoodsDeclnfo[position() &gt; 1]">
										<tr valign="top">
											<td class="bordered annot">
												<xsl:apply-templates select="accg_stz:GoodsNumber"/>
											</td>
											<td class="bordered annot">
												<xsl:for-each select="accg_stz:GoodsQuantity">
													<xsl:if test="position()!=1"><br/></xsl:if>
													<xsl:apply-templates select="." mode="quantity"/>
												</xsl:for-each>
											</td>
										</tr>
									</xsl:for-each>
									<xsl:for-each select="accg_stz:ExploitationGoodsDecl[position() &gt; 1]">
										<xsl:variable name="goodsPerDT2" select="count(accg_stz:GoodsDeclnfo)"/>
										<tr valign="top">
											<td class="bordered annot" rowspan="{$goodsPerDT2}">
												<xsl:apply-templates select="."/>
											</td>
											<td class="bordered annot">
												<xsl:apply-templates select="accg_stz:GoodsDeclnfo[1]/accg_stz:GoodsNumber"/>
											</td>
											<td class="bordered annot">
												<xsl:for-each select="accg_stz:GoodsDeclnfo[1]/accg_stz:GoodsQuantity">
													<xsl:if test="position()!=1"><br/></xsl:if>
													<xsl:apply-templates select="." mode="quantity"/>
												</xsl:for-each>
											</td>
										</tr>
										<xsl:for-each select="accg_stz:GoodsDeclnfo[position() &gt; 1]">
											<tr valign="top">
												<td class="bordered annot">
													<xsl:apply-templates select="accg_stz:GoodsNumber"/>
												</td>
												<td class="bordered annot">
													<xsl:for-each select="accg_stz:GoodsQuantity">
														<xsl:if test="position()!=1"><br/></xsl:if>
														<xsl:apply-templates select="." mode="quantity"/>
													</xsl:for-each>
												</td>
											</tr>
										</xsl:for-each>
									</xsl:for-each>
								</xsl:for-each>
							</tbody>
						</table>
						<table>
							<tbody>
								<tr align="center">
									<td class="bordered annot" colspan="7">III. Товары, изготовленные (полученные) из товаров, помещенных под таможенную процедуру свободной таможенной зоны, и потребленные при эксплуатации (содержании) объекта недвижимости</td>
								</tr>
								<tr align="center" valign="top">
									<td class="bordered annot">N п/п</td>
									<td class="bordered annot">Наименование товара/код товара</td>
									<td class="bordered annot">Код товара</td>
									<td class="bordered annot">Количество товара/единица измерения</td>
									<td class="bordered annot">Сведения об операциях по переработке</td>
									<td class="bordered annot">Сведения о документах, регламентирующих выполнение работ и нормативных затрат при эксплуатации (содержании) объекта недвижимости</td>
									<td class="bordered annot">Сведения о документах бухгалтерского учета</td>
								</tr>
								<tr align="center" valign="top">
									<td class="bordered annot">1</td>
									<td class="bordered annot">2</td>
									<td class="bordered annot">3</td>
									<td class="bordered annot">4</td>
									<td class="bordered annot">5</td>
									<td class="bordered annot">6</td>
									<td class="bordered annot">7</td>
								</tr>
								<xsl:for-each select="accg_stz:ExploitationProcessingGoods">
									<tr valign="top">
										<td class="bordered annot">
											<xsl:apply-templates select="accg_stz:Position"/>
										</td>
										<td class="bordered annot">
											<xsl:apply-templates select="accg_stz:GoodsDescription"/>											
										</td>
										<td class="bordered annot">
											<xsl:apply-templates select="accg_stz:GoodsTNVEDCode"/>
										</td>
										<td class="bordered annot">
											<xsl:for-each select="accg_stz:GoodsQuantity">
												<xsl:if test="position()!=1"><br1/></xsl:if>
												<xsl:apply-templates select="." mode="quantity"/>
											</xsl:for-each>
										</td>
										<td class="bordered annot">
											<xsl:apply-templates select="accg_stz:ProcessingOperations"/>
										</td>
										<td class="bordered annot">
											<xsl:for-each select="accg_stz:ExpluatationDoc">
												<xsl:if test="position() != 1"><br/></xsl:if>
												<xsl:apply-templates select="." mode="doc"/>
											</xsl:for-each>
										</td>
										<td class="bordered annot">
											<xsl:for-each select="accg_stz:AccountDoc">
												<xsl:if test="position() != 1"><br/></xsl:if>
												<xsl:apply-templates select="." mode="doc"/>
											</xsl:for-each>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
						<table>
							<tbody>
								<tr align="center">
									<td class="bordered annot" colspan="6">IV. Товары, помещенные под таможенную процедуру свободной таможенной зоны и использованные при изготовлении товара, потребленного при эксплуатации (обслуживании) объекта недвижимости</td>
								</tr>
								<tr align="center" valign="top">
									<td class="bordered annot">N п/п</td>
									<td class="bordered annot">Наименование товара</td>
									<td class="bordered annot">Регистрационный номер декларации на товары</td>
									<td class="bordered annot">Номер товара </td>
									<td class="bordered annot">Количество товара в основной единице измерения/кг</td>
									<td class="bordered annot">Количество товара/единица измерения количества</td>
								</tr>
								<tr align="center" valign="top">
									<td class="bordered annot">1</td>
									<td class="bordered annot">2</td>
									<td class="bordered annot">3</td>
									<td class="bordered annot">4</td>
									<td class="bordered annot">5</td>
									<td class="bordered annot">6</td>
								</tr>
								<xsl:for-each select="accg_stz:ExploitationProcessingGoods/accg_stz:UsedGoods">
									<xsl:variable name="countGoods" select="count(accg_stz:GoodsDecl/accg_stz:GoodsDeclnfo)"/>
									<tr valign="top">
										<td class="bordered annot" rowspan="{$countGoods}">
											<xsl:apply-templates select="accg_stz:Position"/>
										</td>
										<td class="bordered annot" rowspan="{$countGoods}">
											<xsl:apply-templates select="accg_stz:GoodsDescription"/>
											<xsl:text> / </xsl:text>
											<xsl:apply-templates select="accg_stz:GoodsTNVEDCode"/>
										</td>
										<xsl:variable name="goodsPerDT" select="count(accg_stz:GoodsDecl[1]/accg_stz:GoodsDeclnfo)"/>
										<td class="bordered annot" rowspan="{$goodsPerDT}">
											<xsl:apply-templates select="accg_stz:GoodsDecl[1]"/>
										</td>
										<td class="bordered annot">
											<xsl:apply-templates select="accg_stz:GoodsDecl[1]/accg_stz:GoodsDeclnfo[1]/accg_stz:GoodsNumber"/>
										</td>
										<td class="bordered annot">
											<xsl:for-each select="accg_stz:GoodsDecl[1]/accg_stz:GoodsDeclnfo[1]/accg_stz:GoodsQuantity">
												<xsl:if test="position()!=1"><br/></xsl:if>
												<xsl:apply-templates select="." mode="quantity"/>
											</xsl:for-each>
										</td>
										<td class="bordered annot" rowspan="{$countGoods}">
											<xsl:for-each select="accg_stz:GoodsQuantity">
												<xsl:if test="position()!=1"><br/></xsl:if>
												<xsl:apply-templates select="." mode="quantity"/>
											</xsl:for-each>
										</td>
									</tr>
									<xsl:for-each select="accg_stz:GoodsDecl[1]/accg_stz:GoodsDeclnfo[position() &gt; 1]">
										<tr valign="top">
											<td class="bordered annot">
												<xsl:apply-templates select="accg_stz:GoodsNumber"/>
											</td>
											<td class="bordered annot">
												<xsl:for-each select="accg_stz:GoodsQuantity">
													<xsl:if test="position()!=1"><br/></xsl:if>
													<xsl:apply-templates select="." mode="quantity"/>
												</xsl:for-each>
											</td>
										</tr>
									</xsl:for-each>
									<xsl:for-each select="accg_stz:GoodsDecl[position() &gt; 1]">
										<xsl:variable name="goodsPerDT2" select="count(accg_stz:GoodsDeclnfo)"/>
										<tr valign="top">
											<td class="bordered annot" rowspan="{$goodsPerDT2}">
												<xsl:apply-templates select="."/>
											</td>
											<td class="bordered annot">
												<xsl:apply-templates select="accg_stz:GoodsDeclnfo[1]/accg_stz:GoodsNumber"/>
											</td>
											<td class="bordered annot">
												<xsl:for-each select="accg_stz:GoodsDeclnfo[1]/accg_stz:GoodsQuantity">
													<xsl:if test="position()!=1"><br/></xsl:if>
													<xsl:apply-templates select="." mode="quantity"/>
												</xsl:for-each>
											</td>
										</tr>
										<xsl:for-each select="accg_stz:GoodsDeclnfo[position() &gt; 1]">
											<tr valign="top">
												<td class="bordered annot">
													<xsl:apply-templates select="accg_stz:GoodsNumber"/>
												</td>
												<td class="bordered annot">
													<xsl:for-each select="accg_stz:GoodsQuantity">
														<xsl:if test="position()!=1"><br/></xsl:if>
														<xsl:apply-templates select="." mode="quantity"/>
													</xsl:for-each>
												</td>
											</tr>
										</xsl:for-each>
									</xsl:for-each>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:for-each>
					<br/>
					<div class="annot">&#160;&#160;&#160;&#160; Раздел 3. Товары, помещенным под таможенную процедуру свободной таможенной зоны, и товары, изготовленные (полученные) из товаров,
помещенных под таможенную процедуру свободной таможенной зоны, потребленные при ремонте (реконструкции, модернизации) объекта недвижимости, находящегося на территории участка резидента Арктической зоны
					</div>
					<br/>
					<xsl:for-each select="accg_stz:GoodsInfo/accg_stz:PropertyRepairGoods">
						<xsl:if test="position()!=1"><br/></xsl:if>
						<table>
							<tbody>
								<tr align="center">
									<td class="bordered annot" colspan="6">I. Объект недвижимости</td>
								</tr>
								<tr align="center" valign="top">
									<td class="bordered annot">№ п/п</td>
									<td class="bordered annot">Вид объекта недвижимости (с указанием наименования объекта недвижимости при наличии такого наименования) </td>
									<td class="bordered annot">Сведения об операции по ремонту (реконструкции, модернизации) объекта недвижимости, при совершении которой были потреблены товары</td>
									<td class="bordered annot">Сведения о технической документации </td>
									<td class="bordered annot">Сведения о документах, свидетельствующих о приеме-сдаче отремонтированного (реконструированного, модернизированного) объекта недвижимости</td>
									<td class="bordered annot">Примечание</td>
								</tr>
								<tr align="center" valign="top">
									<td class="bordered annot">1</td>
									<td class="bordered annot">2</td>
									<td class="bordered annot">3</td>
									<td class="bordered annot">4</td>
									<td class="bordered annot">5</td>
									<td class="bordered annot">6</td>
								</tr>
								<tr valign="top">
									<td class="bordered annot">
										<xsl:apply-templates select="accg_stz:Position"/>
									</td>
									<td class="bordered annot">
										<xsl:apply-templates select="accg_stz:PropertyName"/>
									</td>
									<td class="bordered annot">
										<xsl:apply-templates select="accg_stz:ProcessingOperations"/>
									</td>
									<td class="bordered annot">
										<xsl:for-each select="accg_stz:TechDoc">
											<xsl:if test="position()!=1"><br1/></xsl:if>
											<xsl:apply-templates select="." mode="doc"/>
										</xsl:for-each>
									</td>
									<td class="bordered annot">
										<xsl:for-each select="accg_stz:AcceptanceWork">
											<xsl:if test="position()!=1"><br1/></xsl:if>
											<xsl:apply-templates select="." mode="doc"/>
										</xsl:for-each>
									</td>
									<td class="bordered annot">
										<xsl:apply-templates select="accg_stz:Comment"/>
									</td>
								</tr>
							</tbody>
						</table>
						<table>
							<tbody>
								<tr align="center">
									<td class="bordered annot" colspan="7">II. Товары, помещенные под таможенную процедуру свободной таможенной зоны и потребленные при ремонте (реконструкции, модернизации) объекта недвижимости</td>
								</tr>
								<tr align="center" valign="top">
									<td class="bordered annot">N п/п</td>
									<td class="bordered annot">Наименование товара/код товара </td>
									<td class="bordered annot">Регистрационный номер декларации на товары</td>
									<td class="bordered annot">Номер товара </td>
									<td class="bordered annot">Количество товара в основной единице измерения/кг</td>
									<td class="bordered annot">Количество товара/единица измерения количества</td>
									<td class="bordered annot">Сведения о документах бухгалтерского учета </td>
								</tr>
								<tr align="center" valign="top">
									<td class="bordered annot">1</td>
									<td class="bordered annot">2</td>
									<td class="bordered annot">3</td>
									<td class="bordered annot">4</td>
									<td class="bordered annot">5</td>
									<td class="bordered annot">6</td>
									<td class="bordered annot">7</td>
								</tr>
								<xsl:for-each select="accg_stz:RepairGoodsSTZ">
									<xsl:variable name="countGoods" select="count(accg_stz:RepairGoodsDecl/accg_stz:GoodsDeclnfo)"/>
									<tr valign="top">
										<td class="bordered annot" rowspan="{$countGoods}">
											<xsl:apply-templates select="accg_stz:Position"/>
										</td>
										<td class="bordered annot" rowspan="{$countGoods}">
											<xsl:apply-templates select="accg_stz:GoodsDescription"/>
											<xsl:text> / </xsl:text>
											<xsl:apply-templates select="accg_stz:GoodsTNVEDCode"/>
										</td>
										<xsl:variable name="goodsPerDT" select="count(accg_stz:RepairGoodsDecl[1]/accg_stz:GoodsDeclnfo)"/>
										<td class="bordered annot" rowspan="{$goodsPerDT}">
											<xsl:apply-templates select="accg_stz:RepairGoodsDecl[1]"/>
										</td>
										<td class="bordered annot">
											<xsl:apply-templates select="accg_stz:RepairGoodsDecl[1]/accg_stz:GoodsDeclnfo[1]/accg_stz:GoodsNumber"/>
										</td>
										<td class="bordered annot">
											<xsl:for-each select="accg_stz:RepairGoodsDecl[1]/accg_stz:GoodsDeclnfo[1]/accg_stz:GoodsQuantity">
												<xsl:if test="position()!=1"><br/></xsl:if>
												<xsl:apply-templates select="." mode="quantity"/>
											</xsl:for-each>
										</td>
										<td class="bordered annot" rowspan="{$countGoods}">
											<xsl:for-each select="accg_stz:GoodsQuantity">
												<xsl:if test="position()!=1"><br/></xsl:if>
												<xsl:apply-templates select="." mode="quantity"/>
											</xsl:for-each>
										</td>
										<td class="bordered annot" rowspan="{$countGoods}">
											<xsl:for-each select="accg_stz:AccountDoc">
												<xsl:if test="position()!=1"><br/></xsl:if>
												<xsl:apply-templates select="." mode="doc"/>
											</xsl:for-each>
										</td>
									</tr>
									<xsl:for-each select="accg_stz:RepairGoodsDecl[1]/accg_stz:GoodsDeclnfo[position() &gt; 1]">
										<tr valign="top">
											<td class="bordered annot">
												<xsl:apply-templates select="accg_stz:GoodsNumber"/>
											</td>
											<td class="bordered annot">
												<xsl:for-each select="accg_stz:GoodsQuantity">
													<xsl:if test="position()!=1"><br/></xsl:if>
													<xsl:apply-templates select="." mode="quantity"/>
												</xsl:for-each>
											</td>
										</tr>
									</xsl:for-each>
									<xsl:for-each select="accg_stz:RepairGoodsDecl[position() &gt; 1]">
										<xsl:variable name="goodsPerDT2" select="count(accg_stz:GoodsDeclnfo)"/>
										<tr valign="top">
											<td class="bordered annot" rowspan="{$goodsPerDT2}">
												<xsl:apply-templates select="."/>
											</td>
											<td class="bordered annot">
												<xsl:apply-templates select="accg_stz:GoodsDeclnfo[1]/accg_stz:GoodsNumber"/>
											</td>
											<td class="bordered annot">
												<xsl:for-each select="accg_stz:GoodsDeclnfo[1]/accg_stz:GoodsQuantity">
													<xsl:if test="position()!=1"><br/></xsl:if>
													<xsl:apply-templates select="." mode="quantity"/>
												</xsl:for-each>
											</td>
										</tr>
										<xsl:for-each select="accg_stz:GoodsDeclnfo[position() &gt; 1]">
											<tr valign="top">
												<td class="bordered annot">
													<xsl:apply-templates select="accg_stz:GoodsNumber"/>
												</td>
												<td class="bordered annot">
													<xsl:for-each select="accg_stz:GoodsQuantity">
														<xsl:if test="position()!=1"><br/></xsl:if>
														<xsl:apply-templates select="." mode="quantity"/>
													</xsl:for-each>
												</td>
											</tr>
										</xsl:for-each>
									</xsl:for-each>
								</xsl:for-each>
							</tbody>
						</table>
						<table>
							<tbody>
								<tr align="center">
									<td class="bordered annot" colspan="6">III. Товары, изготовленные (полученные) из товаров, помещенных под таможенную процедуру свободной таможенной зоны и потребленные при ремонте (реконструкции, модернизации) объекта недвижимости </td>
								</tr>
								<tr align="center" valign="top">
									<td class="bordered annot">N п/п</td>
									<td class="bordered annot">Наименование товара/код товара</td>
									<td class="bordered annot">Код товара</td>
									<td class="bordered annot">Количество товара/единица измерения</td>
									<td class="bordered annot">Сведения об операциях по переработке</td>
									<td class="bordered annot">Сведения о документах бухгалтерского учета</td>
								</tr>
								<tr align="center" valign="top">
									<td class="bordered annot">1</td>
									<td class="bordered annot">2</td>
									<td class="bordered annot">3</td>
									<td class="bordered annot">4</td>
									<td class="bordered annot">5</td>
									<td class="bordered annot">6</td>
								</tr>
								<xsl:for-each select="accg_stz:RepairProceccingGoods">
									<tr valign="top">
										<td class="bordered annot">
											<xsl:apply-templates select="accg_stz:Position"/>
										</td>
										<td class="bordered annot">
											<xsl:apply-templates select="accg_stz:GoodsDescription"/>											
										</td>
										<td class="bordered annot">
											<xsl:apply-templates select="accg_stz:GoodsTNVEDCode"/>
										</td>
										<td class="bordered annot">
											<xsl:for-each select="accg_stz:GoodsQuantity">
												<xsl:if test="position()!=1"><br1/></xsl:if>
												<xsl:apply-templates select="." mode="quantity"/>
											</xsl:for-each>
										</td>
										<td class="bordered annot">
											<xsl:apply-templates select="accg_stz:ProcessingOperations"/>
										</td>
										<td class="bordered annot">
											<xsl:for-each select="accg_stz:AccountDoc">
												<xsl:if test="position() != 1"><br/></xsl:if>
												<xsl:apply-templates select="." mode="doc"/>
											</xsl:for-each>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
						<table>
							<tbody>
								<tr align="center">
									<td class="bordered annot" colspan="6">IV. Товары, помещенные под таможенную процедуру свободной таможенной зоны и использованные при изготовлении товара, потребленного при эксплуатации (обслуживании) объекта недвижимости</td>
								</tr>
								<tr align="center" valign="top">
									<td class="bordered annot">N п/п</td>
									<td class="bordered annot">Наименование товара</td>
									<td class="bordered annot">Регистрационный номер декларации на товары</td>
									<td class="bordered annot">Номер товара </td>
									<td class="bordered annot">Количество товара в основной единице измерения/кг</td>
									<td class="bordered annot">Количество товара/единица измерения количества</td>
								</tr>
								<tr align="center" valign="top">
									<td class="bordered annot">1</td>
									<td class="bordered annot">2</td>
									<td class="bordered annot">3</td>
									<td class="bordered annot">4</td>
									<td class="bordered annot">5</td>
									<td class="bordered annot">6</td>
								</tr>
								<xsl:for-each select="accg_stz:RepairProceccingGoods/accg_stz:UsedGoods">
									<xsl:variable name="countGoods" select="count(accg_stz:GoodsDecl/accg_stz:GoodsDeclnfo)"/>
									<tr valign="top">
										<td class="bordered annot" rowspan="{$countGoods}">
											<xsl:apply-templates select="accg_stz:Position"/>
										</td>
										<td class="bordered annot" rowspan="{$countGoods}">
											<xsl:apply-templates select="accg_stz:GoodsDescription"/>
											<xsl:text> / </xsl:text>
											<xsl:apply-templates select="accg_stz:GoodsTNVEDCode"/>
										</td>
										<xsl:variable name="goodsPerDT" select="count(accg_stz:GoodsDecl[1]/accg_stz:GoodsDeclnfo)"/>
										<td class="bordered annot" rowspan="{$goodsPerDT}">
											<xsl:apply-templates select="accg_stz:GoodsDecl[1]"/>
										</td>
										<td class="bordered annot">
											<xsl:apply-templates select="accg_stz:GoodsDecl[1]/accg_stz:GoodsDeclnfo[1]/accg_stz:GoodsNumber"/>
										</td>
										<td class="bordered annot">
											<xsl:for-each select="accg_stz:GoodsDecl[1]/accg_stz:GoodsDeclnfo[1]/accg_stz:GoodsQuantity">
												<xsl:if test="position()!=1"><br/></xsl:if>
												<xsl:apply-templates select="." mode="quantity"/>
											</xsl:for-each>
										</td>
										<td class="bordered annot" rowspan="{$countGoods}">
											<xsl:for-each select="accg_stz:GoodsQuantity">
												<xsl:if test="position()!=1"><br/></xsl:if>
												<xsl:apply-templates select="." mode="quantity"/>
											</xsl:for-each>
										</td>
									</tr>
									<xsl:for-each select="accg_stz:GoodsDecl[1]/accg_stz:GoodsDeclnfo[position() &gt; 1]">
										<tr valign="top">
											<td class="bordered annot">
												<xsl:apply-templates select="accg_stz:GoodsNumber"/>
											</td>
											<td class="bordered annot">
												<xsl:for-each select="accg_stz:GoodsQuantity">
													<xsl:if test="position()!=1"><br/></xsl:if>
													<xsl:apply-templates select="." mode="quantity"/>
												</xsl:for-each>
											</td>
										</tr>
									</xsl:for-each>
									<xsl:for-each select="accg_stz:GoodsDecl[position() &gt; 1]">
										<xsl:variable name="goodsPerDT2" select="count(accg_stz:GoodsDeclnfo)"/>
										<tr valign="top">
											<td class="bordered annot" rowspan="{$goodsPerDT2}">
												<xsl:apply-templates select="."/>
											</td>
											<td class="bordered annot">
												<xsl:apply-templates select="accg_stz:GoodsDeclnfo[1]/accg_stz:GoodsNumber"/>
											</td>
											<td class="bordered annot">
												<xsl:for-each select="accg_stz:GoodsDeclnfo[1]/accg_stz:GoodsQuantity">
													<xsl:if test="position()!=1"><br/></xsl:if>
													<xsl:apply-templates select="." mode="quantity"/>
												</xsl:for-each>
											</td>
										</tr>
										<xsl:for-each select="accg_stz:GoodsDeclnfo[position() &gt; 1]">
											<tr valign="top">
												<td class="bordered annot">
													<xsl:apply-templates select="accg_stz:GoodsNumber"/>
												</td>
												<td class="bordered annot">
													<xsl:for-each select="accg_stz:GoodsQuantity">
														<xsl:if test="position()!=1"><br/></xsl:if>
														<xsl:apply-templates select="." mode="quantity"/>
													</xsl:for-each>
												</td>
											</tr>
										</xsl:for-each>
									</xsl:for-each>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:for-each>
					<br/>
					<div class="annot">&#160;&#160;&#160;&#160; Раздел 4. Товары, помещенные под таможенную процедуру свободной таможенной зоны, и товары, изготовленные (полученные) из товаров,
помещенных под таможенную процедуру свободной таможенной зоны, потребленные при эксплуатации и (или) техническом обслуживании оборудования, машин и
агрегатов, помещенных под таможенную процедуру свободной таможенной зоны ииспользуемых на территории участка резидента Арктической зоны
					</div>
					<br/>
					<xsl:for-each select="accg_stz:GoodsInfo/accg_stz:EquipmentExplGoods">
						<xsl:if test="position()!=1"><br/></xsl:if>
						<table>
							<tbody>
								<tr align="center">
									<td class="bordered annot" colspan="8">I. Оборудование (машина, агрегат), помещенное под таможенную процедуру свободной таможенной зоны</td>
								</tr>
								<tr align="center" valign="top">
									<td class="bordered annot">№ п/п</td>
									<td class="bordered annot">Наименование оборудования</td>
									<td class="bordered annot">Регистрационный номер декларации на товары</td>
									<td class="bordered annot">Номер товара</td>
									<td class="bordered annot">Количество/единица измерения </td>
									<td class="bordered annot">Сведения о постановке оборудования на баланс </td>
									<td class="bordered annot">Сведения о документе, свидетельствующем о вводе оборудования в эксплуатацию</td>
									<td class="bordered annot">Примечание</td>
								</tr>
								<tr align="center" valign="top">
									<td class="bordered annot">1</td>
									<td class="bordered annot">2</td>
									<td class="bordered annot">3</td>
									<td class="bordered annot">4</td>
									<td class="bordered annot">5</td>
									<td class="bordered annot">6</td>
									<td class="bordered annot">7</td>
									<td class="bordered annot">8</td>
								</tr>
								<tr valign="top">
									<xsl:variable name="equipmentCount" select="count(accg_stz:EquipmentType)"/>
									<td class="bordered annot" rowspan="{$equipmentCount}">
										<xsl:apply-templates select="accg_stz:Position"/>
									</td>
									<td class="bordered annot" rowspan="{$equipmentCount}">
										<xsl:apply-templates select="accg_stz:EquipmentName"/>
									</td>
									<td class="bordered annot">
										<xsl:apply-templates select="accg_stz:EquipmentType[1]"/>
									</td>
									<td class="bordered annot">
										<xsl:apply-templates select="accg_stz:EquipmentType[1]/accg_stz:GoodsNumber"/>
									</td>
									<td class="bordered annot">
										<xsl:for-each select="accg_stz:EquipmentType[1]/accg_stz:GoodsQuantity">
											<xsl:if test="position()!=1"><br/></xsl:if>
											<xsl:apply-templates select="." mode="quantity"/>
										</xsl:for-each>
									</td>
									<td class="bordered annot">
										<xsl:for-each select="accg_stz:EquipmentType[1]/accg_stz:PropertyBalanceSheet">
											<xsl:if test="position()!=1"><br/></xsl:if>
											<xsl:apply-templates select="." mode="doc"/>
										</xsl:for-each>
									</td>
									<td class="bordered annot">
										<xsl:for-each select="accg_stz:EquipmentType[1]/accg_stz:CommissioningDoc">
											<xsl:if test="position()!=1"><br/></xsl:if>
											<xsl:apply-templates select="." mode="doc"/>
										</xsl:for-each>
									</td>
									<td class="bordered annot">
										<xsl:apply-templates select="accg_stz:EquipmentType[1]/accg_stz:Comment"/>
									</td>
								</tr>
								<xsl:for-each select="accg_stz:EquipmentType[position() &gt; 1]">
									<tr valign="top">
										<td class="bordered annot">
											<xsl:apply-templates select="."/>
										</td>
										<td class="bordered annot">
											<xsl:apply-templates select="accg_stz:GoodsNumber"/>
										</td>
										<td class="bordered annot">
											<xsl:for-each select="accg_stz:GoodsQuantity">
												<xsl:if test="position()!=1"><br/></xsl:if>
												<xsl:apply-templates select="." mode="quantity"/>
											</xsl:for-each>
										</td>
										<td class="bordered annot">
											<xsl:for-each select="accg_stz:PropertyBalanceSheet">
												<xsl:if test="position()!=1"><br/></xsl:if>
												<xsl:apply-templates select="." mode="doc"/>
											</xsl:for-each>
										</td>
										<td class="bordered annot">
											<xsl:for-each select="accg_stz:CommissioningDoc">
												<xsl:if test="position()!=1"><br/></xsl:if>
												<xsl:apply-templates select="." mode="doc"/>
											</xsl:for-each>
										</td>
										<td class="bordered annot">
											<xsl:apply-templates select="accg_stz:Comment"/>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
						<table>
							<tbody>
								<tr align="center">
									<td class="bordered annot" colspan="8">II. Товары, помещенные под таможенную процедуру свободной таможенной зоны и потребленные при эксплуатации и (или) техническом обслуживании оборудования, машин и агрегатов</td>
								</tr>
								<tr align="center" valign="top">
									<td class="bordered annot">N п/п</td>
									<td class="bordered annot">Наименование товара/код товара </td>
									<td class="bordered annot">Регистрационный номер декларации на товары</td>
									<td class="bordered annot">Номер товара </td>
									<td class="bordered annot">Количество товара в основной единице измерения/кг</td>
									<td class="bordered annot">Количество товара/единица измерения количества</td>
									<td class="bordered annot">Сведения об операциях по эксплуатации и техническому обслуживанию оборудования</td>
									<td class="bordered annot">Сведения о документах бухгалтерского учета </td>
								</tr>
								<tr align="center" valign="top">
									<td class="bordered annot">1</td>
									<td class="bordered annot">2</td>
									<td class="bordered annot">3</td>
									<td class="bordered annot">4</td>
									<td class="bordered annot">5</td>
									<td class="bordered annot">6</td>
									<td class="bordered annot">7</td>
									<td class="bordered annot">8</td>
								</tr>
								<xsl:for-each select="accg_stz:EquipmentType/accg_stz:EquipmentGoodsSTZ">
									<xsl:variable name="countGoods" select="count(accg_stz:EquipmentGoodsDecl/accg_stz:GoodsDeclnfo)"/>
									<tr valign="top">
										<td class="bordered annot" rowspan="{$countGoods}">
											<xsl:apply-templates select="accg_stz:Position"/>
										</td>
										<td class="bordered annot" rowspan="{$countGoods}">
											<xsl:apply-templates select="accg_stz:GoodsDescription"/>
											<xsl:text> / </xsl:text>
											<xsl:apply-templates select="accg_stz:GoodsTNVEDCode"/>
										</td>
										<xsl:variable name="goodsPerDT" select="count(accg_stz:EquipmentGoodsDecl[1]/accg_stz:GoodsDeclnfo)"/>
										<td class="bordered annot" rowspan="{$goodsPerDT}">
											<xsl:apply-templates select="accg_stz:EquipmentGoodsDecl[1]"/>
										</td>
										<td class="bordered annot">
											<xsl:apply-templates select="accg_stz:EquipmentGoodsDecl[1]/accg_stz:GoodsDeclnfo[1]/accg_stz:GoodsNumber"/>
										</td>
										<td class="bordered annot">
											<xsl:for-each select="accg_stz:EquipmentGoodsDecl[1]/accg_stz:GoodsDeclnfo[1]/accg_stz:GoodsQuantity">
												<xsl:if test="position()!=1"><br/></xsl:if>
												<xsl:apply-templates select="." mode="quantity"/>
											</xsl:for-each>
										</td>
										<td class="bordered annot" rowspan="{$countGoods}">
											<xsl:for-each select="accg_stz:GoodsQuantity">
												<xsl:if test="position()!=1"><br/></xsl:if>
												<xsl:apply-templates select="." mode="quantity"/>
											</xsl:for-each>
										</td>
										<td class="bordered annot" rowspan="{$countGoods}">
											<xsl:for-each select="accg_stz:OperationsDoc">
												<xsl:if test="position()!=1"><br/></xsl:if>
												<xsl:apply-templates select="." mode="doc"/>
											</xsl:for-each>
										</td>
										<td class="bordered annot" rowspan="{$countGoods}">
											<xsl:for-each select="accg_stz:AccountDoc">
												<xsl:if test="position()!=1"><br/></xsl:if>
												<xsl:apply-templates select="." mode="doc"/>
											</xsl:for-each>
										</td>
									</tr>
									<xsl:for-each select="accg_stz:EquipmentGoodsDecl[1]/accg_stz:GoodsDeclnfo[position() &gt; 1]">
										<tr valign="top">
											<td class="bordered annot">
												<xsl:apply-templates select="accg_stz:GoodsNumber"/>
											</td>
											<td class="bordered annot">
												<xsl:for-each select="accg_stz:GoodsQuantity">
													<xsl:if test="position()!=1"><br/></xsl:if>
													<xsl:apply-templates select="." mode="quantity"/>
												</xsl:for-each>
											</td>
										</tr>
									</xsl:for-each>
									<xsl:for-each select="accg_stz:EquipmentGoodsDecl[position() &gt; 1]">
										<xsl:variable name="goodsPerDT2" select="count(accg_stz:GoodsDeclnfo)"/>
										<tr valign="top">
											<td class="bordered annot" rowspan="{$goodsPerDT2}">
												<xsl:apply-templates select="."/>
											</td>
											<td class="bordered annot">
												<xsl:apply-templates select="accg_stz:GoodsDeclnfo[1]/accg_stz:GoodsNumber"/>
											</td>
											<td class="bordered annot">
												<xsl:for-each select="accg_stz:GoodsDeclnfo[1]/accg_stz:GoodsQuantity">
													<xsl:if test="position()!=1"><br/></xsl:if>
													<xsl:apply-templates select="." mode="quantity"/>
												</xsl:for-each>
											</td>
										</tr>
										<xsl:for-each select="accg_stz:GoodsDeclnfo[position() &gt; 1]">
											<tr valign="top">
												<td class="bordered annot">
													<xsl:apply-templates select="accg_stz:GoodsNumber"/>
												</td>
												<td class="bordered annot">
													<xsl:for-each select="accg_stz:GoodsQuantity">
														<xsl:if test="position()!=1"><br/></xsl:if>
														<xsl:apply-templates select="." mode="quantity"/>
													</xsl:for-each>
												</td>
											</tr>
										</xsl:for-each>
									</xsl:for-each>
								</xsl:for-each>
							</tbody>
						</table>
						<table>
							<tbody>
								<tr align="center">
									<td class="bordered annot" colspan="7">III. Товары, изготовленные (полученные) из товаров, помещенных под таможенную процедуру свободной таможенной зоны и потребленные при эксплуатации и (или) техническом обслуживании оборудования, машин и агрегатов </td>
								</tr>
								<tr align="center" valign="top">
									<td class="bordered annot">N п/п</td>
									<td class="bordered annot">Наименование товара/код товара</td>
									<td class="bordered annot">Код товара</td>
									<td class="bordered annot">Количество товара/единица измерения</td>
									<td class="bordered annot">Сведения об операциях по переработке</td>
									<td class="bordered annot">Сведения об операциях по эксплуатации и техническому обслуживанию оборудования</td>
									<td class="bordered annot">Сведения о документах бухгалтерского учета</td>
								</tr>
								<tr align="center" valign="top">
									<td class="bordered annot">1</td>
									<td class="bordered annot">2</td>
									<td class="bordered annot">3</td>
									<td class="bordered annot">4</td>
									<td class="bordered annot">5</td>
									<td class="bordered annot">6</td>
									<td class="bordered annot">7</td>
								</tr>
								<xsl:for-each select="accg_stz:EquipmentType/accg_stz:EquipmentProcessingGoods">
									<tr valign="top">
										<td class="bordered annot">
											<xsl:apply-templates select="accg_stz:Position"/>
										</td>
										<td class="bordered annot">
											<xsl:apply-templates select="accg_stz:GoodsDescription"/>											
										</td>
										<td class="bordered annot">
											<xsl:apply-templates select="accg_stz:GoodsTNVEDCode"/>
										</td>
										<td class="bordered annot">
											<xsl:for-each select="accg_stz:GoodsQuantity">
												<xsl:if test="position()!=1"><br1/></xsl:if>
												<xsl:apply-templates select="." mode="quantity"/>
											</xsl:for-each>
										</td>
										<td class="bordered annot">
											<xsl:apply-templates select="accg_stz:ProcessingOperations"/>
										</td>
										<td class="bordered annot">
											<xsl:for-each select="accg_stz:ExpluatationDoc">
												<xsl:if test="position() != 1"><br/></xsl:if>
												<xsl:apply-templates select="." mode="doc"/>
											</xsl:for-each>
										</td>
										<td class="bordered annot">
											<xsl:for-each select="accg_stz:AccountDoc">
												<xsl:if test="position() != 1"><br/></xsl:if>
												<xsl:apply-templates select="." mode="doc"/>
											</xsl:for-each>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
						<table>
							<tbody>
								<tr align="center">
									<td class="bordered annot" colspan="6">IV. Товары, помещенные под таможенную процедуру свободной таможенной зоны и использованные при изготовлении товара, потребленного при эксплуатации и (или) техническом обслуживании оборудования, машин и агрегатов</td>
								</tr>
								<tr align="center" valign="top">
									<td class="bordered annot">N п/п</td>
									<td class="bordered annot">Наименование товара</td>
									<td class="bordered annot">Регистрационный номер декларации на товары</td>
									<td class="bordered annot">Номер товара </td>
									<td class="bordered annot">Количество товара в основной единице измерения/кг</td>
									<td class="bordered annot">Количество товара/единица измерения количества</td>
								</tr>
								<tr align="center" valign="top">
									<td class="bordered annot">1</td>
									<td class="bordered annot">2</td>
									<td class="bordered annot">3</td>
									<td class="bordered annot">4</td>
									<td class="bordered annot">5</td>
									<td class="bordered annot">6</td>
								</tr>
								<xsl:for-each select="accg_stz:EquipmentType/accg_stz:EquipmentProcessingGoods/accg_stz:UsedGoods">
									<xsl:variable name="countGoods" select="count(accg_stz:GoodsDecl/accg_stz:GoodsDeclnfo)"/>
									<tr valign="top">
										<td class="bordered annot" rowspan="{$countGoods}">
											<xsl:apply-templates select="accg_stz:Position"/>
										</td>
										<td class="bordered annot" rowspan="{$countGoods}">
											<xsl:apply-templates select="accg_stz:GoodsDescription"/>
											<xsl:text> / </xsl:text>
											<xsl:apply-templates select="accg_stz:GoodsTNVEDCode"/>
										</td>
										<xsl:variable name="goodsPerDT" select="count(accg_stz:GoodsDecl[1]/accg_stz:GoodsDeclnfo)"/>
										<td class="bordered annot" rowspan="{$goodsPerDT}">
											<xsl:apply-templates select="accg_stz:GoodsDecl[1]"/>
										</td>
										<td class="bordered annot">
											<xsl:apply-templates select="accg_stz:GoodsDecl[1]/accg_stz:GoodsDeclnfo[1]/accg_stz:GoodsNumber"/>
										</td>
										<td class="bordered annot">
											<xsl:for-each select="accg_stz:GoodsDecl[1]/accg_stz:GoodsDeclnfo[1]/accg_stz:GoodsQuantity">
												<xsl:if test="position()!=1"><br/></xsl:if>
												<xsl:apply-templates select="." mode="quantity"/>
											</xsl:for-each>
										</td>
										<td class="bordered annot" rowspan="{$countGoods}">
											<xsl:for-each select="accg_stz:GoodsQuantity">
												<xsl:if test="position()!=1"><br/></xsl:if>
												<xsl:apply-templates select="." mode="quantity"/>
											</xsl:for-each>
										</td>
									</tr>
									<xsl:for-each select="accg_stz:GoodsDecl[1]/accg_stz:GoodsDeclnfo[position() &gt; 1]">
										<tr valign="top">
											<td class="bordered annot">
												<xsl:apply-templates select="accg_stz:GoodsNumber"/>
											</td>
											<td class="bordered annot">
												<xsl:for-each select="accg_stz:GoodsQuantity">
													<xsl:if test="position()!=1"><br/></xsl:if>
													<xsl:apply-templates select="." mode="quantity"/>
												</xsl:for-each>
											</td>
										</tr>
									</xsl:for-each>
									<xsl:for-each select="accg_stz:GoodsDecl[position() &gt; 1]">
										<xsl:variable name="goodsPerDT2" select="count(accg_stz:GoodsDeclnfo)"/>
										<tr valign="top">
											<td class="bordered annot" rowspan="{$goodsPerDT2}">
												<xsl:apply-templates select="."/>
											</td>
											<td class="bordered annot">
												<xsl:apply-templates select="accg_stz:GoodsDeclnfo[1]/accg_stz:GoodsNumber"/>
											</td>
											<td class="bordered annot">
												<xsl:for-each select="accg_stz:GoodsDeclnfo[1]/accg_stz:GoodsQuantity">
													<xsl:if test="position()!=1"><br/></xsl:if>
													<xsl:apply-templates select="." mode="quantity"/>
												</xsl:for-each>
											</td>
										</tr>
										<xsl:for-each select="accg_stz:GoodsDeclnfo[position() &gt; 1]">
											<tr valign="top">
												<td class="bordered annot">
													<xsl:apply-templates select="accg_stz:GoodsNumber"/>
												</td>
												<td class="bordered annot">
													<xsl:for-each select="accg_stz:GoodsQuantity">
														<xsl:if test="position()!=1"><br/></xsl:if>
														<xsl:apply-templates select="." mode="quantity"/>
													</xsl:for-each>
												</td>
											</tr>
										</xsl:for-each>
									</xsl:for-each>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:for-each>
					<br/>
					<div class="annot">&#160;&#160;&#160;&#160; Раздел 5. Товары, помещенные под таможенную процедуру свободной таможенной зоны, и товары, изготовленные (полученные) из товаров,
помещенных под таможенную процедуру свободной таможенной зоны, потребленные при проведении резидентом Арктической зоны исследований, испытаний,
тестирований, проверок, опытов или экспериментов в целях реализации соглашения об осуществлении инвестиционной деятельности на территории Арктической зоны
					</div>
					<br/>
					<xsl:for-each select="accg_stz:GoodsInfo/accg_stz:ResearchGoods">
						<xsl:if test="position()!=1"><br/></xsl:if>
						<table>
							<tbody>
								<tr align="center">
									<td class="bordered annot" colspan="6">I. Сведения о проведенном исследовании </td>
								</tr>
								<tr align="center" valign="top">
									<td class="bordered annot">№ п/п</td>
									<td class="bordered annot">Описание проведенного исследования </td>
									<td class="bordered annot">Сведения о документах, регламентирующих проведение исследования </td>
									<td class="bordered annot">Сведения о документах, свидетельствующих о завершении исследования</td>
									<td class="bordered annot">Примечание</td>
								</tr>
								<tr align="center" valign="top">
									<td class="bordered annot">1</td>
									<td class="bordered annot">2</td>
									<td class="bordered annot">3</td>
									<td class="bordered annot">4</td>
									<td class="bordered annot">5</td>
								</tr>
								<tr valign="top">
									<td class="bordered annot">
										<xsl:apply-templates select="accg_stz:Position"/>
									</td>
									<td class="bordered annot">
										<xsl:apply-templates select="accg_stz:ResearchInfo"/>
									</td>
									<td class="bordered annot">
										<xsl:for-each select="accg_stz:ReglamentDoc">
											<xsl:if test="position()!=1"><br1/></xsl:if>
											<xsl:apply-templates select="." mode="doc"/>
										</xsl:for-each>
									</td>
									<td class="bordered annot">
										<xsl:for-each select="accg_stz:EndResearchDoc">
											<xsl:if test="position()!=1"><br1/></xsl:if>
											<xsl:apply-templates select="." mode="doc"/>
										</xsl:for-each>
									</td>
									<td class="bordered annot">
										<xsl:apply-templates select="accg_stz:Comment"/>
									</td>
								</tr>
							</tbody>
						</table>
						<table>
							<tbody>
								<tr align="center">
									<td class="bordered annot" colspan="7">II. Товары, помещенные под таможенную процедуру свободной таможенной зоны и потребленные при проведении исследования (испытания, тестирования, проверки, опыта, эксперимента) </td>
								</tr>
								<tr align="center" valign="top">
									<td class="bordered annot">N п/п</td>
									<td class="bordered annot">Наименование товара/код товара </td>
									<td class="bordered annot">Регистрационный номер декларации на товары</td>
									<td class="bordered annot">Номер товара </td>
									<td class="bordered annot">Количество товара в основной единице измерения/кг</td>
									<td class="bordered annot">Количество товара/единица измерения количества</td>
									<td class="bordered annot">Сведения о документах бухгалтерского учета </td>
								</tr>
								<tr align="center" valign="top">
									<td class="bordered annot">1</td>
									<td class="bordered annot">2</td>
									<td class="bordered annot">3</td>
									<td class="bordered annot">4</td>
									<td class="bordered annot">5</td>
									<td class="bordered annot">6</td>
									<td class="bordered annot">7</td>
								</tr>
								<xsl:for-each select="accg_stz:ResearchGoodsSTZ">
									<xsl:variable name="countGoods" select="count(accg_stz:ResearchGoodsDecl/accg_stz:GoodsDeclnfo)"/>
									<tr valign="top">
										<td class="bordered annot" rowspan="{$countGoods}">
											<xsl:apply-templates select="accg_stz:Position"/>
										</td>
										<td class="bordered annot" rowspan="{$countGoods}">
											<xsl:apply-templates select="accg_stz:GoodsDescription"/>
											<xsl:text> / </xsl:text>
											<xsl:apply-templates select="accg_stz:GoodsTNVEDCode"/>
										</td>
										<xsl:variable name="goodsPerDT" select="count(accg_stz:ResearchGoodsDecl[1]/accg_stz:GoodsDeclnfo)"/>
										<td class="bordered annot" rowspan="{$goodsPerDT}">
											<xsl:apply-templates select="accg_stz:ResearchGoodsDecl[1]"/>
										</td>
										<td class="bordered annot">
											<xsl:apply-templates select="accg_stz:ResearchGoodsDecl[1]/accg_stz:GoodsDeclnfo[1]/accg_stz:GoodsNumber"/>
										</td>
										<td class="bordered annot">
											<xsl:for-each select="accg_stz:ResearchGoodsDecl[1]/accg_stz:GoodsDeclnfo[1]/accg_stz:GoodsQuantity">
												<xsl:if test="position()!=1"><br/></xsl:if>
												<xsl:apply-templates select="." mode="quantity"/>
											</xsl:for-each>
										</td>
										<td class="bordered annot" rowspan="{$countGoods}">
											<xsl:for-each select="accg_stz:GoodsQuantity">
												<xsl:if test="position()!=1"><br/></xsl:if>
												<xsl:apply-templates select="." mode="quantity"/>
											</xsl:for-each>
										</td>
										<td class="bordered annot" rowspan="{$countGoods}">
											<xsl:for-each select="accg_stz:AccountDoc">
												<xsl:if test="position()!=1"><br/></xsl:if>
												<xsl:apply-templates select="." mode="doc"/>
											</xsl:for-each>
										</td>
									</tr>
									<xsl:for-each select="accg_stz:ResearchGoodsDecl[1]/accg_stz:GoodsDeclnfo[position() &gt; 1]">
										<tr valign="top">
											<td class="bordered annot">
												<xsl:apply-templates select="accg_stz:GoodsNumber"/>
											</td>
											<td class="bordered annot">
												<xsl:for-each select="accg_stz:GoodsQuantity">
													<xsl:if test="position()!=1"><br/></xsl:if>
													<xsl:apply-templates select="." mode="quantity"/>
												</xsl:for-each>
											</td>
										</tr>
									</xsl:for-each>
									<xsl:for-each select="accg_stz:ResearchGoodsDecl[position() &gt; 1]">
										<xsl:variable name="goodsPerDT2" select="count(accg_stz:GoodsDeclnfo)"/>
										<tr valign="top">
											<td class="bordered annot" rowspan="{$goodsPerDT2}">
												<xsl:apply-templates select="."/>
											</td>
											<td class="bordered annot">
												<xsl:apply-templates select="accg_stz:GoodsDeclnfo[1]/accg_stz:GoodsNumber"/>
											</td>
											<td class="bordered annot">
												<xsl:for-each select="accg_stz:GoodsDeclnfo[1]/accg_stz:GoodsQuantity">
													<xsl:if test="position()!=1"><br/></xsl:if>
													<xsl:apply-templates select="." mode="quantity"/>
												</xsl:for-each>
											</td>
										</tr>
										<xsl:for-each select="accg_stz:GoodsDeclnfo[position() &gt; 1]">
											<tr valign="top">
												<td class="bordered annot">
													<xsl:apply-templates select="accg_stz:GoodsNumber"/>
												</td>
												<td class="bordered annot">
													<xsl:for-each select="accg_stz:GoodsQuantity">
														<xsl:if test="position()!=1"><br/></xsl:if>
														<xsl:apply-templates select="." mode="quantity"/>
													</xsl:for-each>
												</td>
											</tr>
										</xsl:for-each>
									</xsl:for-each>
								</xsl:for-each>
							</tbody>
						</table>
						<table>
							<tbody>
								<tr align="center">
									<td class="bordered annot" colspan="6">III. Товары, изготовленные (полученные) из товаров, помещенных под таможенную процедуру свободной таможенной зоны и потребленные при проведении исследования (испытании, тестировании, проверки, опыта, эксперимента)</td>
								</tr>
								<tr align="center" valign="top">
									<td class="bordered annot">N п/п</td>
									<td class="bordered annot">Наименование товара/код товара</td>
									<td class="bordered annot">Код товара</td>
									<td class="bordered annot">Количество товара/единица измерения</td>
									<td class="bordered annot">Сведения об операциях по переработке</td>
									<td class="bordered annot">Сведения о документах бухгалтерского учета</td>
								</tr>
								<tr align="center" valign="top">
									<td class="bordered annot">1</td>
									<td class="bordered annot">2</td>
									<td class="bordered annot">3</td>
									<td class="bordered annot">4</td>
									<td class="bordered annot">5</td>
									<td class="bordered annot">6</td>
								</tr>
								<xsl:for-each select="accg_stz:ResearchProcessingGoods">
									<tr valign="top">
										<td class="bordered annot">
											<xsl:apply-templates select="accg_stz:Position"/>
										</td>
										<td class="bordered annot">
											<xsl:apply-templates select="accg_stz:GoodsDescription"/>											
										</td>
										<td class="bordered annot">
											<xsl:apply-templates select="accg_stz:GoodsTNVEDCode"/>
										</td>
										<td class="bordered annot">
											<xsl:for-each select="accg_stz:GoodsQuantity">
												<xsl:if test="position()!=1"><br1/></xsl:if>
												<xsl:apply-templates select="." mode="quantity"/>
											</xsl:for-each>
										</td>
										<td class="bordered annot">
											<xsl:apply-templates select="accg_stz:ProcessingOperations"/>
										</td>
										<td class="bordered annot">
											<xsl:for-each select="accg_stz:AccountDoc">
												<xsl:if test="position() != 1"><br/></xsl:if>
												<xsl:apply-templates select="." mode="doc"/>
											</xsl:for-each>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
						<table>
							<tbody>
								<tr align="center">
									<td class="bordered annot" colspan="6">IV. Товары, помещенные под таможенную процедуру свободной таможенной зоны и использованные при изготовлении товара, потребленного при проведении исследования (испытания, тестирования, проверки, опыта, эксперимента)</td>
								</tr>
								<tr align="center" valign="top">
									<td class="bordered annot">N п/п</td>
									<td class="bordered annot">Наименование товара</td>
									<td class="bordered annot">Регистрационный номер декларации на товары</td>
									<td class="bordered annot">Номер товара </td>
									<td class="bordered annot">Количество товара в основной единице измерения/кг</td>
									<td class="bordered annot">Количество товара/единица измерения количества</td>
								</tr>
								<tr align="center" valign="top">
									<td class="bordered annot">1</td>
									<td class="bordered annot">2</td>
									<td class="bordered annot">3</td>
									<td class="bordered annot">4</td>
									<td class="bordered annot">5</td>
									<td class="bordered annot">6</td>
								</tr>
								<xsl:for-each select="accg_stz:ResearchProcessingGoods/accg_stz:UsedGoods">
									<xsl:variable name="countGoods" select="count(accg_stz:GoodsDecl/accg_stz:GoodsDeclnfo)"/>
									<tr valign="top">
										<td class="bordered annot" rowspan="{$countGoods}">
											<xsl:apply-templates select="accg_stz:Position"/>
										</td>
										<td class="bordered annot" rowspan="{$countGoods}">
											<xsl:apply-templates select="accg_stz:GoodsDescription"/>
											<xsl:text> / </xsl:text>
											<xsl:apply-templates select="accg_stz:GoodsTNVEDCode"/>
										</td>
										<xsl:variable name="goodsPerDT" select="count(accg_stz:GoodsDecl[1]/accg_stz:GoodsDeclnfo)"/>
										<td class="bordered annot" rowspan="{$goodsPerDT}">
											<xsl:apply-templates select="accg_stz:GoodsDecl[1]"/>
										</td>
										<td class="bordered annot">
											<xsl:apply-templates select="accg_stz:GoodsDecl[1]/accg_stz:GoodsDeclnfo[1]/accg_stz:GoodsNumber"/>
										</td>
										<td class="bordered annot">
											<xsl:for-each select="accg_stz:GoodsDecl[1]/accg_stz:GoodsDeclnfo[1]/accg_stz:GoodsQuantity">
												<xsl:if test="position()!=1"><br/></xsl:if>
												<xsl:apply-templates select="." mode="quantity"/>
											</xsl:for-each>
										</td>
										<td class="bordered annot" rowspan="{$countGoods}">
											<xsl:for-each select="accg_stz:GoodsQuantity">
												<xsl:if test="position()!=1"><br/></xsl:if>
												<xsl:apply-templates select="." mode="quantity"/>
											</xsl:for-each>
										</td>
									</tr>
									<xsl:for-each select="accg_stz:GoodsDecl[1]/accg_stz:GoodsDeclnfo[position() &gt; 1]">
										<tr valign="top">
											<td class="bordered annot">
												<xsl:apply-templates select="accg_stz:GoodsNumber"/>
											</td>
											<td class="bordered annot">
												<xsl:for-each select="accg_stz:GoodsQuantity">
													<xsl:if test="position()!=1"><br/></xsl:if>
													<xsl:apply-templates select="." mode="quantity"/>
												</xsl:for-each>
											</td>
										</tr>
									</xsl:for-each>
									<xsl:for-each select="accg_stz:GoodsDecl[position() &gt; 1]">
										<xsl:variable name="goodsPerDT2" select="count(accg_stz:GoodsDeclnfo)"/>
										<tr valign="top">
											<td class="bordered annot" rowspan="{$goodsPerDT2}">
												<xsl:apply-templates select="."/>
											</td>
											<td class="bordered annot">
												<xsl:apply-templates select="accg_stz:GoodsDeclnfo[1]/accg_stz:GoodsNumber"/>
											</td>
											<td class="bordered annot">
												<xsl:for-each select="accg_stz:GoodsDeclnfo[1]/accg_stz:GoodsQuantity">
													<xsl:if test="position()!=1"><br/></xsl:if>
													<xsl:apply-templates select="." mode="quantity"/>
												</xsl:for-each>
											</td>
										</tr>
										<xsl:for-each select="accg_stz:GoodsDeclnfo[position() &gt; 1]">
											<tr valign="top">
												<td class="bordered annot">
													<xsl:apply-templates select="accg_stz:GoodsNumber"/>
												</td>
												<td class="bordered annot">
													<xsl:for-each select="accg_stz:GoodsQuantity">
														<xsl:if test="position()!=1"><br/></xsl:if>
														<xsl:apply-templates select="." mode="quantity"/>
													</xsl:for-each>
												</td>
											</tr>
										</xsl:for-each>
									</xsl:for-each>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:for-each>
					<br/>
					<table>
						<tbody>
							<tr>
								<td class="annot">&#160;&#160;&#160;&#160;3. Опись представленных документов.
								</td>
							</tr>
						</tbody>
					</table>
					<table>
						<tbody>
							<tr valign="top" align="center">
								<td class="bordered annot">№ п/п</td>
								<td class="bordered annot">Наименование документа</td>
								<td class="bordered annot">Номер и дата документа </td>
								<td class="bordered annot">Количество листов</td>
							</tr>
							<tr valign="top" align="center">
								<td class="bordered annot">1</td>
								<td class="bordered annot">2</td>
								<td class="bordered annot">3</td>
								<td class="bordered annot">4</td>
							</tr>
							<xsl:for-each select="accg_stz:PresentedDoc">
								<tr valign="top">
									<td class="bordered annot">
										<xsl:apply-templates select="accg_stz:Position"/>
									</td>
									<td class="bordered annot">
										<xsl:apply-templates select="*[local-name() = 'PrDocumentName']"/>
									</td>
									<td class="bordered annot">
										<xsl:if test="*[local-name() = 'PrDocumentNumber']">
											<xsl:text>№ </xsl:text>
											<xsl:apply-templates select="*[local-name() = 'PrDocumentNumber']"/>
										</xsl:if>
										<xsl:if test="*[local-name() = 'PrDocumentDate']">
											<xsl:text> от </xsl:text>
											<xsl:apply-templates select="*[local-name() = 'PrDocumentDate']" mode="russian_date"/>
										</xsl:if>
									</td>
									<td class="bordered annot">
										<xsl:apply-templates select="accg_stz:SheetsNumber"/>
									</td>
								</tr>
							</xsl:for-each>
						</tbody>
					</table>
					<br/>
					<br/>
					<xsl:for-each select="accg_stz:ResidentSignature">
						<table>
							<tbody>
								<tr valign="bottom">
									<td class="value" width="30%">
										<xsl:apply-templates select="cat_ru:PersonPost"/>
									</td>
									<td width="2%"></td>
									<td class="value" width="15%"></td>
									<td width="2%"></td>
									<td class="value" width="51%">
										<xsl:apply-templates select="cat_ru:PersonSurname"/>
										<xsl:text> </xsl:text>
										<xsl:apply-templates select="cat_ru:PersonName"/>
										<xsl:text> </xsl:text>
										<xsl:apply-templates select="cat_ru:PersonMiddleName"/>
									</td>
								</tr>
								<tr align="center">
									<td class="descr">(Резидент Арктической зоны)</td>
									<td width="5%"></td>
									<td class="descr">(подпись)</td>
									<td width="5%"></td>
									<td class="descr">(Фамилия, имя, отчество (при наличии)</td>
								</tr>
							</tbody>
						</table>
					</xsl:for-each>
				</div>
			</body>
		</html>
	</xsl:template>
	
	<xsl:template match="*" mode="quantity">
		<xsl:apply-templates select="catESAD_cu:GoodsQuantity"/>
		<xsl:text> </xsl:text>
		<xsl:apply-templates select="catESAD_cu:MeasureUnitQualifierName"/>
		<xsl:if test="catESAD_cu:MeasureUnitQualifierCode">
			<xsl:text> (</xsl:text>
			<xsl:apply-templates select="catESAD_cu:MeasureUnitQualifierCode"/>
			<xsl:text>)</xsl:text>
		</xsl:if>
	</xsl:template>
	
	<xsl:template match="accg_stz:PropertyGoodsDecl | accg_stz:GoodsDecl | accg_stz:ExploitationGoodsDecl | accg_stz:RepairGoodsDecl | accg_stz:EquipmentType | accg_stz:EquipmentGoodsDecl | accg_stz:ResearchGoodsDecl">
		<xsl:apply-templates select="accg_stz:DeclRegNum" mode="reg_num"/>
		<xsl:apply-templates select="accg_stz:CustomsDoc" mode="doc"/>
	</xsl:template>
	
	<xsl:template match="*" mode="reg_num">
		<xsl:apply-templates select="*[local-name() = 'CustomsCode']"/>
		<xsl:text>/</xsl:text>
		<xsl:apply-templates select="*[local-name() = 'RegistrationDate']" mode="date_num"/>
		<xsl:text>/</xsl:text>
		<xsl:apply-templates select="*[local-name() = 'GTDNumber' or local-name() = 'Number']"/>
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
	
	<xsl:template match="accg_stz:PropertyLocation">
		<xsl:for-each select="*">
			<xsl:if test="position()!=1">, </xsl:if>
			<xsl:apply-templates select="."/>
		</xsl:for-each>
	</xsl:template>
	
	<xsl:template match="accg_stz:Resident">
		<xsl:value-of select="cat_ru:OrganizationName"/>
		<xsl:if test="cat_ru:ShortName">
			<xsl:text>, </xsl:text>
			<xsl:apply-templates select="cat_ru:ShortName"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:IdentityCard"> <!--физлицо-->
			<xsl:apply-templates select="RUScat_ru:SubjectAddressDetails" mode="address"/>
			<xsl:apply-templates select="cat_ru:RFOrganizationFeatures" mode="IKO"><xsl:with-param name="isFL" select="1"/></xsl:apply-templates>
			<xsl:apply-templates select="RUScat_ru:IdentityCard" mode="identity_card"/>
		</xsl:if>
		<xsl:if test="not(RUScat_ru:IdentityCard)"><!-- юрлицо -->
			<xsl:apply-templates select="cat_ru:RFOrganizationFeatures" mode="IKO"/>
			<xsl:apply-templates select="RUScat_ru:SubjectAddressDetails" mode="address"/>
		</xsl:if>
		<xsl:apply-templates select="accg_stz:ResidentCertificate"/>
	</xsl:template>
	
	<xsl:template match="accg_stz:ResidentCertificate">
		<xsl:text> свидетельство: </xsl:text>
		<xsl:text> № </xsl:text>
		<xsl:apply-templates select="accg_stz:CertificateNumber"/>
		<xsl:text> от </xsl:text>
		<xsl:apply-templates select="accg_stz:CertificateDate" mode="russian_date"/>
	</xsl:template>
	
	<xsl:template match="*" mode="identity_card">
		<xsl:text> документ: </xsl:text>
		<xsl:for-each select="*">
			<xsl:if test="position()!=1">, </xsl:if>
			<xsl:choose>
				<xsl:when test="contains(local-name(), 'Date')">
					<xsl:apply-templates select="." mode="russian_date"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:apply-templates select="."/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:for-each>
		<xsl:text>; </xsl:text>
	</xsl:template>
	
	<xsl:template match="*" mode="IKO">
		<xsl:param name="isFL" select="'0'"/>
		<xsl:for-each select="*">
			<xsl:choose>
				<xsl:when test="local-name() = 'INN'">
					<xsl:text> ИНН: </xsl:text><xsl:apply-templates select="."/><xsl:text>; </xsl:text>
				</xsl:when>
				<xsl:when test="local-name() = 'OGRN'">
					<xsl:text> ОГРН</xsl:text><xsl:if test="$isFL = '1'">ИП</xsl:if><xsl:text>: </xsl:text><xsl:apply-templates select="."/><xsl:text>; </xsl:text>
				</xsl:when>
				<xsl:when test="local-name() = 'KPP' and $isFL = '0'">
					<xsl:text> KPP: </xsl:text><xsl:apply-templates select="."/><xsl:text>; </xsl:text>
				</xsl:when>
			</xsl:choose>
		</xsl:for-each>
	</xsl:template>
	
	<xsl:template match="*" mode="address">
		<xsl:for-each select="*">
			<xsl:if test="position()!=1">, </xsl:if>
			<xsl:choose>
				<xsl:when test="local-name() = 'AddressKindCode'">
					<xsl:choose>
						<xsl:when test=". = 1"> адрес регистрации </xsl:when>
						<xsl:when test=". = 2"> фактический адрес </xsl:when>
						<xsl:when test=". = 3"> почтовый адрес </xsl:when>
						<xsl:otherwise><xsl:apply-templates select="."/></xsl:otherwise>
					</xsl:choose>
				</xsl:when>
				<xsl:otherwise>
					<xsl:apply-templates select="."/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:for-each>
		<xsl:text>; </xsl:text>
	</xsl:template>
	
	<xsl:template match="accg_stz:Customs">
		<xsl:apply-templates select="cat_ru:OfficeName"/>
		<xsl:text> </xsl:text>
		<xsl:value-of select="cat_ru:Code"/>
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
	<xsl:template name="date_num">
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
	<xsl:template match="//*[local-name()='AppCloseConsumedGoodsSTZ']//*" priority="-1">
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
	<xsl:template match="*" mode="date_num">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:call-template name="date_num">
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
