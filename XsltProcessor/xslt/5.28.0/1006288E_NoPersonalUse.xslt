<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:npu="urn:customs.ru:Information:CustomsDocuments:NoPersonalUse:5.26.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.24.0">
	<!--Приказ ФТС России № 378 от 12.03. 2019 "Об утверждении формы решения о неотнесении товаров к товарам для личного пользования, порядка ее заполнения, внесения изменений в такое решение)"-->
	<!-- Шаблон для типа NoPersonalUseType -->
	<xsl:template match="//*[local-name()='NoPersonalUse']//*" priority="-1">
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
	<xsl:template match="npu:NoPersonalUse">
		<html>
			<head>
				<style>
							
								
									body {
									background: #cccccc;
									font-family: Arial;
									}

									div
									{
										/*white-space: nowrap;*/
									}

									div.page {
									width: 180mm;
									/*height: 277mm;*/
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
									border: 1px solid gray;
									}

									.graph {
									font-family: Arial;
									font-size: 10pt;
									}

									.value
									{
									border-bottom: solid 1px black;
									font-style: italic;
									vertical-align: bottom;
									}
									
									.value_date
									{
									font-style: italic;
									}									
									
									.descr{
										font-size: 7pt;
										text-align: center;
										vertical-align: top;
									}
									
	
									.delim_3 {
									height: 3pt;
									}	
	
										.footnote{
										font-size: 7pt;
										text-align: left;
										vertical-align: top;
									}

									div.title, tr.title td { font-weight:bold;  }
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
								</style>
			</head>
			<body>
				<div class="page">
					<table width="100%">
						<tbody>
							<tr>
								<td align="center" style="font-weight:bold;">
									<br/>
									<br/>
									<xsl:text>Решение								</xsl:text>
									<br/>
									<xsl:text>о неотнесении товаров к товарам для личного пользования										</xsl:text>
								</td>
							</tr>
							<tr>
								<td class="delim_3">
									<br/>
								</td>
							</tr>
							<tr>
								<td align="center">
									<xsl:choose>
										<xsl:when test="npu:DesRegNum">
											<xsl:apply-templates mode="RegNum" select="npu:DesRegNum"/>
										</xsl:when>
										<xsl:otherwise>от "__" _________ 20__ г. № _______/_______/_______</xsl:otherwise>
									</xsl:choose>
								</td>
							</tr>
						</tbody>
					</table>
					<table width="100%">
						<tbody>
							<tr>
								<td class="delim_3">
									<br/>
								</td>
							</tr>
							<tr>
								<td class="value">
									<xsl:apply-templates select="npu:Customs" mode="CustomsOffice"/>
									<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
								</td>
							</tr>
							<tr>
								<td class="descr">
									<xsl:text>(наименование таможенного органа)</xsl:text>
								</td>
							</tr>
							<tr>
								<td class="delim_3">
									<br/>
								</td>
							</tr>
							<tr>
								<td class="value">
									<xsl:apply-templates select="npu:CustomsPersonDetails" mode="type1"/>
								</td>
							</tr>
							<tr>
								<td class="descr">
									<xsl:text>(должность, фамилия и инициалы должностного лица таможенного органа, принявшего решение)</xsl:text>
								</td>
							</tr>
							<tr>
								<td class="delim_3">
									<br/>
								</td>
							</tr>
							<tr>
								<td style="text-align:justify">В соответствии с пунктами 4 и 5 статьи 256 Таможенного кодекса Евразийского экономического союза<span class="descr">
										<sup> 1 </sup>
									</span> в отношении следующих товаров:<br/>
								</td>
							</tr>
							<tr>
								<td class="delim_3">
									<br/>
								</td>
							</tr>
							<xsl:for-each select="npu:Consignment/npu:Goods">
								<tr>
									<td class="value">
										<xsl:apply-templates select="npu:GoodsNumeric"/>) <xsl:for-each select="npu:GoodsDescription">
											<xsl:apply-templates select="."/>
										</xsl:for-each>
										<xsl:if test="npu:Specification">, <xsl:for-each select="npu:Specification">
												<xsl:apply-templates select="."/>
											</xsl:for-each>
										</xsl:if>
										<xsl:if test="npu:GoodsCostEuro">, <xsl:apply-templates select="npu:GoodsCostEuro/RUScat_ru:Amount"/>
											<xsl:apply-templates select="npu:GoodsCostEuro/RUScat_ru:CurrencyCode"/>
										</xsl:if>
										<xsl:if test="npu:SupplementaryQuantity">, <xsl:apply-templates select="npu:SupplementaryQuantity" mode="quantity"/>
										</xsl:if>
									</td>
								</tr>
								<tr>
									<td class="delim_3"/>
								</tr>
							</xsl:for-each>
							<tr>
								<td class="delim_3">
									<br/>
								</td>
							</tr>
							<tr>
								<td style="text-align:justify">перемещаемых через таможенную границу Евразийского экономического союза (далее - ЕАЭС) гражданином(кой)</td>
							</tr>
							<tr>
								<td class="delim_3"/>
							</tr>
							<tr>
								<td style="text-align:justify">фамилия</td>
							</tr>
							<tr>
								<td class="value">
									<xsl:apply-templates select="npu:Consignee/npu:Person/cat_ru:PersonSurname"/>
								</td>
							</tr>
							<tr>
								<td class="delim_3"/>
							</tr>
							<tr>
								<td style="text-align:justify">имя, отчество (при наличии)</td>
							</tr>
							<tr>
								<td class="value">
									<xsl:apply-templates select="npu:Consignee/npu:Person/cat_ru:PersonName"/>
									<xsl:if test="npu:Consignee/npu:Person/cat_ru:PersonMiddleName">&#160;<xsl:apply-templates select="npu:Consignee/npu:Person/cat_ru:PersonMiddleName"/>
									</xsl:if>
								</td>
							</tr>
							<tr>
								<td class="delim_3"/>
							</tr>
							<tr>
								<td style="text-align:justify">гражданство (национальность)</td>
							</tr>
							<tr>
								<td class="value">
									<xsl:apply-templates select="npu:Consignee/npu:IdentityCard/RUScat_ru:CountryCode"/>
									<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
								</td>
							</tr>
							<tr>
								<td class="delim_3"/>
							</tr>
							<tr>
								<td style="text-align:justify">документ, удостоверяющий личность</td>
							</tr>
							<tr>
								<td class="delim_3"/>
							</tr>
							<tr>
								<td class="value">
									<xsl:apply-templates select="npu:Consignee/npu:IdentityCard"/>
									<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
								</td>
							</tr>
							<tr>
								<td class="descr">
									<xsl:text>(наименование, номер, дата выдачи, орган, выдавший документ)</xsl:text>
								</td>
							</tr>
							<tr>
								<td class="delim_3">
									<br/>
								</td>
							</tr>
							<tr>
								<td style="text-align:justify">ИСХОДЯ ИЗ:</td>
							</tr>
							<tr>
								<td class="delim_3"/>
							</tr>
							<tr>
								<td>
									<table>
										<tbody align="center">
											<tr>
												<td align="center" class="bordered" width="20%">Наименования товара</td>
												<td align="center" class="bordered" width="20%">Характера товара</td>
												<td align="center" class="bordered" width="20%">Количества товара</td>
												<td align="center" class="bordered" width="40%">Частоты перемещения товаров через таможенную границу ЕАЭС физическим лицом, перемещающим товары, или в его адрес</td>
											</tr>
											<xsl:for-each select="npu:Consignment/npu:Goods">
												<tr>
													<td class="bordered">
														<xsl:for-each select="npu:GoodsDescription">
															<xsl:apply-templates select="."/>
														</xsl:for-each>
													</td>
													<td class="bordered">
														<xsl:for-each select="npu:Specification">
															<xsl:apply-templates select="."/>
														</xsl:for-each>
													</td>
													<td class="bordered">
														<xsl:apply-templates select="npu:SupplementaryQuantity" mode="quantity"/>
													</td>
													<td class="bordered">
														<xsl:apply-templates select="../../npu:GoodsFrequency"/>
													</td>
												</tr>
											</xsl:for-each>
										</tbody>
									</table>
								</td>
							</tr>
							<tr>
								<td class="delim_3">
									<br/>
								</td>
							</tr>
							<tr>
								<td style="text-align:justify">Дата последнего пересечения таможенной границы ЕАЭС/последнего перемещения товаров
								               <xsl:choose>
										<xsl:when test="npu:PrevConsignment/npu:PrevGoods/npu:GoodsDate">
											<span class="value">
												<xsl:for-each select="npu:PrevConsignment/npu:PrevGoods/npu:GoodsDate">
													<xsl:sort order="descending"/>
													<xsl:if test="position() = 1">
														<greatest>
															<xsl:apply-templates select="." mode="date"/>
														</greatest>
													</xsl:if>
												</xsl:for-each>
											</span>
										</xsl:when>
										<xsl:otherwise>
											<xsl:text>______________</xsl:text>
										</xsl:otherwise>
									</xsl:choose>
								</td>
							</tr>
							<tr>
								<td class="delim_3">
									<br/>
								</td>
							</tr>
							<tr>
								<td style="text-align:justify">Сведения о предыдущих фактах пересечения таможенной границы ЕАЭС/фактах перемещения товаров </td>
							</tr>
							<xsl:for-each select="npu:PrevConsignment/npu:PrevGoods[npu:GoodsDate]">
								<xsl:sort select="npu:GoodsDate" order="descending"/>
								<xsl:if test="position() &lt;= 5">
									<tr>
										<td class="value">
											<xsl:apply-templates select="npu:GoodsDate" mode="PrevGoods"/>
										</td>
									</tr>
									<tr>
										<td class="delim_3"/>
									</tr>
								</xsl:if>
							</xsl:for-each>
						</tbody>
					</table>
					<table width="100%">
						<tbody>
							<tr>
								<td class="delim_3">
									<br/>
									<br/>
								</td>
							</tr>
							<tr>
								<td>
									<table width="100%">
										<tbody>
											<tr>
												<td width="30%">
													<xsl:choose>
														<xsl:when test="npu:DesRegNum/cat_ru:RegistrationDate">
															<xsl:apply-templates select="npu:DesRegNum/cat_ru:RegistrationDate" mode="date_text"/>
														</xsl:when>
														<xsl:otherwise>"__" ________ 20__ г.</xsl:otherwise>
													</xsl:choose>
													<!--xsl:text>"__" ________ 20__ г.</xsl:text-->
												</td>
												<td width="5%"/>
												<td class="value" width="65%">
													<xsl:apply-templates select="npu:Consignee/npu:Person" mode="person_base"/>
												</td>
											</tr>
											<tr>
												<td align="center" class="descr">(дата)</td>
												<td class="descr"/>
												<td align="center" class="descr">(подпись, фамилия, имя и отчество (при наличии) лица, перемещающего товары через таможенную границу ЕАЭС, либо лица, осуществляющего перевозку указанных товаров в адрес иного физического лица)</td>
											</tr>
											<tr>
												<td colspan="3" class="delim_3">
													<br/>
												</td>
											</tr>
											<tr>
												<td>
													<xsl:choose>
														<xsl:when test="npu:DesRegNum/cat_ru:RegistrationDate">
															<xsl:apply-templates select="npu:DesRegNum/cat_ru:RegistrationDate" mode="date_text"/>
														</xsl:when>
														<xsl:otherwise>"__" ________ 20__ г.</xsl:otherwise>
													</xsl:choose>
												</td>
												<td/>
												<td class="value">
													<xsl:apply-templates select="npu:CustomsPersonDetails" mode="signature"/>
												</td>
											</tr>
											<tr>
												<td align="center" class="descr">(дата)</td>
												<td class="descr"/>
												<td align="center" class="descr">(подпись, фамилия и инициалы должностного лица таможенного органа, личная номерная печать)</td>
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
								<td class="footnote">
									<sup>1</sup>Федеральный закон от 14 ноября 2017 г. № 317-ФЗ "О ратификации Договора о Таможенном кодексе Евразийского экономического союза" (Собрание законодательства Российской Федерации, 2017, № 47, ст. 6843).</td>
							</tr>
							<xsl:if test="count(npu:PrevConsignment/npu:PrevGoods[npu:GoodsDate]) &gt; 5">
								<tr>
									<td class="delim_3">
										<br/>
										<br/>
									</td>
								</tr>
								<tr>
									<td align="right">
										<xsl:text>Смотри дополнительный лист</xsl:text>
									</td>
								</tr>
							</xsl:if>
						</tbody>
					</table>
				</div>
				<xsl:if test="count(npu:PrevConsignment/npu:PrevGoods[npu:GoodsDate]) &gt; 5">
					<div class="page">
						<table width="100%">
							<tbody>
								<tr>
									<td align="right">
										<xsl:choose>
											<xsl:when test="npu:DesRegNum">№ <span class="value">
													<xsl:apply-templates select="npu:DesRegNum/cat_ru:CustomsCode"/>
												</span>/<span class="value">
													<xsl:apply-templates mode="gtd_date" select="npu:DesRegNum/cat_ru:RegistrationDate"/>
												</span>/<span class="value">
													<xsl:apply-templates mode="gtd_date" select="npu:DesRegNum/cat_ru:GTDNumber"/>
												</span>
											</xsl:when>
											<xsl:otherwise>от "__" _________ 20__ г. № _______/_______/_______</xsl:otherwise>
										</xsl:choose>
									</td>
								</tr>
								<tr>
									<td class="delim_3">
										<br/>
									</td>
								</tr>
							</tbody>
						</table>
						<table width="100%">
							<tbody>
								<tr>
									<td style="text-align:justify">Сведения о предыдущих фактах пересечения таможенной границы ЕАЭС/фактах перемещения товаров </td>
								</tr>
								<xsl:for-each select="npu:PrevConsignment/npu:PrevGoods[npu:GoodsDate]">
									<xsl:sort select="npu:GoodsDate" order="descending"/>
									<xsl:if test="position() &gt; 5">
										<tr>
											<td class="value">
												<xsl:apply-templates select="npu:GoodsDate" mode="PrevGoods"/>
											</td>
										</tr>
										<tr>
											<td class="delim_3"/>
										</tr>
									</xsl:if>
								</xsl:for-each>
							</tbody>
						</table>
						<table width="100%">
							<tbody>
								<tr>
									<td class="delim_3">
										<br/>
										<br/>
									</td>
								</tr>
								<tr>
									<td>
										<table width="100%">
											<tbody>
												<tr>
													<td width="30%">
														<xsl:text>"__" ________ 20__ г.</xsl:text>
													</td>
													<td width="5%"/>
													<td class="value" width="65%">
														<xsl:apply-templates select="npu:Consignee/npu:Person" mode="person_base"/>
													</td>
												</tr>
												<tr>
													<td align="center" class="descr">(дата)</td>
													<td class="descr"/>
													<td align="center" class="descr">(подпись, фамилия, имя и отчество (при наличии) лица, перемещающего товары через таможенную границу ЕАЭС, либо лица, осуществляющего перевозку указанных товаров в адрес иного физического лица)</td>
												</tr>
												<tr>
													<td colspan="3" class="delim_3">
														<br/>
													</td>
												</tr>
												<tr>
													<td>
														<xsl:choose>
															<xsl:when test="npu:DesRegNum/cat_ru:RegistrationDate">
																<xsl:apply-templates select="npu:DesRegNum/cat_ru:RegistrationDate" mode="date_text"/>
															</xsl:when>
															<xsl:otherwise>"__" ________ 20__ г.</xsl:otherwise>
														</xsl:choose>
													</td>
													<td/>
													<td class="value">
														<xsl:apply-templates select="npu:CustomsPersonDetails" mode="signature"/>
													</td>
												</tr>
												<tr>
													<td align="center" class="descr">(дата)</td>
													<td class="descr"/>
													<td align="center" class="descr">(подпись, фамилия и инициалы должностного лица таможенного органа, личная номерная печать)</td>
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
									<td class="footnote">
										<sup>1</sup>Федеральный закон от 14 ноября 2017 г. № 317-ФЗ "О ратификации Договора о Таможенном кодексе Евразийского экономического союза" (Собрание законодательства Российской Федерации, 2017, № 47, ст. 6843).</td>
								</tr>
							</tbody>
						</table>
					</div>
				</xsl:if>
			</body>
		</html>
	</xsl:template>
	<xsl:template mode="RegNum" match="*"> от <xsl:apply-templates select="cat_ru:RegistrationDate" mode="date_text"/> № <span class="value">
			<xsl:apply-templates select="cat_ru:CustomsCode"/>
		</span>/<span class="value">
			<xsl:apply-templates mode="gtd_date" select="cat_ru:RegistrationDate"/>
		</span>/<span class="value">
			<xsl:apply-templates mode="gtd_date" select="cat_ru:GTDNumber"/>
		</span>
	</xsl:template>
	<xsl:template match="*" mode="date_text">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:call-template name="date_text">
				<xsl:with-param name="dateIn" select="."/>
			</xsl:call-template>
		</element>
	</xsl:template>
	<xsl:template name="date_text">
		<xsl:param name="dateIn"/>" <span class="value">
			<xsl:value-of select="substring($dateIn,9,2)"/>
		</span> " <xsl:variable name="month" select="substring($dateIn, 6, 2)"/>
		<span class="value">
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
		</span>&#160;<xsl:value-of select="substring($dateIn,1,2)"/>
		<span class="value">
			<xsl:value-of select="substring($dateIn,3,2)"/>
		</span> г.</xsl:template>
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
	<xsl:template mode="CustomsOffice" match="*">
		<xsl:apply-templates select="cat_ru:OfficeName"/>
		<xsl:if test="cat_ru:OfficeName">
			<xsl:text> (</xsl:text>
		</xsl:if>
		<xsl:apply-templates select="cat_ru:Code"/>
		<xsl:if test="cat_ru:OfficeName">
			<xsl:text>)</xsl:text>
		</xsl:if>
	</xsl:template>
	<xsl:template match="*" mode="person_base">
		<xsl:text> </xsl:text>
		<xsl:apply-templates select="cat_ru:PersonSurname"/>
		<xsl:text> </xsl:text>
		<xsl:apply-templates select="cat_ru:PersonName"/>
		<xsl:text> </xsl:text>
		<xsl:apply-templates select="cat_ru:PersonMiddleName"/>
	</xsl:template>
	<xsl:template match="npu:CustomsPersonDetails" mode="type1">
		<xsl:apply-templates select="cat_ru:PersonPost"/>
		<xsl:text> </xsl:text>
		<xsl:apply-templates select="cat_ru:PersonSurname"/>
		<xsl:text> </xsl:text>
		<xsl:apply-templates select="cat_ru:PersonName"/>
		<xsl:text> </xsl:text>
		<xsl:apply-templates select="cat_ru:PersonMiddleName"/>
	</xsl:template>
	<xsl:template match="*" mode="signature">
		<xsl:apply-templates select="cat_ru:PersonPost"/>
		<xsl:text> </xsl:text>
		<xsl:apply-templates select="cat_ru:PersonSurname"/>
		<xsl:text> </xsl:text>
		<xsl:apply-templates select="cat_ru:PersonName"/>
		<xsl:text> </xsl:text>
		<xsl:apply-templates select="cat_ru:PersonMiddleName"/>
		<xsl:if test="RUScat_ru:LNP">, ЛНП: <xsl:apply-templates select="RUScat_ru:LNP"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:CustomsCode"> (<xsl:apply-templates select="RUScat_ru:CustomsCode"/>)</xsl:if>
	</xsl:template>
	<xsl:template mode="quantity" match="*">
		<xsl:apply-templates select="cat_ru:GoodsQuantity"/>
		<xsl:text> </xsl:text>
		<xsl:apply-templates select="cat_ru:MeasureUnitQualifierName"/>
		<xsl:if test="cat_ru:MeasureUnitQualifierCode">
			<xsl:text> (</xsl:text>
			<xsl:apply-templates select="cat_ru:MeasureUnitQualifierCode"/>
			<xsl:text>)</xsl:text>
		</xsl:if>
	</xsl:template>
	<xsl:template match="*" mode="PrevGoods">
		<br>
			<xsl:apply-templates select="." mode="date"/>
			<xsl:text> № </xsl:text>
			<xsl:apply-templates select="../npu:GoodsNumeric"/>
			<xsl:text> </xsl:text>
			<xsl:for-each select="../npu:GoodsDescription">
				<xsl:apply-templates select="."/>
			</xsl:for-each>
			<xsl:text>, вес нетто, кг:</xsl:text>
			<xsl:apply-templates select="../npu:GrossWeight"/>
			<xsl:text>, стоимость: </xsl:text>
			<xsl:apply-templates select="../npu:GrossWeight"/>
			<xsl:text> (EUR)</xsl:text>
		</br>
	</xsl:template>
	<xsl:template match="npu:IdentityCard">
		<xsl:for-each select="*">
			<xsl:choose>
				<xsl:when test="local-name()='IdentityCardDate'">
					<xsl:apply-templates select="." mode="date"/>
					<!--xsl:call-template name="russian_date">
						<xsl:with-param name="dateIn" select="."/>
					</xsl:call-template-->
				</xsl:when>
				<xsl:when test="local-name()='DocValidityDate'">
					<xsl:text>(окончание срока действия: </xsl:text>
					<xsl:apply-templates select="." mode="date"/>
					<!--xsl:call-template name="russian_date">
						<xsl:with-param name="dateIn" select="."/>
					</xsl:call-template-->
					<xsl:text>)</xsl:text>
				</xsl:when>
				<xsl:otherwise>
					<xsl:apply-templates select="."/>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:if test="position()!=last()">
				<xsl:text> </xsl:text>
			</xsl:if>
		</xsl:for-each>
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
</xsl:stylesheet>
