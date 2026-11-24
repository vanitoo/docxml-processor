<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.24.0" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" xmlns:catESAD_cu="urn:customs.ru:CUESADCommonAggregateTypesCust:5.28.0" xmlns:pccg_stz="urn:customs.ru:Information:CustomsDocuments:PermitCloseConsumedGoodsSTZ:5.28.0" xmlns:catProc_ru="urn:customs.ru:Information:ProcessingDocuments:ProcessingCommonAggregateTypes:5.28.0">
	<!-- Шаблон для типа PermitCloseConsumedGoodsSTZType -->
	<xsl:template match="pccg_stz:PermitCloseConsumedGoodsSTZ">
		<xsl:param name="w" select="277"/>
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
                  padding: 10mm 10mm 10mm 10mm;
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
													<xsl:text>Регистрационный № </xsl:text>
													<xsl:apply-templates select="pccg_stz:PermissionRegNumber" mode="reg_app_num"/>
												</td>
											</tr>
										</tbody>
									</table>
								</td>
								<td width="50%">
									<table>
										<tbody>
											<tr valign="top">
												<!--td class="annot">от</td-->
												<td class="value">
													<xsl:apply-templates select="pccg_stz:AppInfo/pccg_stz:AppCloseSTZ/pccg_stz:Resident"/>
												</td>
											</tr>
											<tr>
												<!--td></td-->
												<td class="descr">(наименование юридического лица или фамилия, имя, отчество (при наличии) индивидуального предпринимателя, являющегося резидентом Арктической зоны с указанием идентификационного номера налогоплательщика (ИНН), реквизиты свидетельства о включении в реестр резидентов Арктической зоны Российской Федерации)
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
										Решение<br/>
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
					<br/>
					<table>
						<tbody>
							<tr>
								<td class="annot">&#160;&#160;&#160;&#160;Настоящее решение свидетельствует о завершении действия таможенной процедуры свободной таможенной зоны в отношении товаров по заявлению N <xsl:apply-templates select="pccg_stz:AppInfo/pccg_stz:AppRegNum" mode="reg_app_num"/></td>
							</tr>
						</tbody>
					</table>
					<br/>
					<table>
						<tbody>
							<tr>
								<td class="annot">&#160;&#160;&#160;&#160;Сведения о товарах, помещенных под таможенную процедуру свободной таможенной зоны, в отношении которых действие таможенной процедуры завершено, на __<u>
										<xsl:apply-templates select="pccg_stz:SheetsNumber"/>
									</u>__ л.</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<br/>
					<div class="annot">&#160;&#160;&#160;&#160;Раздел   1.  Товары,  помещенные  под  таможенную  процедуру  свободной таможенной   зоны,   и   товары,  изготовленные  (полученные)  из  товаров, помещенных под таможенную процедуру свободной таможенной зоны, потребленные
при   создании   объектов  недвижимости  на  территории  участка  резидента Арктической   зоны  и  являющиеся  составной  (неотъемлемой)  частью  таких объектов недвижимости
					</div>
					<br/>
					<xsl:for-each select="pccg_stz:AppInfo/pccg_stz:AppCloseSTZ/pccg_stz:GoodsInfo/pccg_stz:PropertyCreateGoods">
						<xsl:if test="position()!=1"><br/></xsl:if>
						<table>
							<tbody>
								<tr align="center">
									<td class="bordered annot" colspan="7">I. Объект недвижимости</td>
								</tr>
								<tr align="center" valign="top">
									<td class="bordered annot">Вид объекта недвижимости (с указанием наименования объекта недвижимости при наличии такого наименования) </td>
									<td class="bordered annot">Решение</td>
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
									<td class="bordered annot">7</td>
								</tr>
								<tr valign="top">
									<td class="bordered annot">
										<xsl:apply-templates select="pccg_stz:PropertyName"/>
									</td>
									<td class="bordered annot">
										<xsl:apply-templates select="pccg_stz:Decision"/>
									</td>
									<td class="bordered annot">
										<xsl:apply-templates select="pccg_stz:PropertyLocation"/>
									</td>
									<td class="bordered annot">
										<xsl:for-each select="pccg_stz:TechDoc">
											<xsl:if test="position()!=1"><br1/></xsl:if>
											<xsl:apply-templates select="." mode="doc"/>
										</xsl:for-each>
									</td>
									<td class="bordered annot">
										<xsl:for-each select="pccg_stz:PropertyBalanceSheet">
											<xsl:if test="position()!=1"><br1/></xsl:if>
											<xsl:apply-templates select="." mode="doc"/>
										</xsl:for-each>
									</td>
									<td class="bordered annot">
										<xsl:for-each select="pccg_stz:OwnershipDoc">
											<xsl:if test="position()!=1"><br1/></xsl:if>
											<xsl:apply-templates select="." mode="doc"/>
										</xsl:for-each>
									</td>
									<td class="bordered annot">
										<xsl:apply-templates select="pccg_stz:Comment"/>
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
								<xsl:for-each select="pccg_stz:PropertyGoodsSTZ">
									<xsl:variable name="countGoods" select="count(pccg_stz:PropertyGoodsDecl/pccg_stz:GoodsDeclnfo)"/>
									<tr valign="top">
										<td class="bordered annot" rowspan="{$countGoods}">
											<xsl:apply-templates select="pccg_stz:Position"/>
										</td>
										<td class="bordered annot" rowspan="{$countGoods}">
											<xsl:apply-templates select="pccg_stz:GoodsDescription"/>
											<xsl:text> / </xsl:text>
											<xsl:apply-templates select="pccg_stz:GoodsTNVEDCode"/>
										</td>
										<xsl:variable name="goodsPerDT" select="count(pccg_stz:PropertyGoodsDecl[1]/pccg_stz:GoodsDeclnfo)"/>
										<td class="bordered annot" rowspan="{$goodsPerDT}">
											<xsl:apply-templates select="pccg_stz:PropertyGoodsDecl[1]"/>
										</td>
										<td class="bordered annot">
											<xsl:apply-templates select="pccg_stz:PropertyGoodsDecl[1]/pccg_stz:GoodsDeclnfo[1]/pccg_stz:GoodsNumber"/>
										</td>
										<td class="bordered annot">
											<xsl:for-each select="pccg_stz:PropertyGoodsDecl[1]/pccg_stz:GoodsDeclnfo[1]/pccg_stz:GoodsQuantity">
												<xsl:if test="position()!=1"><br/></xsl:if>
												<xsl:apply-templates select="." mode="quantity"/>
											</xsl:for-each>
										</td>
										<td class="bordered annot" rowspan="{$countGoods}">
											<xsl:for-each select="pccg_stz:GoodsQuantity">
												<xsl:if test="position()!=1"><br/></xsl:if>
												<xsl:apply-templates select="." mode="quantity"/>
											</xsl:for-each>
										</td>
										<td class="bordered annot" rowspan="{$countGoods}">
											<xsl:apply-templates select="pccg_stz:ComponentUseName"/>
										</td>
										<td class="bordered annot" rowspan="{$countGoods}">
											<xsl:for-each select="pccg_stz:AccountDoc">
												<xsl:if test="position()!=1"><br/></xsl:if>
												<xsl:apply-templates select="." mode="doc"/>
											</xsl:for-each>
										</td>
									</tr>
									<xsl:for-each select="pccg_stz:PropertyGoodsDecl[1]/pccg_stz:GoodsDeclnfo[position() &gt; 1]">
										<tr valign="top">
											<td class="bordered annot">
												<xsl:apply-templates select="pccg_stz:GoodsNumber"/>
											</td>
											<td class="bordered annot">
												<xsl:for-each select="pccg_stz:GoodsQuantity">
													<xsl:if test="position()!=1"><br/></xsl:if>
													<xsl:apply-templates select="." mode="quantity"/>
												</xsl:for-each>
											</td>
										</tr>
									</xsl:for-each>
									<xsl:for-each select="pccg_stz:PropertyGoodsDecl[position() &gt; 1]">
										<xsl:variable name="goodsPerDT2" select="count(pccg_stz:GoodsDeclnfo)"/>
										<tr valign="top">
											<td class="bordered annot" rowspan="{$goodsPerDT2}">
												<xsl:apply-templates select="."/>
											</td>
											<td class="bordered annot">
												<xsl:apply-templates select="pccg_stz:GoodsDeclnfo[1]/pccg_stz:GoodsNumber"/>
											</td>
											<td class="bordered annot">
												<xsl:for-each select="pccg_stz:GoodsDeclnfo[1]/pccg_stz:GoodsQuantity">
													<xsl:if test="position()!=1"><br/></xsl:if>
													<xsl:apply-templates select="." mode="quantity"/>
												</xsl:for-each>
											</td>
										</tr>
										<xsl:for-each select="pccg_stz:GoodsDeclnfo[position() &gt; 1]">
											<tr valign="top">
												<td class="bordered annot">
													<xsl:apply-templates select="pccg_stz:GoodsNumber"/>
												</td>
												<td class="bordered annot">
													<xsl:for-each select="pccg_stz:GoodsQuantity">
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
								<xsl:for-each select="pccg_stz:PropertyProcessingGoods">
									<tr valign="top">
										<td class="bordered annot">
											<xsl:apply-templates select="pccg_stz:Position"/>
										</td>
										<td class="bordered annot">
											<xsl:apply-templates select="pccg_stz:GoodsDescription"/>											
										</td>
										<td class="bordered annot">
											<xsl:apply-templates select="pccg_stz:GoodsTNVEDCode"/>
										</td>
										<td class="bordered annot">
											<xsl:for-each select="pccg_stz:GoodsQuantity">
												<xsl:if test="position()!=1"><br1/></xsl:if>
												<xsl:apply-templates select="." mode="quantity"/>
											</xsl:for-each>
										</td>
										<td class="bordered annot">
											<xsl:apply-templates select="pccg_stz:ProcessingOperations"/>
										</td>
										<td class="bordered annot">
											<xsl:apply-templates select="pccg_stz:ComponentName"/>
										</td>
										<td class="bordered annot">
											<xsl:for-each select="pccg_stz:AccountDoc">
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
									<td class="bordered annot" colspan="5">IV. Товары, помещенные под таможенную процедуру свободной таможенной зоны и использованные при изготовлении товара</td>
								</tr>
								<tr align="center" valign="top">
									<td class="bordered annot">N п/п</td>
									<td class="bordered annot">Наименование товара</td>
									<td class="bordered annot">Регистрационный номер декларации на товары</td>
									<td class="bordered annot">Номер товара </td>
									<td class="bordered annot">Количество товара/единица измерения количества</td>
								</tr>
								<tr align="center" valign="top">
									<td class="bordered annot">1</td>
									<td class="bordered annot">2</td>
									<td class="bordered annot">3</td>
									<td class="bordered annot">4</td>
									<td class="bordered annot">5</td>
								</tr>
								<xsl:for-each select="pccg_stz:PropertyProcessingGoods/pccg_stz:UsedGoods">
									<xsl:variable name="countGoods" select="count(pccg_stz:GoodsDecl)"/>
									<tr valign="top">
										<td class="bordered annot" rowspan="{$countGoods}">
											<xsl:apply-templates select="pccg_stz:Position"/>
										</td>
										<td class="bordered annot" rowspan="{$countGoods}">
											<xsl:apply-templates select="pccg_stz:GoodsDescription"/>
										</td>
										<td class="bordered annot">
											<xsl:apply-templates select="pccg_stz:GoodsDecl[1]"/>
										</td>
										<td class="bordered annot">
											<xsl:apply-templates select="pccg_stz:GoodsDecl[1]/pccg_stz:GoodsNumber"/>
										</td>
										<td class="bordered annot">
											<xsl:for-each select="pccg_stz:GoodsDecl[1]/pccg_stz:GoodsQuantity">
												<xsl:if test="position()!=1"><br/></xsl:if>
												<xsl:apply-templates select="." mode="quantity"/>
											</xsl:for-each>
										</td>
									</tr>
									<xsl:for-each select="pccg_stz:GoodsDecl[position() &gt; 1]">
											<tr valign="top">
												<td class="bordered annot">
												<xsl:apply-templates select="."/>
											</td>
											<td class="bordered annot">
												<xsl:apply-templates select="pccg_stz:GoodsNumber"/>
											</td>
											<td class="bordered annot">
												<xsl:for-each select="pccg_stz:GoodsQuantity">
													<xsl:if test="position()!=1"><br/></xsl:if>
													<xsl:apply-templates select="." mode="quantity"/>
												</xsl:for-each>
											</td>
										</tr>
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
					<xsl:for-each select="pccg_stz:AppInfo/pccg_stz:AppCloseSTZ/pccg_stz:GoodsInfo/pccg_stz:PropertyExplGoods">
						<xsl:if test="position()!=1"><br/></xsl:if>
						<table>
							<tbody>
								<tr align="center">
									<td class="bordered annot" colspan="6">I. Объект недвижимости</td>
								</tr>
								<tr align="center" valign="top">
									<td class="bordered annot">№ п/п</td>
									<td class="bordered annot">Вид объекта недвижимости (с указанием наименования объекта недвижимости при наличии такого наименования) </td>
									<td class="bordered annot">Решение</td>
									<td class="bordered annot">Место нахождения объекта недвижимости (адрес) </td>
									<td class="bordered annot">Сведения о технической документации </td>
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
										<xsl:apply-templates select="pccg_stz:Position"/>
									</td>
									<td class="bordered annot">
										<xsl:apply-templates select="pccg_stz:PropertyName"/>
									</td>
									<td class="bordered annot">
										<xsl:apply-templates select="pccg_stz:Decision"/>
									</td>
									<td class="bordered annot">
										<xsl:apply-templates select="pccg_stz:PropertyLocation"/>
									</td>
									<td class="bordered annot">
										<xsl:for-each select="pccg_stz:OwnershipDoc">
											<xsl:if test="position()!=1"><br1/></xsl:if>
											<xsl:apply-templates select="." mode="doc"/>
										</xsl:for-each>
									</td>
									<td class="bordered annot">
										<xsl:apply-templates select="pccg_stz:Comment"/>
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
								<xsl:for-each select="pccg_stz:ExploitationGoodsSTZ">
									<xsl:variable name="countGoods" select="count(pccg_stz:ExploitationGoodsDecl/pccg_stz:GoodsDeclnfo)"/>
									<tr valign="top">
										<td class="bordered annot" rowspan="{$countGoods}">
											<xsl:apply-templates select="pccg_stz:Position"/>
										</td>
										<td class="bordered annot" rowspan="{$countGoods}">
											<xsl:apply-templates select="pccg_stz:GoodsDescription"/>
											<xsl:text> / </xsl:text>
											<xsl:apply-templates select="pccg_stz:GoodsTNVEDCode"/>
										</td>
										<xsl:variable name="goodsPerDT" select="count(pccg_stz:ExploitationGoodsDecl[1]/pccg_stz:GoodsDeclnfo)"/>
										<td class="bordered annot" rowspan="{$goodsPerDT}">
											<xsl:apply-templates select="pccg_stz:ExploitationGoodsDecl[1]"/>
										</td>
										<td class="bordered annot">
											<xsl:apply-templates select="pccg_stz:ExploitationGoodsDecl[1]/pccg_stz:GoodsDeclnfo[1]/pccg_stz:GoodsNumber"/>
										</td>
										<td class="bordered annot">
											<xsl:for-each select="pccg_stz:ExploitationGoodsDecl[1]/pccg_stz:GoodsDeclnfo[1]/pccg_stz:GoodsQuantity">
												<xsl:if test="position()!=1"><br/></xsl:if>
												<xsl:apply-templates select="." mode="quantity"/>
											</xsl:for-each>
										</td>
										<td class="bordered annot" rowspan="{$countGoods}">
											<xsl:for-each select="pccg_stz:GoodsQuantity">
												<xsl:if test="position()!=1"><br/></xsl:if>
												<xsl:apply-templates select="." mode="quantity"/>
											</xsl:for-each>
										</td>
										<td class="bordered annot" rowspan="{$countGoods}">
											<xsl:for-each select="pccg_stz:RegulatingDoc">
												<xsl:if test="position()!=1"><br/></xsl:if>
												<xsl:apply-templates select="." mode="doc"/>
											</xsl:for-each>
										</td>
										<td class="bordered annot" rowspan="{$countGoods}">
											<xsl:for-each select="pccg_stz:AccountDoc">
												<xsl:if test="position()!=1"><br/></xsl:if>
												<xsl:apply-templates select="." mode="doc"/>
											</xsl:for-each>
										</td>
									</tr>
									<xsl:for-each select="pccg_stz:ExploitationGoodsDecl[1]/pccg_stz:GoodsDeclnfo[position() &gt; 1]">
										<tr valign="top">
											<td class="bordered annot">
												<xsl:apply-templates select="pccg_stz:GoodsNumber"/>
											</td>
											<td class="bordered annot">
												<xsl:for-each select="pccg_stz:GoodsQuantity">
													<xsl:if test="position()!=1"><br/></xsl:if>
													<xsl:apply-templates select="." mode="quantity"/>
												</xsl:for-each>
											</td>
										</tr>
									</xsl:for-each>
									<xsl:for-each select="pccg_stz:ExploitationGoodsDecl[position() &gt; 1]">
										<xsl:variable name="goodsPerDT2" select="count(pccg_stz:GoodsDeclnfo)"/>
										<tr valign="top">
											<td class="bordered annot" rowspan="{$goodsPerDT2}">
												<xsl:apply-templates select="."/>
											</td>
											<td class="bordered annot">
												<xsl:apply-templates select="pccg_stz:GoodsDeclnfo[1]/pccg_stz:GoodsNumber"/>
											</td>
											<td class="bordered annot">
												<xsl:for-each select="pccg_stz:GoodsDeclnfo[1]/pccg_stz:GoodsQuantity">
													<xsl:if test="position()!=1"><br/></xsl:if>
													<xsl:apply-templates select="." mode="quantity"/>
												</xsl:for-each>
											</td>
										</tr>
										<xsl:for-each select="pccg_stz:GoodsDeclnfo[position() &gt; 1]">
											<tr valign="top">
												<td class="bordered annot">
													<xsl:apply-templates select="pccg_stz:GoodsNumber"/>
												</td>
												<td class="bordered annot">
													<xsl:for-each select="pccg_stz:GoodsQuantity">
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
								<xsl:for-each select="pccg_stz:ExploitationProcessingGoods">
									<tr valign="top">
										<td class="bordered annot">
											<xsl:apply-templates select="pccg_stz:Position"/>
										</td>
										<td class="bordered annot">
											<xsl:apply-templates select="pccg_stz:GoodsDescription"/>											
										</td>
										<td class="bordered annot">
											<xsl:apply-templates select="pccg_stz:GoodsTNVEDCode"/>
										</td>
										<td class="bordered annot">
											<xsl:for-each select="pccg_stz:GoodsQuantity">
												<xsl:if test="position()!=1"><br1/></xsl:if>
												<xsl:apply-templates select="." mode="quantity"/>
											</xsl:for-each>
										</td>
										<td class="bordered annot">
											<xsl:apply-templates select="pccg_stz:ProcessingOperations"/>
										</td>
										<td class="bordered annot">
											<xsl:for-each select="pccg_stz:ExpluatationDoc">
												<xsl:if test="position() != 1"><br/></xsl:if>
												<xsl:apply-templates select="." mode="doc"/>
											</xsl:for-each>
										</td>
										<td class="bordered annot">
											<xsl:for-each select="pccg_stz:AccountDoc">
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
								<xsl:for-each select="pccg_stz:ExploitationProcessingGoods/pccg_stz:UsedGoods">
									<xsl:variable name="countGoods" select="count(pccg_stz:GoodsDecl/pccg_stz:GoodsDeclnfo)"/>
									<tr valign="top">
										<td class="bordered annot" rowspan="{$countGoods}">
											<xsl:apply-templates select="pccg_stz:Position"/>
										</td>
										<td class="bordered annot" rowspan="{$countGoods}">
											<xsl:apply-templates select="pccg_stz:GoodsDescription"/>
											<xsl:text> / </xsl:text>
											<xsl:apply-templates select="pccg_stz:GoodsTNVEDCode"/>
										</td>
										<xsl:variable name="goodsPerDT" select="count(pccg_stz:GoodsDecl[1]/pccg_stz:GoodsDeclnfo)"/>
										<td class="bordered annot" rowspan="{$goodsPerDT}">
											<xsl:apply-templates select="pccg_stz:GoodsDecl[1]"/>
										</td>
										<td class="bordered annot">
											<xsl:apply-templates select="pccg_stz:GoodsDecl[1]/pccg_stz:GoodsDeclnfo[1]/pccg_stz:GoodsNumber"/>
										</td>
										<td class="bordered annot">
											<xsl:for-each select="pccg_stz:GoodsDecl[1]/pccg_stz:GoodsDeclnfo[1]/pccg_stz:GoodsQuantity">
												<xsl:if test="position()!=1"><br/></xsl:if>
												<xsl:apply-templates select="." mode="quantity"/>
											</xsl:for-each>
										</td>
										<td class="bordered annot" rowspan="{$countGoods}">
											<xsl:for-each select="pccg_stz:GoodsQuantity">
												<xsl:if test="position()!=1"><br/></xsl:if>
												<xsl:apply-templates select="." mode="quantity"/>
											</xsl:for-each>
										</td>
									</tr>
									<xsl:for-each select="pccg_stz:GoodsDecl[1]/pccg_stz:GoodsDeclnfo[position() &gt; 1]">
										<tr valign="top">
											<td class="bordered annot">
												<xsl:apply-templates select="pccg_stz:GoodsNumber"/>
											</td>
											<td class="bordered annot">
												<xsl:for-each select="pccg_stz:GoodsQuantity">
													<xsl:if test="position()!=1"><br/></xsl:if>
													<xsl:apply-templates select="." mode="quantity"/>
												</xsl:for-each>
											</td>
										</tr>
									</xsl:for-each>
									<xsl:for-each select="pccg_stz:GoodsDecl[position() &gt; 1]">
										<xsl:variable name="goodsPerDT2" select="count(pccg_stz:GoodsDeclnfo)"/>
										<tr valign="top">
											<td class="bordered annot" rowspan="{$goodsPerDT2}">
												<xsl:apply-templates select="."/>
											</td>
											<td class="bordered annot">
												<xsl:apply-templates select="pccg_stz:GoodsDeclnfo[1]/pccg_stz:GoodsNumber"/>
											</td>
											<td class="bordered annot">
												<xsl:for-each select="pccg_stz:GoodsDeclnfo[1]/pccg_stz:GoodsQuantity">
													<xsl:if test="position()!=1"><br/></xsl:if>
													<xsl:apply-templates select="." mode="quantity"/>
												</xsl:for-each>
											</td>
										</tr>
										<xsl:for-each select="pccg_stz:GoodsDeclnfo[position() &gt; 1]">
											<tr valign="top">
												<td class="bordered annot">
													<xsl:apply-templates select="pccg_stz:GoodsNumber"/>
												</td>
												<td class="bordered annot">
													<xsl:for-each select="pccg_stz:GoodsQuantity">
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
					<xsl:for-each select="pccg_stz:AppInfo/pccg_stz:AppCloseSTZ/pccg_stz:GoodsInfo/pccg_stz:PropertyRepairGoods">
						<xsl:if test="position()!=1"><br/></xsl:if>
						<table>
							<tbody>
								<tr align="center">
									<td class="bordered annot" colspan="7">I. Объект недвижимости</td>
								</tr>
								<tr align="center" valign="top">
									<td class="bordered annot">№ п/п</td>
									<td class="bordered annot">Вид объекта недвижимости (с указанием наименования объекта недвижимости при наличии такого наименования) </td>
									<td class="bordered annot">Решение</td>
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
										<xsl:apply-templates select="pccg_stz:Position"/>
									</td>
									<td class="bordered annot">
										<xsl:apply-templates select="pccg_stz:PropertyName"/>
									</td>
									<td class="bordered annot">
										<xsl:apply-templates select="pccg_stz:Decision"/>
									</td>
									<td class="bordered annot">
										<xsl:apply-templates select="pccg_stz:ProcessingOperations"/>
									</td>
									<td class="bordered annot">
										<xsl:for-each select="pccg_stz:TechDoc">
											<xsl:if test="position()!=1"><br1/></xsl:if>
											<xsl:apply-templates select="." mode="doc"/>
										</xsl:for-each>
									</td>
									<td class="bordered annot">
										<xsl:for-each select="pccg_stz:AcceptanceWork">
											<xsl:if test="position()!=1"><br1/></xsl:if>
											<xsl:apply-templates select="." mode="doc"/>
										</xsl:for-each>
									</td>
									<td class="bordered annot">
										<xsl:apply-templates select="pccg_stz:Comment"/>
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
								<xsl:for-each select="pccg_stz:RepairGoodsSTZ">
									<xsl:variable name="countGoods" select="count(pccg_stz:RepairGoodsDecl/pccg_stz:GoodsDeclnfo)"/>
									<tr valign="top">
										<td class="bordered annot" rowspan="{$countGoods}">
											<xsl:apply-templates select="pccg_stz:Position"/>
										</td>
										<td class="bordered annot" rowspan="{$countGoods}">
											<xsl:apply-templates select="pccg_stz:GoodsDescription"/>
											<xsl:text> / </xsl:text>
											<xsl:apply-templates select="pccg_stz:GoodsTNVEDCode"/>
										</td>
										<xsl:variable name="goodsPerDT" select="count(pccg_stz:RepairGoodsDecl[1]/pccg_stz:GoodsDeclnfo)"/>
										<td class="bordered annot" rowspan="{$goodsPerDT}">
											<xsl:apply-templates select="pccg_stz:RepairGoodsDecl[1]"/>
										</td>
										<td class="bordered annot">
											<xsl:apply-templates select="pccg_stz:RepairGoodsDecl[1]/pccg_stz:GoodsDeclnfo[1]/pccg_stz:GoodsNumber"/>
										</td>
										<td class="bordered annot">
											<xsl:for-each select="pccg_stz:RepairGoodsDecl[1]/pccg_stz:GoodsDeclnfo[1]/pccg_stz:GoodsQuantity">
												<xsl:if test="position()!=1"><br/></xsl:if>
												<xsl:apply-templates select="." mode="quantity"/>
											</xsl:for-each>
										</td>
										<td class="bordered annot" rowspan="{$countGoods}">
											<xsl:for-each select="pccg_stz:GoodsQuantity">
												<xsl:if test="position()!=1"><br/></xsl:if>
												<xsl:apply-templates select="." mode="quantity"/>
											</xsl:for-each>
										</td>
										<td class="bordered annot" rowspan="{$countGoods}">
											<xsl:for-each select="pccg_stz:AccountDoc">
												<xsl:if test="position()!=1"><br/></xsl:if>
												<xsl:apply-templates select="." mode="doc"/>
											</xsl:for-each>
										</td>
									</tr>
									<xsl:for-each select="pccg_stz:RepairGoodsDecl[1]/pccg_stz:GoodsDeclnfo[position() &gt; 1]">
										<tr valign="top">
											<td class="bordered annot">
												<xsl:apply-templates select="pccg_stz:GoodsNumber"/>
											</td>
											<td class="bordered annot">
												<xsl:for-each select="pccg_stz:GoodsQuantity">
													<xsl:if test="position()!=1"><br/></xsl:if>
													<xsl:apply-templates select="." mode="quantity"/>
												</xsl:for-each>
											</td>
										</tr>
									</xsl:for-each>
									<xsl:for-each select="pccg_stz:RepairGoodsDecl[position() &gt; 1]">
										<xsl:variable name="goodsPerDT2" select="count(pccg_stz:GoodsDeclnfo)"/>
										<tr valign="top">
											<td class="bordered annot" rowspan="{$goodsPerDT2}">
												<xsl:apply-templates select="."/>
											</td>
											<td class="bordered annot">
												<xsl:apply-templates select="pccg_stz:GoodsDeclnfo[1]/pccg_stz:GoodsNumber"/>
											</td>
											<td class="bordered annot">
												<xsl:for-each select="pccg_stz:GoodsDeclnfo[1]/pccg_stz:GoodsQuantity">
													<xsl:if test="position()!=1"><br/></xsl:if>
													<xsl:apply-templates select="." mode="quantity"/>
												</xsl:for-each>
											</td>
										</tr>
										<xsl:for-each select="pccg_stz:GoodsDeclnfo[position() &gt; 1]">
											<tr valign="top">
												<td class="bordered annot">
													<xsl:apply-templates select="pccg_stz:GoodsNumber"/>
												</td>
												<td class="bordered annot">
													<xsl:for-each select="pccg_stz:GoodsQuantity">
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
								<xsl:for-each select="pccg_stz:RepairProceccingGoods">
									<tr valign="top">
										<td class="bordered annot">
											<xsl:apply-templates select="pccg_stz:Position"/>
										</td>
										<td class="bordered annot">
											<xsl:apply-templates select="pccg_stz:GoodsDescription"/>											
										</td>
										<td class="bordered annot">
											<xsl:apply-templates select="pccg_stz:GoodsTNVEDCode"/>
										</td>
										<td class="bordered annot">
											<xsl:for-each select="pccg_stz:GoodsQuantity">
												<xsl:if test="position()!=1"><br1/></xsl:if>
												<xsl:apply-templates select="." mode="quantity"/>
											</xsl:for-each>
										</td>
										<td class="bordered annot">
											<xsl:apply-templates select="pccg_stz:ProcessingOperations"/>
										</td>
										<td class="bordered annot">
											<xsl:for-each select="pccg_stz:AccountDoc">
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
								<xsl:for-each select="pccg_stz:RepairProceccingGoods/pccg_stz:UsedGoods">
									<xsl:variable name="countGoods" select="count(pccg_stz:GoodsDecl/pccg_stz:GoodsDeclnfo)"/>
									<tr valign="top">
										<td class="bordered annot" rowspan="{$countGoods}">
											<xsl:apply-templates select="pccg_stz:Position"/>
										</td>
										<td class="bordered annot" rowspan="{$countGoods}">
											<xsl:apply-templates select="pccg_stz:GoodsDescription"/>
											<xsl:text> / </xsl:text>
											<xsl:apply-templates select="pccg_stz:GoodsTNVEDCode"/>
										</td>
										<xsl:variable name="goodsPerDT" select="count(pccg_stz:GoodsDecl[1]/pccg_stz:GoodsDeclnfo)"/>
										<td class="bordered annot" rowspan="{$goodsPerDT}">
											<xsl:apply-templates select="pccg_stz:GoodsDecl[1]"/>
										</td>
										<td class="bordered annot">
											<xsl:apply-templates select="pccg_stz:GoodsDecl[1]/pccg_stz:GoodsDeclnfo[1]/pccg_stz:GoodsNumber"/>
										</td>
										<td class="bordered annot">
											<xsl:for-each select="pccg_stz:GoodsDecl[1]/pccg_stz:GoodsDeclnfo[1]/pccg_stz:GoodsQuantity">
												<xsl:if test="position()!=1"><br/></xsl:if>
												<xsl:apply-templates select="." mode="quantity"/>
											</xsl:for-each>
										</td>
										<td class="bordered annot" rowspan="{$countGoods}">
											<xsl:for-each select="pccg_stz:GoodsQuantity">
												<xsl:if test="position()!=1"><br/></xsl:if>
												<xsl:apply-templates select="." mode="quantity"/>
											</xsl:for-each>
										</td>
									</tr>
									<xsl:for-each select="pccg_stz:GoodsDecl[1]/pccg_stz:GoodsDeclnfo[position() &gt; 1]">
										<tr valign="top">
											<td class="bordered annot">
												<xsl:apply-templates select="pccg_stz:GoodsNumber"/>
											</td>
											<td class="bordered annot">
												<xsl:for-each select="pccg_stz:GoodsQuantity">
													<xsl:if test="position()!=1"><br/></xsl:if>
													<xsl:apply-templates select="." mode="quantity"/>
												</xsl:for-each>
											</td>
										</tr>
									</xsl:for-each>
									<xsl:for-each select="pccg_stz:GoodsDecl[position() &gt; 1]">
										<xsl:variable name="goodsPerDT2" select="count(pccg_stz:GoodsDeclnfo)"/>
										<tr valign="top">
											<td class="bordered annot" rowspan="{$goodsPerDT2}">
												<xsl:apply-templates select="."/>
											</td>
											<td class="bordered annot">
												<xsl:apply-templates select="pccg_stz:GoodsDeclnfo[1]/pccg_stz:GoodsNumber"/>
											</td>
											<td class="bordered annot">
												<xsl:for-each select="pccg_stz:GoodsDeclnfo[1]/pccg_stz:GoodsQuantity">
													<xsl:if test="position()!=1"><br/></xsl:if>
													<xsl:apply-templates select="." mode="quantity"/>
												</xsl:for-each>
											</td>
										</tr>
										<xsl:for-each select="pccg_stz:GoodsDeclnfo[position() &gt; 1]">
											<tr valign="top">
												<td class="bordered annot">
													<xsl:apply-templates select="pccg_stz:GoodsNumber"/>
												</td>
												<td class="bordered annot">
													<xsl:for-each select="pccg_stz:GoodsQuantity">
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
					<xsl:for-each select="pccg_stz:AppInfo/pccg_stz:AppCloseSTZ/pccg_stz:GoodsInfo/pccg_stz:EquipmentExplGoods">
						<xsl:if test="position()!=1"><br/></xsl:if>
						<table>
							<tbody>
								<tr align="center">
									<td class="bordered annot" colspan="9">I. Оборудование (машина, агрегат), помещенное под таможенную процедуру свободной таможенной зоны</td>
								</tr>
								<tr align="center" valign="top">
									<td class="bordered annot">№ п/п</td>
									<td class="bordered annot">Наименование оборудования</td>
									<td class="bordered annot">Решение</td>
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
									<td class="bordered annot">9</td>
								</tr>
								<tr valign="top">
									<xsl:variable name="equipmentCount" select="count(pccg_stz:EquipmentType)"/>
									<td class="bordered annot" rowspan="{$equipmentCount}">
										<xsl:apply-templates select="pccg_stz:Position"/>
									</td>
									<td class="bordered annot" rowspan="{$equipmentCount}">
										<xsl:apply-templates select="pccg_stz:EquipmentName"/>
									</td>
									<td class="bordered annot" rowspan="{$equipmentCount}">
										<xsl:apply-templates select="pccg_stz:Decision"/>
									</td>
									<td class="bordered annot">
										<xsl:apply-templates select="pccg_stz:EquipmentType[1]"/>
									</td>
									<td class="bordered annot">
										<xsl:apply-templates select="pccg_stz:EquipmentType[1]/pccg_stz:GoodsNumber"/>
									</td>
									<td class="bordered annot">
										<xsl:for-each select="pccg_stz:EquipmentType[1]/pccg_stz:GoodsQuantity">
											<xsl:if test="position()!=1"><br/></xsl:if>
											<xsl:apply-templates select="." mode="quantity"/>
										</xsl:for-each>
									</td>
									<td class="bordered annot">
										<xsl:for-each select="pccg_stz:EquipmentType[1]/pccg_stz:PropertyBalanceSheet">
											<xsl:if test="position()!=1"><br/></xsl:if>
											<xsl:apply-templates select="." mode="doc"/>
										</xsl:for-each>
									</td>
									<td class="bordered annot">
										<xsl:for-each select="pccg_stz:EquipmentType[1]/pccg_stz:CommissioningDoc">
											<xsl:if test="position()!=1"><br/></xsl:if>
											<xsl:apply-templates select="." mode="doc"/>
										</xsl:for-each>
									</td>
									<td class="bordered annot">
										<xsl:apply-templates select="pccg_stz:EquipmentType[1]/pccg_stz:Comment"/>
									</td>
								</tr>
								<xsl:for-each select="pccg_stz:EquipmentType[position() &gt; 1]">
									<tr valign="top">
										<td class="bordered annot">
											<xsl:apply-templates select="."/>
										</td>
										<td class="bordered annot">
											<xsl:apply-templates select="pccg_stz:GoodsNumber"/>
										</td>
										<td class="bordered annot">
											<xsl:for-each select="pccg_stz:GoodsQuantity">
												<xsl:if test="position()!=1"><br/></xsl:if>
												<xsl:apply-templates select="." mode="quantity"/>
											</xsl:for-each>
										</td>
										<td class="bordered annot">
											<xsl:for-each select="pccg_stz:PropertyBalanceSheet">
												<xsl:if test="position()!=1"><br/></xsl:if>
												<xsl:apply-templates select="." mode="doc"/>
											</xsl:for-each>
										</td>
										<td class="bordered annot">
											<xsl:for-each select="pccg_stz:CommissioningDoc">
												<xsl:if test="position()!=1"><br/></xsl:if>
												<xsl:apply-templates select="." mode="doc"/>
											</xsl:for-each>
										</td>
										<td class="bordered annot">
											<xsl:apply-templates select="pccg_stz:Comment"/>
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
								<xsl:for-each select="pccg_stz:EquipmentType/pccg_stz:EquipmentGoodsSTZ">
									<xsl:variable name="countGoods" select="count(pccg_stz:EquipmentGoodsDecl/pccg_stz:GoodsDeclnfo)"/>
									<tr valign="top">
										<td class="bordered annot" rowspan="{$countGoods}">
											<xsl:apply-templates select="pccg_stz:Position"/>
										</td>
										<td class="bordered annot" rowspan="{$countGoods}">
											<xsl:apply-templates select="pccg_stz:GoodsDescription"/>
											<xsl:text> / </xsl:text>
											<xsl:apply-templates select="pccg_stz:GoodsTNVEDCode"/>
										</td>
										<xsl:variable name="goodsPerDT" select="count(pccg_stz:EquipmentGoodsDecl[1]/pccg_stz:GoodsDeclnfo)"/>
										<td class="bordered annot" rowspan="{$goodsPerDT}">
											<xsl:apply-templates select="pccg_stz:EquipmentGoodsDecl[1]"/>
										</td>
										<td class="bordered annot">
											<xsl:apply-templates select="pccg_stz:EquipmentGoodsDecl[1]/pccg_stz:GoodsDeclnfo[1]/pccg_stz:GoodsNumber"/>
										</td>
										<td class="bordered annot">
											<xsl:for-each select="pccg_stz:EquipmentGoodsDecl[1]/pccg_stz:GoodsDeclnfo[1]/pccg_stz:GoodsQuantity">
												<xsl:if test="position()!=1"><br/></xsl:if>
												<xsl:apply-templates select="." mode="quantity"/>
											</xsl:for-each>
										</td>
										<td class="bordered annot" rowspan="{$countGoods}">
											<xsl:for-each select="pccg_stz:GoodsQuantity">
												<xsl:if test="position()!=1"><br/></xsl:if>
												<xsl:apply-templates select="." mode="quantity"/>
											</xsl:for-each>
										</td>
										<td class="bordered annot" rowspan="{$countGoods}">
											<xsl:for-each select="pccg_stz:OperationsDoc">
												<xsl:if test="position()!=1"><br/></xsl:if>
												<xsl:apply-templates select="." mode="doc"/>
											</xsl:for-each>
										</td>
										<td class="bordered annot" rowspan="{$countGoods}">
											<xsl:for-each select="pccg_stz:AccountDoc">
												<xsl:if test="position()!=1"><br/></xsl:if>
												<xsl:apply-templates select="." mode="doc"/>
											</xsl:for-each>
										</td>
									</tr>
									<xsl:for-each select="pccg_stz:EquipmentGoodsDecl[1]/pccg_stz:GoodsDeclnfo[position() &gt; 1]">
										<tr valign="top">
											<td class="bordered annot">
												<xsl:apply-templates select="pccg_stz:GoodsNumber"/>
											</td>
											<td class="bordered annot">
												<xsl:for-each select="pccg_stz:GoodsQuantity">
													<xsl:if test="position()!=1"><br/></xsl:if>
													<xsl:apply-templates select="." mode="quantity"/>
												</xsl:for-each>
											</td>
										</tr>
									</xsl:for-each>
									<xsl:for-each select="pccg_stz:EquipmentGoodsDecl[position() &gt; 1]">
										<xsl:variable name="goodsPerDT2" select="count(pccg_stz:GoodsDeclnfo)"/>
										<tr valign="top">
											<td class="bordered annot" rowspan="{$goodsPerDT2}">
												<xsl:apply-templates select="."/>
											</td>
											<td class="bordered annot">
												<xsl:apply-templates select="pccg_stz:GoodsDeclnfo[1]/pccg_stz:GoodsNumber"/>
											</td>
											<td class="bordered annot">
												<xsl:for-each select="pccg_stz:GoodsDeclnfo[1]/pccg_stz:GoodsQuantity">
													<xsl:if test="position()!=1"><br/></xsl:if>
													<xsl:apply-templates select="." mode="quantity"/>
												</xsl:for-each>
											</td>
										</tr>
										<xsl:for-each select="pccg_stz:GoodsDeclnfo[position() &gt; 1]">
											<tr valign="top">
												<td class="bordered annot">
													<xsl:apply-templates select="pccg_stz:GoodsNumber"/>
												</td>
												<td class="bordered annot">
													<xsl:for-each select="pccg_stz:GoodsQuantity">
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
								<xsl:for-each select="pccg_stz:EquipmentType/pccg_stz:EquipmentProcessingGoods">
									<tr valign="top">
										<td class="bordered annot">
											<xsl:apply-templates select="pccg_stz:Position"/>
										</td>
										<td class="bordered annot">
											<xsl:apply-templates select="pccg_stz:GoodsDescription"/>											
										</td>
										<td class="bordered annot">
											<xsl:apply-templates select="pccg_stz:GoodsTNVEDCode"/>
										</td>
										<td class="bordered annot">
											<xsl:for-each select="pccg_stz:GoodsQuantity">
												<xsl:if test="position()!=1"><br1/></xsl:if>
												<xsl:apply-templates select="." mode="quantity"/>
											</xsl:for-each>
										</td>
										<td class="bordered annot">
											<xsl:apply-templates select="pccg_stz:ProcessingOperations"/>
										</td>
										<td class="bordered annot">
											<xsl:for-each select="pccg_stz:ExpluatationDoc">
												<xsl:if test="position() != 1"><br/></xsl:if>
												<xsl:apply-templates select="." mode="doc"/>
											</xsl:for-each>
										</td>
										<td class="bordered annot">
											<xsl:for-each select="pccg_stz:AccountDoc">
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
								<xsl:for-each select="pccg_stz:EquipmentType/pccg_stz:EquipmentProcessingGoods/pccg_stz:UsedGoods">
									<xsl:variable name="countGoods" select="count(pccg_stz:GoodsDecl/pccg_stz:GoodsDeclnfo)"/>
									<tr valign="top">
										<td class="bordered annot" rowspan="{$countGoods}">
											<xsl:apply-templates select="pccg_stz:Position"/>
										</td>
										<td class="bordered annot" rowspan="{$countGoods}">
											<xsl:apply-templates select="pccg_stz:GoodsDescription"/>
											<xsl:text> / </xsl:text>
											<xsl:apply-templates select="pccg_stz:GoodsTNVEDCode"/>
										</td>
										<xsl:variable name="goodsPerDT" select="count(pccg_stz:GoodsDecl[1]/pccg_stz:GoodsDeclnfo)"/>
										<td class="bordered annot" rowspan="{$goodsPerDT}">
											<xsl:apply-templates select="pccg_stz:GoodsDecl[1]"/>
										</td>
										<td class="bordered annot">
											<xsl:apply-templates select="pccg_stz:GoodsDecl[1]/pccg_stz:GoodsDeclnfo[1]/pccg_stz:GoodsNumber"/>
										</td>
										<td class="bordered annot">
											<xsl:for-each select="pccg_stz:GoodsDecl[1]/pccg_stz:GoodsDeclnfo[1]/pccg_stz:GoodsQuantity">
												<xsl:if test="position()!=1"><br/></xsl:if>
												<xsl:apply-templates select="." mode="quantity"/>
											</xsl:for-each>
										</td>
										<td class="bordered annot" rowspan="{$countGoods}">
											<xsl:for-each select="pccg_stz:GoodsQuantity">
												<xsl:if test="position()!=1"><br/></xsl:if>
												<xsl:apply-templates select="." mode="quantity"/>
											</xsl:for-each>
										</td>
									</tr>
									<xsl:for-each select="pccg_stz:GoodsDecl[1]/pccg_stz:GoodsDeclnfo[position() &gt; 1]">
										<tr valign="top">
											<td class="bordered annot">
												<xsl:apply-templates select="pccg_stz:GoodsNumber"/>
											</td>
											<td class="bordered annot">
												<xsl:for-each select="pccg_stz:GoodsQuantity">
													<xsl:if test="position()!=1"><br/></xsl:if>
													<xsl:apply-templates select="." mode="quantity"/>
												</xsl:for-each>
											</td>
										</tr>
									</xsl:for-each>
									<xsl:for-each select="pccg_stz:GoodsDecl[position() &gt; 1]">
										<xsl:variable name="goodsPerDT2" select="count(pccg_stz:GoodsDeclnfo)"/>
										<tr valign="top">
											<td class="bordered annot" rowspan="{$goodsPerDT2}">
												<xsl:apply-templates select="."/>
											</td>
											<td class="bordered annot">
												<xsl:apply-templates select="pccg_stz:GoodsDeclnfo[1]/pccg_stz:GoodsNumber"/>
											</td>
											<td class="bordered annot">
												<xsl:for-each select="pccg_stz:GoodsDeclnfo[1]/pccg_stz:GoodsQuantity">
													<xsl:if test="position()!=1"><br/></xsl:if>
													<xsl:apply-templates select="." mode="quantity"/>
												</xsl:for-each>
											</td>
										</tr>
										<xsl:for-each select="pccg_stz:GoodsDeclnfo[position() &gt; 1]">
											<tr valign="top">
												<td class="bordered annot">
													<xsl:apply-templates select="pccg_stz:GoodsNumber"/>
												</td>
												<td class="bordered annot">
													<xsl:for-each select="pccg_stz:GoodsQuantity">
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
					<xsl:for-each select="pccg_stz:AppInfo/pccg_stz:AppCloseSTZ/pccg_stz:GoodsInfo/pccg_stz:ResearchGoods">
						<xsl:if test="position()!=1"><br/></xsl:if>
						<table>
							<tbody>
								<tr align="center">
									<td class="bordered annot" colspan="6">I. Сведения о проведенном исследовании </td>
								</tr>
								<tr align="center" valign="top">
									<td class="bordered annot">№ п/п</td>
									<td class="bordered annot">Описание проведенного исследования </td>
									<td class="bordered annot">Решение</td>
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
									<td class="bordered annot">6</td>
								</tr>
								<tr valign="top">
									<td class="bordered annot">
										<xsl:apply-templates select="pccg_stz:Position"/>
									</td>
									<td class="bordered annot">
										<xsl:apply-templates select="pccg_stz:ResearchInfo"/>
									</td>
									<td class="bordered annot">
										<xsl:apply-templates select="pccg_stz:Decision"/>
									</td>
									<td class="bordered annot">
										<xsl:for-each select="pccg_stz:ReglamentDoc">
											<xsl:if test="position()!=1"><br1/></xsl:if>
											<xsl:apply-templates select="." mode="doc"/>
										</xsl:for-each>
									</td>
									<td class="bordered annot">
										<xsl:for-each select="pccg_stz:EndResearchDoc">
											<xsl:if test="position()!=1"><br1/></xsl:if>
											<xsl:apply-templates select="." mode="doc"/>
										</xsl:for-each>
									</td>
									<td class="bordered annot">
										<xsl:apply-templates select="pccg_stz:Comment"/>
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
								<xsl:for-each select="pccg_stz:ResearchGoods">
									<xsl:variable name="countGoods" select="count(pccg_stz:ResearchGoodsDecl/pccg_stz:GoodsDeclnfo)"/>
									<tr valign="top">
										<td class="bordered annot" rowspan="{$countGoods}">
											<xsl:apply-templates select="pccg_stz:Position"/>
										</td>
										<td class="bordered annot" rowspan="{$countGoods}">
											<xsl:apply-templates select="pccg_stz:GoodsDescription"/>
											<xsl:text> / </xsl:text>
											<xsl:apply-templates select="pccg_stz:GoodsTNVEDCode"/>
										</td>
										<xsl:variable name="goodsPerDT" select="count(pccg_stz:ResearchGoodsDecl[1]/pccg_stz:GoodsDeclnfo)"/>
										<td class="bordered annot" rowspan="{$goodsPerDT}">
											<xsl:apply-templates select="pccg_stz:ResearchGoodsDecl[1]"/>
										</td>
										<td class="bordered annot">
											<xsl:apply-templates select="pccg_stz:ResearchGoodsDecl[1]/pccg_stz:GoodsDeclnfo[1]/pccg_stz:GoodsNumber"/>
										</td>
										<td class="bordered annot">
											<xsl:for-each select="pccg_stz:ResearchGoodsDecl[1]/pccg_stz:GoodsDeclnfo[1]/pccg_stz:GoodsQuantity">
												<xsl:if test="position()!=1"><br/></xsl:if>
												<xsl:apply-templates select="." mode="quantity"/>
											</xsl:for-each>
										</td>
										<td class="bordered annot" rowspan="{$countGoods}">
											<xsl:for-each select="pccg_stz:GoodsQuantity">
												<xsl:if test="position()!=1"><br/></xsl:if>
												<xsl:apply-templates select="." mode="quantity"/>
											</xsl:for-each>
										</td>
										<td class="bordered annot" rowspan="{$countGoods}">
											<xsl:for-each select="pccg_stz:AccountDoc">
												<xsl:if test="position()!=1"><br/></xsl:if>
												<xsl:apply-templates select="." mode="doc"/>
											</xsl:for-each>
										</td>
									</tr>
									<xsl:for-each select="pccg_stz:ResearchGoodsDecl[1]/pccg_stz:GoodsDeclnfo[position() &gt; 1]">
										<tr valign="top">
											<td class="bordered annot">
												<xsl:apply-templates select="pccg_stz:GoodsNumber"/>
											</td>
											<td class="bordered annot">
												<xsl:for-each select="pccg_stz:GoodsQuantity">
													<xsl:if test="position()!=1"><br/></xsl:if>
													<xsl:apply-templates select="." mode="quantity"/>
												</xsl:for-each>
											</td>
										</tr>
									</xsl:for-each>
									<xsl:for-each select="pccg_stz:ResearchGoodsDecl[position() &gt; 1]">
										<xsl:variable name="goodsPerDT2" select="count(pccg_stz:GoodsDeclnfo)"/>
										<tr valign="top">
											<td class="bordered annot" rowspan="{$goodsPerDT2}">
												<xsl:apply-templates select="."/>
											</td>
											<td class="bordered annot">
												<xsl:apply-templates select="pccg_stz:GoodsDeclnfo[1]/pccg_stz:GoodsNumber"/>
											</td>
											<td class="bordered annot">
												<xsl:for-each select="pccg_stz:GoodsDeclnfo[1]/pccg_stz:GoodsQuantity">
													<xsl:if test="position()!=1"><br/></xsl:if>
													<xsl:apply-templates select="." mode="quantity"/>
												</xsl:for-each>
											</td>
										</tr>
										<xsl:for-each select="pccg_stz:GoodsDeclnfo[position() &gt; 1]">
											<tr valign="top">
												<td class="bordered annot">
													<xsl:apply-templates select="pccg_stz:GoodsNumber"/>
												</td>
												<td class="bordered annot">
													<xsl:for-each select="pccg_stz:GoodsQuantity">
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
								<xsl:for-each select="pccg_stz:ResearchProcessingGoods">
									<tr valign="top">
										<td class="bordered annot">
											<xsl:apply-templates select="pccg_stz:Position"/>
										</td>
										<td class="bordered annot">
											<xsl:apply-templates select="pccg_stz:GoodsDescription"/>											
										</td>
										<td class="bordered annot">
											<xsl:apply-templates select="pccg_stz:GoodsTNVEDCode"/>
										</td>
										<td class="bordered annot">
											<xsl:for-each select="pccg_stz:GoodsQuantity">
												<xsl:if test="position()!=1"><br1/></xsl:if>
												<xsl:apply-templates select="." mode="quantity"/>
											</xsl:for-each>
										</td>
										<td class="bordered annot">
											<xsl:apply-templates select="pccg_stz:ProcessingOperations"/>
										</td>
										<td class="bordered annot">
											<xsl:for-each select="pccg_stz:AccountDoc">
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
								<xsl:for-each select="pccg_stz:ResearchProcessingGoods/pccg_stz:UsedGoods">
									<xsl:variable name="countGoods" select="count(pccg_stz:GoodsDecl/pccg_stz:GoodsDeclnfo)"/>
									<tr valign="top">
										<td class="bordered annot" rowspan="{$countGoods}">
											<xsl:apply-templates select="pccg_stz:Position"/>
										</td>
										<td class="bordered annot" rowspan="{$countGoods}">
											<xsl:apply-templates select="pccg_stz:GoodsDescription"/>
											<xsl:text> / </xsl:text>
											<xsl:apply-templates select="pccg_stz:GoodsTNVEDCode"/>
										</td>
										<xsl:variable name="goodsPerDT" select="count(pccg_stz:GoodsDecl[1]/pccg_stz:GoodsDeclnfo)"/>
										<td class="bordered annot" rowspan="{$goodsPerDT}">
											<xsl:apply-templates select="pccg_stz:GoodsDecl[1]"/>
										</td>
										<td class="bordered annot">
											<xsl:apply-templates select="pccg_stz:GoodsDecl[1]/pccg_stz:GoodsDeclnfo[1]/pccg_stz:GoodsNumber"/>
										</td>
										<td class="bordered annot">
											<xsl:for-each select="pccg_stz:GoodsDecl[1]/pccg_stz:GoodsDeclnfo[1]/pccg_stz:GoodsQuantity">
												<xsl:if test="position()!=1"><br/></xsl:if>
												<xsl:apply-templates select="." mode="quantity"/>
											</xsl:for-each>
										</td>
										<td class="bordered annot" rowspan="{$countGoods}">
											<xsl:for-each select="pccg_stz:GoodsQuantity">
												<xsl:if test="position()!=1"><br/></xsl:if>
												<xsl:apply-templates select="." mode="quantity"/>
											</xsl:for-each>
										</td>
									</tr>
									<xsl:for-each select="pccg_stz:GoodsDecl[1]/pccg_stz:GoodsDeclnfo[position() &gt; 1]">
										<tr valign="top">
											<td class="bordered annot">
												<xsl:apply-templates select="pccg_stz:GoodsNumber"/>
											</td>
											<td class="bordered annot">
												<xsl:for-each select="pccg_stz:GoodsQuantity">
													<xsl:if test="position()!=1"><br/></xsl:if>
													<xsl:apply-templates select="." mode="quantity"/>
												</xsl:for-each>
											</td>
										</tr>
									</xsl:for-each>
									<xsl:for-each select="pccg_stz:GoodsDecl[position() &gt; 1]">
										<xsl:variable name="goodsPerDT2" select="count(pccg_stz:GoodsDeclnfo)"/>
										<tr valign="top">
											<td class="bordered annot" rowspan="{$goodsPerDT2}">
												<xsl:apply-templates select="."/>
											</td>
											<td class="bordered annot">
												<xsl:apply-templates select="pccg_stz:GoodsDeclnfo[1]/pccg_stz:GoodsNumber"/>
											</td>
											<td class="bordered annot">
												<xsl:for-each select="pccg_stz:GoodsDeclnfo[1]/pccg_stz:GoodsQuantity">
													<xsl:if test="position()!=1"><br/></xsl:if>
													<xsl:apply-templates select="." mode="quantity"/>
												</xsl:for-each>
											</td>
										</tr>
										<xsl:for-each select="pccg_stz:GoodsDeclnfo[position() &gt; 1]">
											<tr valign="top">
												<td class="bordered annot">
													<xsl:apply-templates select="pccg_stz:GoodsNumber"/>
												</td>
												<td class="bordered annot">
													<xsl:for-each select="pccg_stz:GoodsQuantity">
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
					
					<br/>
					<br/>
					<!-- подпись -->
					<xsl:apply-templates select="pccg_stz:CustomsSignature"/>
				</div>
			</body>
		</html>
	</xsl:template>
	
	<xsl:template match="pccg_stz:Decision">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:choose>
				<xsl:when test=". = 1">разрешено</xsl:when>
				<xsl:when test=". = 2">отказано</xsl:when>
			</xsl:choose>
		</element>
	</xsl:template>
	
	<xsl:template match="pccg_stz:CustomsSignature">
		<table>
			<tbody>
				<tr valign="bottom" align="center">
					<td style="border-bottom:1px solid black;" width="35%" class="annot">
						<xsl:apply-templates select="cat_ru:PersonPost"/>
					</td>
					<td width="5%"/>
					<td style="border-bottom:1px solid black;" width="20%"/>
					<td width="5%"/>
					<td style="border-bottom:1px solid black;" width="35%" class="annot">
						<xsl:apply-templates select="cat_ru:PersonSurname"/>
						<xsl:text> </xsl:text>
						<xsl:apply-templates select="cat_ru:PersonName"/>
						<xsl:text> </xsl:text>
						<xsl:apply-templates select="cat_ru:PersonMiddleName"/>
					</td>
				</tr>
				<tr valign="top" align="center">
					<td class="descr">(Начальник таможенного органа/лицо, его замещающее)</td>
					<td/>
					<td class="descr">(подпись)</td>
					<td/>
					<td class="descr">(Фамилия, имя, отчество (при наличии)</td>
				</tr>
			</tbody>
		</table>
	</xsl:template>
	
	<xsl:template match="*" mode="reg_app_num">
		<xsl:apply-templates select="pccg_stz:CustomsCode"/>
		<xsl:text>/</xsl:text>
		<xsl:apply-templates select="pccg_stz:RegistrationDate" mode="date_num"/>
		<xsl:text>/</xsl:text>
		<xsl:apply-templates select="pccg_stz:Number"/>
		<xsl:text>/</xsl:text>
		<xsl:apply-templates select="pccg_stz:AddNumber"/>
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
	
	<xsl:template match="pccg_stz:PropertyGoodsDecl | pccg_stz:GoodsDecl | pccg_stz:ExploitationGoodsDecl | pccg_stz:RepairGoodsDecl | pccg_stz:EquipmentType | pccg_stz:EquipmentGoodsDecl | pccg_stz:ResearchGoodsDecl">
		<xsl:apply-templates select="pccg_stz:DeclRegNum" mode="reg_num"/>
		<xsl:apply-templates select="pccg_stz:CustomsDoc" mode="doc"/>
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
	
	<xsl:template match="pccg_stz:PropertyLocation">
		<xsl:for-each select="*">
			<xsl:if test="position()!=1">, </xsl:if>
			<xsl:apply-templates select="."/>
		</xsl:for-each>
	</xsl:template>
	
	<xsl:template match="pccg_stz:Resident">
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
		<xsl:apply-templates select="pccg_stz:ResidentCertificate"/>
	</xsl:template>
	
	<xsl:template match="pccg_stz:ResidentCertificate">
		<xsl:text> свидетельство: </xsl:text>
		<xsl:text> № </xsl:text>
		<xsl:apply-templates select="pccg_stz:CertificateNumber"/>
		<xsl:text> от </xsl:text>
		<xsl:apply-templates select="pccg_stz:CertificateDate" mode="russian_date"/>
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
	
	
	<xsl:template name="date_num">
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<xsl:value-of select="substring($dateIn,9,2)"/>
				<xsl:text/>
				<xsl:value-of select="substring($dateIn,6,2)"/>
				<xsl:text/>
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
	<xsl:template match="//*[local-name()='PermitCloseConsumedGoodsSTZ']//*" priority="-1">
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
