<?xml version="1.0" encoding="UTF-8"?>
<!-- Приказ ФТС России от 05.02.2019 № 181 
IDDoc = 'ОЗ' - Приложение 4 - Решение об отказе в рассмотрении заявления о принятии предварительного решения о происхождении товара
IDDoc = 'ОП' - Приложение 6 -  Решение об отказе в принятии предварительного решения о происхождении товара
IDDoc = 'РО' Приложение 8 - Решение об отзыве предварительного решения о происхождении товара
IDDoc = 'РП' Приложение 10 - о прекращении действия предварительного решения о происхождении товара в соответствии сТН ВЭД-->
<xsl:stylesheet version="1.0" xmlns="http://www.w3.org/1999/xhtml" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" xmlns:catESAD_cu="urn:customs.ru:CUESADCommonAggregateTypesCust:5.28.0" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.24.0" xmlns:RUSclt_ru="urn:customs.ru:RUSCommonLeafTypes:5.21.0" xmlns:dpo="urn:customs.ru:Information:CustomsDocuments:DecisionPreliminaryOrigin:5.24.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" encoding="utf-8" indent="yes" media-type="text/html" method="html" omit-xml-declaration="yes" version="1.0"/>
	<xsl:template match="dpo:DecisionPreliminaryOrigin">
		<html>
			<head>
				<meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
				<title>Решение о происхождении товара</title>
				<style type="text/css">
					body {
					background: #cccccc;
					font-family: Arial;
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
					max-width: 100%;
					border: 0;
					empty-cells: show;
					border-collapse: collapse;
					margin-top: 1px;
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
					vertical-align:bottom;
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
	
					.descr{
					font-size: 8pt;
					text-align: center;
					vertical-align:top;
					}
					.indent{
					text-indent: 1.5em;
					}

					.delim_3 {
					height: 3pt;
					}
					
					.delim_3 {
						height: 3pt;
					}

					.graphMain
					{
					font-family: Arial;
					font-size: 11pt;
					}
					
					@media print {
						div.page {
							border: none;
						}
					}					
				</style>
			</head>
			<body>
				<div class="page">
					<table class="graphMain">
						<tbody>
							<tr>
								<td align="center" class="title">
									<font size="4">
										<b>Решение<br>
												<xsl:choose>
													<xsl:when test="dpo:RegistryNumber/dpo:IDDoc='ОЗ'">
														<xsl:text>об отказе в рассмотрении заявления о принятии предварительного решения о происхождении товара</xsl:text>
													</xsl:when>
													<xsl:when test="dpo:RegistryNumber/dpo:IDDoc='ОП'">
														<xsl:text>об отказе в принятии предварительного решения о происхождении товара</xsl:text>
													</xsl:when>
													<xsl:when test="dpo:RegistryNumber/dpo:IDDoc='РО'">
														<xsl:text>об отзыве предварительного решения о происхождении товара</xsl:text>
													</xsl:when>
													<xsl:when test="dpo:RegistryNumber/dpo:IDDoc='РП'">
														<xsl:text>о прекращении действия предварительного решения о происхождении товара</xsl:text>
													</xsl:when>
												</xsl:choose>
											</br>
										</b>
									</font>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<table class="graphMain">
						<tbody>
							<tr valign="top">
								<td width="50%" class="bordered">
									<xsl:text>1. Таможенный орган, принявший решение </xsl:text>
									<xsl:choose>
										<xsl:when test="dpo:RegistryNumber/dpo:IDDoc='ОЗ'">
											<xsl:text>об отказе в рассмотрении заявления о принятии предварительного решения о происхождении товара </xsl:text>
										</xsl:when>
										<xsl:when test="dpo:RegistryNumber/dpo:IDDoc='ОП'">
											<xsl:text>об отказе в принятии предварительного решения о происхождении товара </xsl:text>
										</xsl:when>
										<xsl:when test="dpo:RegistryNumber/dpo:IDDoc='РО'">
											<xsl:text>об отзыве предварительного решения о происхождении товара </xsl:text>
										</xsl:when>
										<xsl:when test="dpo:RegistryNumber/dpo:IDDoc='РП'">
											<xsl:text>о прекращении действия предварительного решения о происхождении товара </xsl:text>
										</xsl:when>
									</xsl:choose>
									<br/>
									<br/>
									<i>
										<xsl:apply-templates mode="spaced" select="dpo:Customs"/>
									</i>
								</td>
								<td width="50%" class="bordered">
									<xsl:text>2. Сведения о заявителе</xsl:text>
									<br/>
									<br/>
									<i>
										<xsl:apply-templates mode="organization" select="dpo:Declarant"/>
									</i>
								</td>
							</tr>
							<tr>
								<td colspan="2" class="bordered">
									<xsl:text>3. Регистрационный номер решения </xsl:text>
									<xsl:choose>
										<xsl:when test="dpo:RegistryNumber/dpo:IDDoc='ОЗ'">
											<xsl:text>об отказе в рассмотрении заявления о принятии предварительного решения о происхождении товара</xsl:text>
										</xsl:when>
										<xsl:when test="dpo:RegistryNumber/dpo:IDDoc='ОП'">
											<xsl:text>об отказе в принятии предварительного решения о происхождении товара</xsl:text>
										</xsl:when>
										<xsl:when test="dpo:RegistryNumber/dpo:IDDoc='РО'">
											<xsl:text>об отзыве предварительного решения о происхождении товара</xsl:text>
										</xsl:when>
										<xsl:when test="dpo:RegistryNumber/dpo:IDDoc='РП'">
											<xsl:text>о прекращении действия предварительного решения о происхождении товара</xsl:text>
										</xsl:when>
									</xsl:choose>
									<br/>
									<br/>
									<i>
										<xsl:apply-templates select="dpo:RegistryNumber"/>
									</i>
								</td>
							</tr>
							<xsl:choose>
								<xsl:when test="(dpo:RegistryNumber/dpo:IDDoc='ОЗ') or (dpo:RegistryNumber/dpo:IDDoc='ОП')">
									<tr valign="top">
										<td width="50%" class="bordered">
											<xsl:text>4. Номер заявления о принятии предварительного решения о происхождении товара</xsl:text>
											<br/>
											<br/>
											<i>
												<xsl:value-of select="dpo:ApplicationRegistration/cat_ru:PrDocumentNumber"/>
											</i>
										</td>
										<td width="50%" class="bordered">
											<xsl:text>5. Дата заявления о принятии предварительного решения о происхождении товара (число, месяц, год)</xsl:text>
											<br/>
											<br/>
											<span style="text-align:bottom">
												<i>
													<xsl:call-template name="russian_date">
														<xsl:with-param select="dpo:ApplicationRegistration/cat_ru:PrDocumentDate" name="dateIn"/>
													</xsl:call-template>
												</i>
											</span>
										</td>
									</tr>
									<tr>
										<td colspan="2" class="bordered">
											<xsl:text>6. Наименование товара, указанного в заявлении о принятии предварительного решения о происхождении товара</xsl:text>
											<br/>
											<br/>
											<i>
												<xsl:apply-templates mode="GoodsStr" select="dpo:Goods"/>
											</i>
										</td>
									</tr>
									<tr>
										<td colspan="2" class="bordered">
											<xsl:text>7. Основание принятия решения </xsl:text>
											<xsl:choose>
												<xsl:when test="dpo:RegistryNumber/dpo:IDDoc='ОЗ'">
													<xsl:text>об отказе в рассмотрении заявления о принятии предварительного решения о происхождении товара</xsl:text>
												</xsl:when>
												<xsl:when test="dpo:RegistryNumber/dpo:IDDoc='ОП'">
													<xsl:text>об отказе в принятии предварительного решения о происхождении товара</xsl:text>
												</xsl:when>
											</xsl:choose>
											<br/>
											<br/>
											<xsl:choose>
												<xsl:when test="dpo:RegistryNumber/dpo:IDDoc='ОЗ'">
													<i>
														<xsl:for-each select="dpo:ReasonsForDecision">
															<xsl:text>пункт </xsl:text>
															<xsl:value-of select="."/>
															<xsl:if test="position()!=last()">
																<xsl:text>, </xsl:text>
															</xsl:if>
														</xsl:for-each>
														<xsl:text> части 9 статьи 22 Федерального закона от 3 августа 2018 г. N 289-ФЗ "О таможенном регулировании в Российской Федерации и о внесении изменений в отдельные законодательные акты Российской Федерации"</xsl:text>
													</i>
												</xsl:when>
												<xsl:when test="dpo:RegistryNumber/dpo:IDDoc='ОП'">
													<i>
														<xsl:for-each select="dpo:ReasonsForDecision">
															<xsl:text>пункт </xsl:text>
															<xsl:value-of select="."/>
															<xsl:if test="position()!=last()">
																<xsl:text>, </xsl:text>
															</xsl:if>
														</xsl:for-each>
														<xsl:text> части 15 статьи 22 Федерального закона от 3 августа 2018 г. N 289-ФЗ "О таможенном регулировании в Российской Федерации и о внесении изменений в отдельные законодательные акты Российской Федерации"</xsl:text>
													</i>
												</xsl:when>
											</xsl:choose>
										</td>
									</tr>
									<tr>
										<td colspan="2" class="bordered">
											<xsl:text>8. Причины принятия решения </xsl:text>
											<xsl:choose>
												<xsl:when test="dpo:RegistryNumber/dpo:IDDoc='ОЗ'">
													<xsl:text>об отказе в рассмотрении заявления о принятии предварительного решения о происхождении товара:</xsl:text>
												</xsl:when>
												<xsl:when test="dpo:RegistryNumber/dpo:IDDoc='ОП'">
													<xsl:text>об отказе в принятии предварительного решения о происхождении товара:</xsl:text>
												</xsl:when>
											</xsl:choose>
											<br/>
											<br/>
											<xsl:for-each select="dpo:InterpretationRules">
												<br>
													<xsl:text>8.</xsl:text>
													<xsl:value-of select="position()"/>
													<xsl:text>&#160;</xsl:text>
													<i>
														<xsl:value-of select="."/>
													</i>
												</br>
											</xsl:for-each>
										</td>
									</tr>
								</xsl:when>
							</xsl:choose>
							<xsl:choose>
								<xsl:when test="(dpo:RegistryNumber/dpo:IDDoc='РО') or (dpo:RegistryNumber/dpo:IDDoc='РП')">
									<tr>
										<td colspan="2" class="bordered">
											<xsl:choose>
												<xsl:when test="dpo:RegistryNumber/dpo:IDDoc='РО'">
													<xsl:choose>
														<xsl:when test="count(dpo:PreliminaryDecisionNum)>1">
															<xsl:text>4. Регистрационные номера отзываемых предварительных решений о происхождении товара</xsl:text>
														</xsl:when>
														<xsl:otherwise>4. Регистрационный номер отзываемого предварительного решения о происхождении товара</xsl:otherwise>
													</xsl:choose>
												</xsl:when>
												<xsl:when test="dpo:RegistryNumber/dpo:IDDoc='РП'">
													<xsl:text>4. Регистрационный номер предварительного решения о происхождении товара, действие которого прекращается</xsl:text>
												</xsl:when>
											</xsl:choose>
											<br/>
											<br/>
											<xsl:choose>
												<xsl:when test="count(dpo:PreliminaryDecisionNum)>1">
													<i>
														<xsl:for-each select="dpo:PreliminaryDecisionNum">
															<xsl:text>4.</xsl:text>
															<xsl:value-of select="position()"/>
															<xsl:text>  </xsl:text>
															<xsl:apply-templates select="."/>
															<br/>
														</xsl:for-each>
													</i>
												</xsl:when>
												<xsl:otherwise>
													<i>
														<xsl:for-each select="dpo:PreliminaryDecisionNum">
															<xsl:apply-templates select="."/>
														</xsl:for-each>
													</i>
												</xsl:otherwise>
											</xsl:choose>
										</td>
									</tr>
									<tr>
										<td colspan="2" class="bordered">
											<xsl:choose>
												<xsl:when test="dpo:RegistryNumber/dpo:IDDoc='РО'">
													<xsl:choose>
														<xsl:when test="count(dpo:PreliminaryDecisionNum)>1">
															<xsl:text>5. Наименования товаров, указанные в отзываемых предварительных решениях о происхождении товара</xsl:text>
														</xsl:when>
														<xsl:otherwise>5. Наименование товара, указанное в отзываемом предварительном решении о происхождении товара</xsl:otherwise>
													</xsl:choose>
												</xsl:when>
												<xsl:when test="dpo:RegistryNumber/dpo:IDDoc='РП'">
													<xsl:text>5. Наименование товара, указанное в отзываемом предварительном решении о происхождении товара, действие которого прекращается</xsl:text>
												</xsl:when>
											</xsl:choose>
											<br/>
											<br/>
											<xsl:choose>
												<xsl:when test="count(dpo:PreliminaryDecisionNum)>1">
													<i>
														<xsl:for-each select="dpo:Goods">
															<xsl:text>5.</xsl:text>
															<xsl:value-of select="position()"/>
															<xsl:text>  </xsl:text>
															<xsl:apply-templates mode="GoodsStr" select="."/>
															<br/>
														</xsl:for-each>
													</i>
												</xsl:when>
												<xsl:otherwise>
													<i>
														<xsl:for-each select="dpo:Goods">
															<xsl:apply-templates mode="GoodsStr" select="."/>
														</xsl:for-each>
													</i>
												</xsl:otherwise>
											</xsl:choose>
										</td>
									</tr>
									<tr>
										<td colspan="2" class="bordered">
											<xsl:text>6. Основание принятия решения </xsl:text>
											<xsl:choose>
												<xsl:when test="dpo:RegistryNumber/dpo:IDDoc='РО'">
													<xsl:text>об отзыве предварительного решения о происхождении товара</xsl:text>
												</xsl:when>
												<xsl:when test="dpo:RegistryNumber/dpo:IDDoc='РП'">
													<xsl:text>о прекращении действия предварительного решения о происхождении товара</xsl:text>
												</xsl:when>
											</xsl:choose>
											<br/>
											<br/>
											<xsl:choose>
												<xsl:when test="dpo:RegistryNumber/dpo:IDDoc='РО'">
													<i>
														<xsl:text> пункт 6 статьи 36 Таможенного кодекса Евразийского экономического союза</xsl:text>
													</i>
												</xsl:when>
												<xsl:when test="dpo:RegistryNumber/dpo:IDDoc='РП'">
													<i>
														<xsl:for-each select="dpo:ReasonsForDecision">
															<xsl:text>подпункт </xsl:text>
															<xsl:value-of select="."/>
															<xsl:if test="position()!=last()">
																<xsl:text>, </xsl:text>
															</xsl:if>
														</xsl:for-each>
														<xsl:text> пункта 3 статьи 36 Таможенного кодекса Евразийского экономического союза</xsl:text>
													</i>
												</xsl:when>
											</xsl:choose>
										</td>
									</tr>
									<tr>
										<td colspan="2" class="bordered">
											<xsl:choose>
												<xsl:when test="dpo:RegistryNumber/dpo:IDDoc='РО'">
													<xsl:text>7. Причина принятия решения об отзыве предварительного решения о происхождении товара:</xsl:text>
												</xsl:when>
												<xsl:when test="dpo:RegistryNumber/dpo:IDDoc='РП'">
													<xsl:text>7. Причины принятия решения о прекращении действия предварительного решения о происхождении товара:</xsl:text>
												</xsl:when>
											</xsl:choose>
											<br/>
											<br/>
											<xsl:for-each select="dpo:InterpretationRules">
												<br>
													<xsl:text>7.</xsl:text>
													<xsl:value-of select="position()"/>
													<xsl:text>&#160;</xsl:text>
													<i>
														<xsl:value-of select="."/>
													</i>
												</br>
											</xsl:for-each>
										</td>
									</tr>
									<tr>
										<td colspan="2" class="bordered">
											<xsl:text>8. Дата вступления в силу решения </xsl:text>
											<xsl:choose>
												<xsl:when test="dpo:RegistryNumber/dpo:IDDoc='РО'">
													<xsl:text>об отзыве предварительного решения о происхождении товара</xsl:text>
												</xsl:when>
												<xsl:when test="dpo:RegistryNumber/dpo:IDDoc='РП'">
													<xsl:text>о прекращении действия предварительного решения о происхождении товара</xsl:text>
												</xsl:when>
											</xsl:choose>
											<br/>
											<br/>
											<i>
												<xsl:call-template name="russian_date">
													<xsl:with-param select="dpo:DateEntryIntoForce" name="dateIn"/>
												</xsl:call-template>
											</i>
										</td>
									</tr>
								</xsl:when>
							</xsl:choose>
							<tr>
								<td class="bordered" colspan="2">
									<xsl:text>9. Должностное лицо таможенного органа</xsl:text>
									<xsl:choose>
										<xsl:when test="dpo:RegistryNumber/dpo:IDDoc='ОЗ'">
											<xsl:text>, принявшее решение об отказе в рассмотрении заявления о принятии предварительного решения о происхождении товара</xsl:text>
										</xsl:when>
										<xsl:when test="dpo:RegistryNumber/dpo:IDDoc='ОП'">
											<xsl:text>, принявшее решение об отказе в принятии предварительного решения о происхождении товара</xsl:text>
										</xsl:when>
										<xsl:when test="dpo:RegistryNumber/dpo:IDDoc='РП'">
											<xsl:text>, принявшее решение об отзыве предварительного решения о происхождении товара</xsl:text>
										</xsl:when>
										<xsl:when test="dpo:RegistryNumber/dpo:IDDoc='РО'">
											<xsl:text>, принявшее решение о прекращении действия предварительного решения о происхождении товара</xsl:text>
										</xsl:when>
									</xsl:choose>
									<br/>
									<br/>
									<xsl:apply-templates select="dpo:CustomsPerson" mode="Signature"/>
									<br/>
									<br/>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</body>
		</html>
	</xsl:template>
	<xsl:template match="*" mode="GoodsStr">
		<xsl:value-of select="dpo:Description"/>
		<xsl:if test="dpo:CorporateDescription">
			<xsl:if test="dpo:Description">
				<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>(</xsl:if>
			<xsl:value-of select="dpo:CorporateDescription"/>
			<xsl:if test="dpo:Description">) </xsl:if>
		</xsl:if>
		<xsl:text>&#160;</xsl:text>
		<xsl:for-each select="dpo:Technology |dpo:Purpose | dpo:Standard | dpo:Kind | dpo:Mark | dpo:Model | dpo:Arti | dpo:MaterialsName | dpo:Features | dpo:Container">
			<xsl:if test="position() > 1">
				<xsl:text>, </xsl:text>
			</xsl:if>
			<xsl:apply-templates select="."/>
		</xsl:for-each>
		<xsl:if test="dpo:Other">
			<xsl:text>&#160;</xsl:text>
			<xsl:value-of select="dpo:Other"/>
		</xsl:if>
		<xsl:if test="dpo:PresumedTNVEDCode">
			<xsl:if test="dpo:Other">
				<xsl:text> (</xsl:text>
			</xsl:if>
			<xsl:value-of select="dpo:PresumedTNVEDCode"/>
			<xsl:if test="dpo:Other">
				<xsl:text>)</xsl:text>
			</xsl:if>
		</xsl:if>
		<xsl:if test="position()!=last()">
			<xsl:text>;&#160;</xsl:text>
		</xsl:if>
	</xsl:template>
	<xsl:template mode="GoodsStr" match="*">
		<i>
			<xsl:value-of select="dpo:GoodsName"/>
			<xsl:if test="dpo:GoodsFirmName">
				<xsl:if test="dpo:GoodsName">
					<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>(</xsl:if>
				<xsl:value-of select="dpo:GoodsFirmName"/>
				<xsl:if test="dpo:GoodsName">) </xsl:if>
			</xsl:if>
			<xsl:text>;</xsl:text>
		</i>
		<i>
			<xsl:for-each select="dpo:Purpose | dpo:Kind | dpo:Mark | dpo:Model | dpo:Article | dpo:PackageDescription | dpo:OtherInformation | dpo:TNVEDCode">
				<xsl:if test="position() > 1">
					<xsl:text>, </xsl:text>
				</xsl:if>
				<xsl:apply-templates select="."/>
			</xsl:for-each>
			<xsl:text>;</xsl:text>
		</i>
		<xsl:if test="dpo:Amount">
			<xsl:text>&#160;</xsl:text>
			<span>
				<i>
					<xsl:value-of select="dpo:Amount/RUScat_ru:Amount"/>
					<xsl:text>&#160;(</xsl:text>
					<xsl:value-of select="dpo:Amount/RUScat_ru:CurrencyCode"/>
					<xsl:text>)</xsl:text>
					<xsl:text>;</xsl:text>
				</i>
			</span>
		</xsl:if>
		<xsl:if test="dpo:GoodsMaterials">
			<xsl:text> материалы: </xsl:text>
			<span>
				<i>
					<xsl:for-each select="dpo:GoodsMaterials">
						<xsl:value-of select="position()"/>
						<xsl:text>:&#160;</xsl:text>
						<xsl:value-of select="dpo:Name"/>
						<xsl:if test="dpo:HarmonizedCode">
							<xsl:if test="dpo:Name">
								<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>(</xsl:if>
							<xsl:value-of select="dpo:HarmonizedCode"/>
							<xsl:if test="dpo:Name">) </xsl:if>
						</xsl:if>
						<xsl:value-of select="dpo:Price"/>
						<xsl:if test="dpo:CurrencyCode">
							<xsl:if test="dpo:Price">
								<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>(</xsl:if>
							<xsl:value-of select="dpo:CurrencyCode"/>
							<xsl:if test="dpo:Price">) </xsl:if>
						</xsl:if>
						<xsl:value-of select="dpo:Country/dpo:CountryName"/>
						<xsl:if test="dpo:Country/dpo:CountryCode">
							<xsl:if test="dpo:Country/dpo:CountryName">
								<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>(</xsl:if>
							<xsl:value-of select="dpo:Country/dpo:CountryCode"/>
							<xsl:if test="dpo:Country/dpo:CountryName">)</xsl:if>
						</xsl:if>
						<xsl:text>;</xsl:text>
					</xsl:for-each>
				</i>
			</span>
		</xsl:if>
		<span>
			<i>
				<xsl:for-each select="dpo:MakingProcessDescription">
					<xsl:value-of select="."/>
					<xsl:if test="position()!=last()">
						<xsl:text>&#160;</xsl:text>
					</xsl:if>
				</xsl:for-each>
			</i>
		</span>
	</xsl:template>
	<xsl:template match="*" mode="organization">
		<xsl:value-of select="cat_ru:OrganizationName"/>
		<xsl:if test="cat_ru:ShortName">
			<xsl:if test="cat_ru:OrganizationName">
				<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>(</xsl:if>
			<xsl:value-of select="cat_ru:ShortName"/>
			<xsl:if test="cat_ru:OrganizationName">)</xsl:if>
		</xsl:if>
		<xsl:if test="cat_ru:RFOrganizationFeatures or cat_ru:RKOrganizationFeatures or cat_ru:RBOrganizationFeatures or cat_ru:RAOrganizationFeatures or cat_ru:KGOrganizationFeatures and (cat_ru:OrganizationName or cat_ru:ShortName)">
			<xsl:apply-templates select="cat_ru:RFOrganizationFeatures"/>
			<xsl:apply-templates select="cat_ru:RKOrganizationFeatures"/>
			<xsl:apply-templates select="cat_ru:RBOrganizationFeatures"/>
			<xsl:apply-templates select="cat_ru:RAOrganizationFeatures"/>
			<xsl:apply-templates select="cat_ru:KGOrganizationFeatures"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:CountryA2Code">,&#032;Код страны:&#032;<xsl:value-of select="RUScat_ru:CountryA2Code"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:BusinessEntityTypeCode">
			<xsl:apply-templates select="RUScat_ru:BusinessEntityTypeCode"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:BusinessEntityTypeName">,&#032;ОПФ:&#032;<xsl:value-of select="RUScat_ru:BusinessEntityTypeName"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:UITN">
			<xsl:apply-templates select="RUScat_ru:UITN"/>
		</xsl:if>
		<xsl:for-each select="RUScat_ru:SubjectAddressDetails">,&#032;<xsl:apply-templates mode="AdressStr" select="."/>
		</xsl:for-each>
		<!--xsl:if test="RUScat_ru:CommunicationDetails">
			<span class="normal">
				<xsl:for-each select="RUScat_ru:CommunicationDetails">
					<xsl:call-template name="RUScat_ru:CommunicationDetails"/>
				</xsl:for-each>
			</span>
		</xsl:if-->
	</xsl:template>
	<xsl:template match="RUScat_ru:BusinessEntityTypeCode">
		<xsl:text> код объекта: </xsl:text>
		<xsl:value-of select="RUScat_ru:UnifiedCode"/>
		<xsl:if test="RUScat_ru:CodeListId">
			<xsl:text> код справочника: </xsl:text>
			<xsl:value-of select="RUScat_ru:CodeListId"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="RUScat_ru:UITN">
		<xsl:text>,&#032;УИТН:&#032;</xsl:text>
		<xsl:value-of select="RUScat_ru:UITNCode"/>
		<xsl:if test="RUScat_ru:CountryCode">
			<xsl:text> (</xsl:text>
			<xsl:value-of select="RUScat_ru:CountryCode"/>
			<xsl:text>)</xsl:text>
		</xsl:if>
	</xsl:template>
	<xsl:template match="cat_ru:ITN">
		<xsl:value-of select="cat_ru:CategoryCode"/>
		<xsl:text>-</xsl:text>
		<xsl:value-of select="cat_ru:KATOCode"/>
		<xsl:if test="cat_ru:RNN">
			<xsl:text>/</xsl:text>
			<xsl:value-of select="cat_ru:RNN"/>
		</xsl:if>
		<!--xsl:if test="cat_ru:ITNReserv">
			<xsl:if test="cat_ru:RNN"><xsl:text>/00000000</xsl:text></xsl:if>
			<xsl:text>/</xsl:text>
			<xsl:value-of select="cat_ru:ITNReserv"/>
		</xsl:if-->
	</xsl:template>
	<xsl:template match="cat_ru:KGOrganizationFeatures">
		<xsl:if test="cat_ru:KGINN">
			<xsl:text>ИНН / ПИН: </xsl:text>
			<xsl:value-of select="cat_ru:KGINN"/>
			<xsl:text>  </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:KGOKPO">
			<xsl:text>ОКПО: </xsl:text>
			<xsl:value-of select="cat_ru:KGOKPO"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="cat_ru:RAOrganizationFeatures">
		<xsl:if test="cat_ru:UNN">
			<xsl:text>УНН: </xsl:text>
			<xsl:value-of select="cat_ru:UNN"/>
			<xsl:text>  </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:SocialServiceNumber">
			<xsl:text>НЗОУ: </xsl:text>
			<xsl:value-of select="cat_ru:SocialServiceNumber"/>
			<xsl:text>  </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:SocialServiceCertificate">
			<xsl:text>Номер справки об НЗОУ: </xsl:text>
			<xsl:value-of select="cat_ru:SocialServiceCertificate"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="cat_ru:RBOrganizationFeatures">
		<xsl:if test="cat_ru:UNP">
			<xsl:text>УНП: </xsl:text>
			<xsl:value-of select="cat_ru:UNP"/>
			<xsl:text>  </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:RBIdentificationNumber">
			<xsl:text>Идентификационный номер физ.лица: </xsl:text>
			<xsl:value-of select="cat_ru:RBIdentificationNumber"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="cat_ru:RFOrganizationFeatures">
		<xsl:if test="cat_ru:OGRN">
			<xsl:text>ОГРН/ОГРНИП: </xsl:text>
			<xsl:value-of select="cat_ru:OGRN"/>
			<xsl:text>  </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:INN">
			<xsl:text>ИНН: </xsl:text>
			<xsl:value-of select="cat_ru:INN"/>
			<xsl:text>  </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:KPP">
			<xsl:text>КПП: </xsl:text>
			<xsl:value-of select="cat_ru:KPP"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="cat_ru:RKOrganizationFeatures">
		<xsl:if test="cat_ru:BIN">
			<xsl:text>БИН: </xsl:text>
			<xsl:value-of select="cat_ru:BIN"/>
			<xsl:text>  </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:IIN">
			<xsl:text>ИИН: </xsl:text>
			<xsl:value-of select="cat_ru:IIN"/>
			<xsl:text>  </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:ITN">
			<xsl:text>ИТН: </xsl:text>
			<xsl:apply-templates select="cat_ru:ITN"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="dpo:PreliminaryDecisionNum">
		<xsl:value-of select="dpo:CountryCode"/>/<xsl:value-of select="dpo:CustomsCode"/>/<xsl:call-template name="gtd_date">
			<xsl:with-param name="dateIn" select="dpo:Date"/>
		</xsl:call-template>/<xsl:value-of select="dpo:SerialNumber"/>/<xsl:value-of select="dpo:IndexElement"/>
		<xsl:if test="position()!=last()">
			<xsl:text>;&#160;</xsl:text>
			<br/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="dpo:RegistryNumber">
		<xsl:value-of select="dpo:CountryCode"/>/<xsl:value-of select="dpo:CustomsCode"/>/<xsl:call-template name="gtd_date">
			<xsl:with-param name="dateIn" select="dpo:Date"/>
		</xsl:call-template>/<xsl:value-of select="dpo:SerialNumber"/>/<xsl:value-of select="dpo:IDDoc"/>
	</xsl:template>
	<xsl:template match="*" mode="spaced">
		<xsl:for-each select="./*">
			<xsl:if test="position() &gt; 1">
				<xsl:text> </xsl:text>
			</xsl:if>
			<xsl:value-of select="."/>
		</xsl:for-each>
	</xsl:template>
	<xsl:template mode="AdressStr" match="RUScat_ru:SubjectAddressDetails">
		<xsl:choose>
			<xsl:when test="RUScat_ru:AddressText">
				<xsl:if test="RUScat_ru:AddressKindCode">
					<xsl:choose>
						<xsl:when test="RUScat_ru:AddressKindCode='1'">Адрес регистрации: </xsl:when>
						<xsl:when test="RUScat_ru:AddressKindCode='2'">Фактический адрес: </xsl:when>
						<xsl:when test="RUScat_ru:AddressKindCode='3'">Почтовый адрес: </xsl:when>
						<xsl:otherwise>Код вида адреса:  <xsl:value-of select="RUScat_ru:AddressKindCode"/>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:if>
				<xsl:value-of select="RUScat_ru:AddressText"/>
				<xsl:if test="position()!=last()">
					<xsl:text>; </xsl:text>
				</xsl:if>
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
								<xsl:value-of select="."/>
								<xsl:if test="position()!=$last">, </xsl:if>
							</xsl:if>
						</xsl:when>
						<xsl:when test="local-name()='KLADR' or local-name()='AOGUID' or local-name()='AOID'">
							<!--в этом случае ничего не выводим-->
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="."/>
							<xsl:if test="position()!=$last">, </xsl:if>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:for-each>
				<xsl:if test="position()!=last()">
					<xsl:text>; </xsl:text>
				</xsl:if>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template mode="Signature" match="*">
		<table class="graphMain">
			<tbody>
				<tr>
					<td width="5%"/>
					<td width="25%" class="graphMain value" align="center">
						<xsl:value-of select="cat_ru:PersonPost"/>
					</td>
					<td width="5%"/>
					<td width="25%" class="graphMain value"/>
					<td width="5%"/>
					<td width="30%" class="graphMain value" align="center">
						<xsl:value-of select="cat_ru:PersonSurname"/>
						<xsl:text> </xsl:text>
						<xsl:value-of select="cat_ru:PersonName"/>
						<xsl:text> </xsl:text>
						<xsl:value-of select="cat_ru:PersonMiddleName"/>
					</td>
					<td width="5%"/>
				</tr>
				<tr>
					<td/>
					<td class="graphLittle" align="center">(должность)</td>
					<td/>
					<td class="graphLittle" align="center">(подпись)</td>
					<td/>
					<td class="graphLittle" align="center">(Ф. И. О.)</td>
					<td/>
				</tr>
			</tbody>
		</table>
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
</xsl:stylesheet>
