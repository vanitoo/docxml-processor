<?xml version="1.0" encoding="utf-8" ?><xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" xmlns:rdd="urn:customs.ru:Information:ExchangeDocuments:ReqDataDecl:5.26.0" xmlns:xs="http://www.w3.org/2001/XMLSchema">
 <!-- Шаблон для типа ReqDataDeclType -->
<xsl:template match="rdd:ReqDataDecl">
		<html>
			<head>
				<style>
					body
					{background: #cccccc;
					font-family: Arial;}

					div.page
					{width: 190mm;
					margin: 10px auto;
					margin-top: 6pt;
					margin-bottom: 6pt;
					padding: 10mm 10mm 10mm 20mm;
					background: #ffffff;
					border: solid 1pt #000000;}

					.marg-top
					{margin-top:5mm;}

					table
					{width: 100%;
					border: 0;
					empty-cells: show;
					border-collapse: collapse;
					margin-top: 1px;}

					table.border tr td
					{border: 1px solid gray;}

					.graph
					{font-family: Arial;
					font-size: 10pt;}

					.value
					{border-bottom: solid 1px black;}

					div.title, tr.title td
					{font-weight:bold;}

					.bordered
					{border-collapse: collapse;}

					td.bordered
					{border: solid 1px windowtext;}

					td.graphMain
					{vertical-align:top;}

					td.value.graphMain
					{vertical-align:bottom;}

					p
					{text-indent: 20px; margin: 0;}

					.descr
					{font-size: 8pt;}
				</style>
			</head>
			<body>
				<div class="page">
					<xsl:if test="rdd:DocKind=1">
						<table class="w190">
							<tbody>
								<tr>
									<td align="center" class="graphMain">
										<font size="4">
											<b>ЗАПРОС ДОКУМЕНТОВ И (ИЛИ) СВЕДЕНИЙ</b><br/>
											<xsl:text> от </xsl:text>
											<xsl:apply-templates mode="russian_date" select="rdd:ResolDate"/>
										</font>
									</td>
								</tr>
							</tbody>
						</table>
						<br/>
						<table>
							<tbody>
								<tr valign="top" align="center">
									<td width="50%">
										<xsl:apply-templates select="rdd:OfficeName"/>
									</td>
									<td width="50%">
										<xsl:apply-templates select="rdd:DeclName"/>
									</td>
								</tr>
							</tbody>
						</table>
						<br/>
						<table>
							<tbody>
								<tr>
									<td style="border-bottom: 2px solid black;text-indent:20px;">
										<xsl:text>В соответствии с пунктом 4 статьи 325 Таможенного кодекса Евразийского экономического союза уведомляем, что в ходе проверки </xsl:text>
										<b>
											<xsl:text>декларации на товары № </xsl:text>
											<u>
												<xsl:apply-templates select="rdd:GTDID"/>
											</u>
										</b>
										<xsl:text> и документов и сведений, обнаружены следующие признаки, указывающие на то, что сведения о </xsl:text><xsl:apply-templates mode="DocSign" select="."/><xsl:text>, заявленных в таможенной декларации, должным образом не подтверждены либо могут являться недостоверными:</xsl:text>
										<br/>
										<u>
											<xsl:apply-templates select="rdd:Violations"/>
										</u>
									</td>
								</tr>
								<tr>
									<td style="text-indent:20px;">
										<xsl:text>В соответствии с пунктом 7 статьи 325 Таможенного кодекса Евразийского экономического союза Вам необходимо </xsl:text>
										<b>
											<xsl:text>в срок</xsl:text>
											<xsl:text> до </xsl:text>
											<!--xsl:apply-templates mode="time_words" select="rdd:DateLimit"/-->
											<xsl:apply-templates mode="date_words" select="rdd:DateLimit"/>
											<xsl:text> года</xsl:text>
										</b>
										<xsl:text> предоставить следующие документы и (или) сведения, либо объяснения причин, по которым такие документы и (или) сведения не могут быть представлены и (или) отсутствуют:</xsl:text>
									</td>
								</tr>
							</tbody>
						</table>
						<xsl:apply-templates mode="table" select="."/>
						<p>Запрошенные документы и (или) сведения должны быть представлены одним комплектом (одновременно).</p>
						<p>Одновременно с запрошенными таможенным органом документами и (или) сведениями могут быть представлены иные документы и (или) сведения в целях подтверждения достоверности и полноты сведений, заявленных в таможенной декларации, и (или) сведений, содержащихся в иных документах.</p>
						<br/>
						<p><xsl:apply-templates mode="signs" select="rdd:PreReleaseSign"/>В соответствии с пунктами 6,12 статьи 325 Таможенного кодекса Евразийского экономического союза информируем о возможности произвести выпуск товаров в соответствии со статьей 121 Таможенного кодекса Евразийского экономического союза (до завершения проверки таможенных, иных документов и (или) сведений).</p>
						<br/>
						<p><xsl:apply-templates mode="signs" select="rdd:GuaranteeSign"/>Для выпуска товаров Вам необходимо
							<b>
								<xsl:text> в срок</xsl:text>
								<xsl:text> до </xsl:text>
								<xsl:choose>
									<xsl:when  test="rdd:DateGuarantee">
										<!--xsl:apply-templates mode="time_words" select="rdd:DateLimit"/-->
										<xsl:apply-templates mode="date_words" select="rdd:DateGuarantee"/>
									</xsl:when>
									<xsl:otherwise>
										<u>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;</u>
									</xsl:otherwise>
								</xsl:choose>	
								<xsl:text> года </xsl:text>
							</b>
							предоставить обеспечение исполнения обязанности по уплате таможенных пошлин, налогов, специальных, антидемпинговых, компенсационных пошлин.
						</p>
						<br/>
						<p><xsl:apply-templates mode="signs" select="rdd:ReleaseSign"/>При выпуске товаров в соответствии со статьей 121 Таможенного кодекса Евразийского экономического союза документы и (или) сведения, запрошенные таможенным органом, могут быть представлены после выпуска товаров
							<b>
								<xsl:text> в срок</xsl:text>
								<xsl:text> до </xsl:text>
								<xsl:choose>
									<xsl:when  test="rdd:DateRelease">
										<!--xsl:apply-templates mode="time_words" select="rdd:DateLimit"/-->
										<xsl:apply-templates mode="date_words" select="rdd:DateRelease"/>
									</xsl:when>
									<xsl:otherwise>
										<u>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;</u>
									</xsl:otherwise>
								</xsl:choose>	
	
								<xsl:text> года </xsl:text>
							</b>
						</p>
						<br/>
						<br/>
						<div style="width:100%;text-align:right;">
							<xsl:apply-templates select="rdd:CustomsPerson/cat_ru:PersonName"/>
						</div>
						<!-- br/>
						<br/>
						<br/>
						<br/>
						<div style="border-top: 1px solid black; width:50mm;"/>
						<div style="width:100%;font-size:8pt;">
						* Указывается срок в соответствии с пунктом 7 статьи 325 ТК ЕАЭС:<br/>
						<p>1) не позднее, чем за 4 часа до истечения срока, указанного в пункте 3 статьи 119 ТК ЕАЭС, - если запрос документов и (или) сведений связан с проверкой сведений, содержащихся в таможенной декларации, и документах, представленных при подаче таможенной декларации;</p>
						<p>2) не позднее, чем за 1 рабочий день до истечения срока, установленного таможенным органом при продлении срока выпуска товаров в соответствии с пунктами 4-6 статьи 119 ТК ЕАЭС, - если запрос документв и (или) сведений связан с проверкой сведений, содержащихся в таможенной декларации, и документах, представленных в соответствии с пунктом 2 статьи 325 ТК ЕАЭС, и проверяемые сведения влияют на размер таможенных пошлин, налогов, специальных, антидемпинговых, компенсационных пошлин.</p>
						<br/>
						** Указывается срок выпуска товарова, установленный:<br/>
						<p>в пункте 3 статьи 119 ТК ЕАЭС, - если запрос документов и (или) сведений связан с проверкой сведений, содержащихся в таможенной декларации, и документах, представленных при подаче таможенной декларации;</p>
						<p>в пункте 6 статьи 119 ТК ЕАЭС, - если запрос документов и (или) сведений связан с проверкой сведений, содержащихся в таможенной декларации, и документах, представленнх в соответствии с пунктом 2 статьи 325 ТК ЕАЭС, и проверяемые сведения влияют на размер таможенных пошлин, налогов, специальных, антидемпинговых, компенсационных пошлин.</p>
						<br/>
						*** Указывается срок, не превышающий 60 календарных дней со дня регистрации таможенной декларации, за исключением случая, предусмотренного пунктом 2 статьи 314 ТК ЕАЭС.
						</div-->
					</xsl:if>
					<xsl:if test="rdd:DocKind=2">
						<table class="w190">
							<tbody>
								<tr>
									<td align="center" class="graphMain">
										<font size="4">
											<b>ЗАПРОС<br/>
											ДОПОЛНИТЕЛЬНЫХ ДОКУМЕНТОВ И (ИЛИ) СВЕДЕНИЙ<br/>
											В СООТВЕТСТВИИ С ПУНКТОМ 15 СТАТЬИ 325 ТК ЕАЭС</b><br/>
											<xsl:text> от </xsl:text>
											<xsl:apply-templates mode="russian_date" select="rdd:ResolDate"/>
										</font>
									</td>
								</tr>
							</tbody>
						</table>
						<br/>
						<table>
							<tbody>
								<tr valign="top" align="center">
									<td width="40%" style="border-bottom: 1px solid black;">
										<xsl:value-of select="rdd:OfficeName"/>
									</td>
									<td width="20%"/>
									<td width="40%" style="border-bottom: 1px solid black;">
										<xsl:value-of select="rdd:DeclName"/>
									</td>
								</tr>
								<tr align="center" valign="top">
									<td style="font-size: 8pt; font-style: italic;">(наименование таможенного органа)</td>
									<td></td>
									<td style="font-size: 8pt; font-style: italic;">(наименование декларанта или таможенного представителя)</td>
								</tr>
							</tbody>
						</table>
						<br/>
						<p style="border-bottom: 2px solid black; text-indent:20px;">
							Уведомляем, что представленные документы и (или) сведения в соответствии с пунктами 1 и 4 статьи 325 Таможенного кодекса ЕАЭС не устраняют основания для проведения проверки таможенных, иных документов и (или) сведений в отношении <xsl:apply-templates mode="DocSign1" select="."/>, заявленных в декларации на товары №
							<xsl:text> </xsl:text>
							<xsl:apply-templates select="rdd:GTDID"/>
							<xsl:text>, </xsl:text>
							по следующим основаниям:
							<br/>
							<u>
								<xsl:apply-templates select="rdd:Violations"/>
							</u>
						</p>
						<br/>
						<p style="text-indent: 20px;">
							Для целей установления достоверности и полноты проверяемых сведений, заявленных в таможенной декларации и (или) сведений, содержащихся в иных документах, в соответствии с пунктом 15 статьи 325 Таможенного кодекса ЕАЭС необходимо в срок до
							<xsl:text> </xsl:text>
							<xsl:apply-templates mode="date_words" select="rdd:DateRelease"/>
							<xsl:text> года </xsl:text>
							представить следующие документы и (или) сведения:
						</p>
						<xsl:apply-templates mode="table" select="."/>
						<br/>
						<br/>
						<table class="w190">
							<tbody>
								<tr align="center">
									<td style="border-bottom:1px solid black;">
										<xsl:apply-templates select="rdd:CustomsPerson/cat_ru:PersonName"/>
										<xsl:if test="rdd:CustomsPerson/cat_ru:LNP">
											<xsl:text>, ЛНП: </xsl:text>
											<xsl:apply-templates select="rdd:CustomsPerson/cat_ru:LNP"/>
											<xsl:if test="rdd:CustomsPerson/cat_ru:CustomsCode">
											<xsl:text> (код ТО: </xsl:text>
											<xsl:value-of select="rdd:CustomsPerson/cat_ru:CustomsCode"/>
											<xsl:text>)</xsl:text>
										</xsl:if>
										</xsl:if>
									</td>
								</tr>
								<tr align="center">
									<td style="font-size:8pt; font-style: italic;">(Ф.И.О. должностного лица уполномоченного таможенного органа, ЭЦП)</td>
								</tr>
							</tbody>
						</table>
					</xsl:if>
					<xsl:if test="rdd:DocKind=3">
						<table class="w190">
							<tbody>
								<tr>
									<td align="center" class="graphMain">
										<font size="4">
											<b>ЗАПРОС<br/>
											ДОКУМЕНТОВ И (ИЛИ) СВЕДЕНИЙ<br/>
											в соответствии с пунктом 3 Порядка</b><br/>
											<xsl:text> от </xsl:text>
											<xsl:apply-templates mode="russian_date" select="rdd:ResolDate"/>
										</font>
									</td>
								</tr>
							</tbody>
						</table>
						<br/>
						<table>
							<tbody>
								<tr valign="top" align="center">
									<td width="40%" style="border-bottom: 1px solid black;">
										<xsl:value-of select="rdd:OfficeName"/>
									</td>
									<td width="20%"/>
									<td width="40%" style="border-bottom: 1px solid black;">
										<xsl:value-of select="rdd:DeclName"/>
									</td>
								</tr>
								<tr align="center" valign="top">
									<td style="font-size: 8pt; font-style: italic;">(наименование таможенного органа)</td>
									<td></td>
									<td style="font-size: 8pt; font-style: italic;">(наименование декларанта или таможенного представителя)</td>
								</tr>
							</tbody>
						</table>
						<br/>
						<p style="text-indent:20px;">
							В соответствии с пунктом 3 Порядка<sup>1</sup> проведения проверки таможенных, иных документов и (или) сведений в отношении декларации на товары, поданной в отношении товаров, выпуск которых произведен в соответствии со статьей 120 ТК ЕАЭС, уведомляем, что в ходе проверки декларации на товары №
							<xsl:text> </xsl:text>
							<xsl:apply-templates select="rdd:GTDID"/>
							<xsl:text> </xsl:text>
							выявлена необходимость запроса документов, подтверждающих заявленные сведения о
							<xsl:text> </xsl:text>
							<xsl:apply-templates mode="DocSign" select="."/>
						</p>
						<br/>
						<p style="text-indent: 20px;">
							В соответствии с пунктом 5 Порядка Вам необходимо в срок до
							<xsl:text> </xsl:text>
							<xsl:apply-templates mode="date_words" select="rdd:DateLimit"/>
							<xsl:text> года </xsl:text>
							представить следующие документы и (или) сведения, либо объяснения причин, по которым такие документы и (или) сведения не могу быть представлены и (или) отсутствуют:
						</p>
						<br/>
						<xsl:apply-templates mode="tableOrder130" select="."/>
						<br/>
						<p style="text-indent: 20px;">
							Запрошенные документы и (или) сведения должны быть представлены одним комплектом (одновременно).
						</p>
						<br/>
						<br/>
						<table class="w190">
							<tbody>
								<tr align="center">
									<td style="border-bottom:1px solid black;">
										<xsl:apply-templates select="rdd:CustomsPerson/cat_ru:PersonName"/>
										<xsl:if test="rdd:CustomsPerson/cat_ru:LNP">
											<xsl:text>, ЛНП: </xsl:text>
											<xsl:apply-templates select="rdd:CustomsPerson/cat_ru:LNP"/>
											<xsl:if test="rdd:CustomsPerson/cat_ru:CustomsCode">
											<xsl:text> (код ТО: </xsl:text>
											<xsl:value-of select="rdd:CustomsPerson/cat_ru:CustomsCode"/>
											<xsl:text>)</xsl:text>
										</xsl:if>
										</xsl:if>
									</td>
								</tr>
								<tr align="center">
									<td style="font-size:8pt; font-style: italic;">(Ф.И.О. уполномоченного должностного лица таможенного органа, ЭЦП)</td>
								</tr>
							</tbody>
						</table>
						<br/>
						<br/>
						<div style="inline-block; width: 50mm;" class="value"/>
						<div class="descr"><sup>1</sup> Порядок проведения проверки таможенных, иных документов и (или) сведений в отношении декларации на товары, поданной в отношении товаров, выпуск которых произведен в соответствии со статьей 120 Таможенного кодекса Евразийского экономического союза, документов, подтверждающих сведения, заявленные в такой декларации, и сведений, заявленных в указанной декларации на товары и (или) содержащихся в представленных таможенным органам документах, утвержденный решением Коллегии Евразийской экономической комиссии от 19 ноября 2024 г. № 130 (далее - Порядок).</div>
					</xsl:if>
					<xsl:if test="rdd:DocKind=4">
						<table class="w190">
							<tbody>
								<tr>
									<td align="center" class="graphMain">
										<font size="4">
											<b>ЗАПРОС<br/>
											ДОКУМЕНТОВ И (ИЛИ) СВЕДЕНИЙ<br/>
											в соответствии с пунктами 3 и 9 Порядка</b><br/>
											<xsl:text> от </xsl:text>
											<xsl:apply-templates mode="russian_date" select="rdd:ResolDate"/>
										</font>
									</td>
								</tr>
							</tbody>
						</table>
						<br/>
						<table>
							<tbody>
								<tr valign="top" align="center">
									<td width="40%" style="border-bottom: 1px solid black;">
										<xsl:value-of select="rdd:OfficeName"/>
									</td>
									<td width="20%"/>
									<td width="40%" style="border-bottom: 1px solid black;">
										<xsl:value-of select="rdd:DeclName"/>
									</td>
								</tr>
								<tr align="center" valign="top">
									<td style="font-size: 8pt; font-style: italic;">(наименование таможенного органа)</td>
									<td></td>
									<td style="font-size: 8pt; font-style: italic;">(наименование декларанта или таможенного представителя)</td>
								</tr>
							</tbody>
						</table>
						<br/>
						<p style="text-indent:20px;">
							В соответствии с пунктами 3 и 9 Порядка<sup>1</sup> уведомляем, что в ходе проверки декларации на товары №
							<xsl:text> </xsl:text>
							<xsl:apply-templates select="rdd:GTDID"/>
							<xsl:text> </xsl:text>
							и документов и (или) сведений, обнаружены следующие признаки, указывающие на то, что сведения о 
							<xsl:text> </xsl:text>
							<xsl:apply-templates mode="DocSign" select="."/>
							<xsl:text>, </xsl:text>
							заявленные в таможенной декларации должным образом не подтверждены либо могут являться недостоверными:
							<br/>
							<u>
								<xsl:apply-templates select="rdd:Violations"/>
							</u>
						</p>
						<br/>
						<p style="text-indent: 20px;">
							В соответствии с пунктом 11 Порядка Вам необходимо в срок до
							<xsl:text> </xsl:text>
							<xsl:apply-templates mode="date_words" select="rdd:DateLimit"/>
							<xsl:text> года </xsl:text>
							представить следующие документы и (или) сведения, либо объяснения причин, по которым такие документы и (или) сведения не могу быть представлены и (или) отсутствуют:
						</p>
						<br/>
						<xsl:apply-templates mode="tableOrder130" select="."/>
						<br/>
						<p style="text-indent: 20px;">
							Запрошенные документы и (или) сведения должны быть представлены одним комплектом (одновременно).
						</p>
						<p style="text-indent: 20px;">
							Одновременно с запрошенными таможенным органом документами и (или) сведениями могут быть представлены иные докумены и (или) сведения в целях подтверждения достоверности и полноты сведений, заявленных в таможенной декларации, и (или) сведения, содержащихся в иных документах.
						</p>
						<br/>
						<br/>
						<table class="w190">
							<tbody>
								<tr align="center">
									<td style="border-bottom:1px solid black;">
										<xsl:apply-templates select="rdd:CustomsPerson/cat_ru:PersonName"/>
										<xsl:if test="rdd:CustomsPerson/cat_ru:LNP">
											<xsl:text>, ЛНП: </xsl:text>
											<xsl:apply-templates select="rdd:CustomsPerson/cat_ru:LNP"/>
											<xsl:if test="rdd:CustomsPerson/cat_ru:CustomsCode">
											<xsl:text> (код ТО: </xsl:text>
											<xsl:value-of select="rdd:CustomsPerson/cat_ru:CustomsCode"/>
											<xsl:text>)</xsl:text>
										</xsl:if>
										</xsl:if>
									</td>
								</tr>
								<tr align="center">
									<td style="font-size:8pt; font-style: italic;">(Ф.И.О. уполномоченного должностного лица таможенного органа, ЭЦП)</td>
								</tr>
							</tbody>
						</table>
						<br/>
						<br/>
						<div style="inline-block; width: 50mm;" class="value"/>
						<div class="descr"><sup>1</sup> Порядок проведения проверки таможенных, иных документов и (или) сведений в отношении декларации на товары, поданной в отношении товаров, выпуск которых произведен в соответствии со статьей 120 Таможенного кодекса Евразийского экономического союза, документов, подтверждающих сведения, заявленные в такой декларации, и сведений, заявленных в указанной декларации на товары и (или) содержащихся в представленных таможенным органам документах, утвержденный решением Коллегии Евразийской экономической комиссии от 19 ноября 2024 г. № 130 (далее - Порядок).</div>
					</xsl:if>
					<xsl:if test="rdd:DocKind=5">
						<table class="w190">
							<tbody>
								<tr>
									<td align="center" class="graphMain">
										<font size="4">
											<b>ЗАПРОС<br/>
											ДОКУМЕНТОВ И (ИЛИ) СВЕДЕНИЙ<br/>
											в соответствии с пунктом 9 Порядка</b><br/>
											<xsl:text> от </xsl:text>
											<xsl:apply-templates mode="russian_date" select="rdd:ResolDate"/>
										</font>
									</td>
								</tr>
							</tbody>
						</table>
						<br/>
						<table>
							<tbody>
								<tr valign="top" align="center">
									<td width="40%" style="border-bottom: 1px solid black;">
										<xsl:value-of select="rdd:OfficeName"/>
									</td>
									<td width="20%"/>
									<td width="40%" style="border-bottom: 1px solid black;">
										<xsl:value-of select="rdd:DeclName"/>
									</td>
								</tr>
								<tr align="center" valign="top">
									<td style="font-size: 8pt; font-style: italic;">(наименование таможенного органа)</td>
									<td></td>
									<td style="font-size: 8pt; font-style: italic;">(наименование декларанта или таможенного представителя)</td>
								</tr>
							</tbody>
						</table>
						<br/>
						<p style="text-indent:20px;">
							В соответствии с пунктом 9 Порядка<sup>1</sup> уведомляем, что в ходе проверки декларации на товары №
							<xsl:text> </xsl:text>
							<xsl:apply-templates select="rdd:GTDID"/>
							<xsl:text> </xsl:text>
							и документов и (или) сведений, обнаружены следующие признаки, указывающие на то, что сведения о 
							<xsl:text> </xsl:text>
							<xsl:apply-templates mode="DocSign" select="."/>
							<xsl:text>, </xsl:text>
							заявленные в таможенной декларации должным образом не подтверждены либо могут являться недостоверными:
							<br/>
							<u>
								<xsl:apply-templates select="rdd:Violations"/>
							</u>
						</p>
						<br/>
						<p style="text-indent: 20px;">
							В соответствии с пунктом 11 Порядка Вам необходимо в срок до
							<xsl:text> </xsl:text>
							<xsl:apply-templates mode="date_words" select="rdd:DateLimit"/>
							<xsl:text> года </xsl:text>
							представить следующие документы и (или) сведения, либо объяснения причин, по которым такие документы и (или) сведения не могу быть представлены и (или) отсутствуют:
						</p>
						<br/>
						<xsl:apply-templates mode="tableOrder130" select="."/>
						<br/>
						<p style="text-indent: 20px;">
							Запрошенные документы и (или) сведения должны быть представлены одним комплектом (одновременно).
						</p>
						<p style="text-indent: 20px;">
							Одновременно с запрошенными таможенным органом документами и (или) сведениями могут быть представлены иные докумены и (или) сведения в целях подтверждения достоверности и полноты сведений, заявленных в таможенной декларации, и (или) сведения, содержащихся в иных документах.
						</p>
						<br/>
						<br/>
						<table class="w190">
							<tbody>
								<tr align="center">
									<td style="border-bottom:1px solid black;">
										<xsl:apply-templates select="rdd:CustomsPerson/cat_ru:PersonName"/>
										<xsl:if test="rdd:CustomsPerson/cat_ru:LNP">
											<xsl:text>, ЛНП: </xsl:text>
											<xsl:apply-templates select="rdd:CustomsPerson/cat_ru:LNP"/>
											<xsl:if test="rdd:CustomsPerson/cat_ru:CustomsCode">
											<xsl:text> (код ТО: </xsl:text>
											<xsl:value-of select="rdd:CustomsPerson/cat_ru:CustomsCode"/>
											<xsl:text>)</xsl:text>
										</xsl:if>
										</xsl:if>
									</td>
								</tr>
								<tr align="center">
									<td style="font-size:8pt; font-style: italic;">(Ф.И.О. уполномоченного должностного лица таможенного органа, ЭЦП)</td>
								</tr>
							</tbody>
						</table>
						<br/>
						<br/>
						<div style="inline-block; width: 50mm;" class="value"/>
						<div class="descr"><sup>1</sup> Порядок проведения проверки таможенных, иных документов и (или) сведений в отношении декларации на товары, поданной в отношении товаров, выпуск которых произведен в соответствии со статьей 120 Таможенного кодекса Евразийского экономического союза, документов, подтверждающих сведения, заявленные в такой декларации, и сведений, заявленных в указанной декларации на товары и (или) содержащихся в представленных таможенным органам документах, утвержденный решением Коллегии Евразийской экономической комиссии от 19 ноября 2024 г. № 130 (далее - Порядок).</div>
					</xsl:if>
					<xsl:if test="rdd:DocKind=6">
						<table class="w190">
							<tbody>
								<tr>
									<td align="center" class="graphMain">
										<font size="4">
											<b>ЗАПРОС<br/>
											ДОКУМЕНТОВ И (ИЛИ) СВЕДЕНИЙ<br/>
											в соответствии с пунктом 12 Порядка</b><br/>
											<xsl:text> от </xsl:text>
											<xsl:apply-templates mode="russian_date" select="rdd:ResolDate"/>
										</font>
									</td>
								</tr>
							</tbody>
						</table>
						<br/>
						<table>
							<tbody>
								<tr valign="top" align="center">
									<td width="40%" style="border-bottom: 1px solid black;">
										<xsl:value-of select="rdd:OfficeName"/>
									</td>
									<td width="20%"/>
									<td width="40%" style="border-bottom: 1px solid black;">
										<xsl:value-of select="rdd:DeclName"/>
									</td>
								</tr>
								<tr align="center" valign="top">
									<td style="font-size: 8pt; font-style: italic;">(наименование таможенного органа)</td>
									<td></td>
									<td style="font-size: 8pt; font-style: italic;">(наименование декларанта или таможенного представителя)</td>
								</tr>
							</tbody>
						</table>
						<br/>
						<br/>
						<p style="text-indent: 20px;">
							Для целей установления достоверности и полноты проверяемых сведений, заявленных в декларации на товары, и (или) сведений, содержащихся в иных документах, в соответствии с пунктом 12 Порядка<sup>1</sup> Вам необходимо в срок до
							<xsl:text> </xsl:text>
							<xsl:apply-templates mode="date_words" select="rdd:DateLimit"/>
							<xsl:text> года </xsl:text>
							представить следующие дополнительные документы и (или) сведения:
						</p>
						<br/>
						<xsl:apply-templates mode="tableOrder130" select="."/>
						<br/>
						<p style="text-indent: 20px;">
							Запрошенные документы и (или) сведения должны быть представлены одним комплектом (одновременно).
						</p>
						<p style="text-indent: 20px;">
							Одновременно с запрошенными таможенным органом документами и (или) сведениями могут быть представлены иные докумены и (или) сведения в целях подтверждения достоверности и полноты сведений, заявленных в таможенной декларации, и (или) сведения, содержащихся в иных документах.
						</p>
						<br/>
						<br/>
						<table class="w190">
							<tbody>
								<tr align="center">
									<td style="border-bottom:1px solid black;">
										<xsl:apply-templates select="rdd:CustomsPerson/cat_ru:PersonName"/>
										<xsl:if test="rdd:CustomsPerson/cat_ru:LNP">
											<xsl:text>, ЛНП: </xsl:text>
											<xsl:apply-templates select="rdd:CustomsPerson/cat_ru:LNP"/>
											<xsl:if test="rdd:CustomsPerson/cat_ru:CustomsCode">
											<xsl:text> (код ТО: </xsl:text>
											<xsl:value-of select="rdd:CustomsPerson/cat_ru:CustomsCode"/>
											<xsl:text>)</xsl:text>
										</xsl:if>
										</xsl:if>
									</td>
								</tr>
								<tr align="center">
									<td style="font-size:8pt; font-style: italic;">(Ф.И.О. уполномоченного должностного лица таможенного органа, ЭЦП)</td>
								</tr>
							</tbody>
						</table>
						<br/>
						<br/>
						<div style="inline-block; width: 50mm;" class="value"/>
						<div class="descr"><sup>1</sup> Порядок проведения проверки таможенных, иных документов и (или) сведений в отношении декларации на товары, поданной в отношении товаров, выпуск которых произведен в соответствии со статьей 120 Таможенного кодекса Евразийского экономического союза, документов, подтверждающих сведения, заявленные в такой декларации, и сведений, заявленных в указанной декларации на товары и (или) содержащихся в представленных таможенным органам документах, утвержденный решением Коллегии Евразийской экономической комиссии от 19 ноября 2024 г. № 130 (далее - Порядок).</div>
					</xsl:if>
				</div>
			</body>
		</html>
	</xsl:template>
	
	<xsl:template mode="signs" match="*">
		<xsl:variable name="color">
			<xsl:choose>
				<xsl:when test=". = 'true' or . = 1"/>
				<xsl:otherwise>color: white;</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<div style="display: inline-block; border: 1px solid black; width:5mm; height:5 mm;text-align:center;{$color}">
			V
		</div>
	</xsl:template>
	
	<xsl:template mode="tableOrder130" match="*">
		<table width="100%">
			<tbody>
				<tr valign="top" align="center">
					<td class="bordered" width="5%">№ п/п</td>
					<td class="bordered">Перечень заявленных сведений, требующих подтверждения/уточнения</td>
					<td class="bordered">Перечень запрашиваемых документов и (или) сведений</td>
					<td class="bordered">Номера товаров, к которым запрашиваются документы</td>
					<td class="bordered">Примечание</td>
				</tr>
				<tr align="center">
					<td class="bordered">1</td>
					<td class="bordered">2</td>
					<td class="bordered">3</td>
					<td class="bordered">4</td>
					<td class="bordered">5</td>
				</tr>
				<xsl:for-each select="rdd:CustomsCostInf">
					<tr valign="top">
						<td class="bordered">
							<xsl:apply-templates select="rdd:Position"/>
						</td>
						<td class="bordered">
							<xsl:apply-templates select="rdd:CustCostInf"/>
						</td>
						<td class="bordered">
							<xsl:for-each select="rdd:ReqDocuments">
								<xsl:apply-templates select="rdd:PrDocumentName"/>
								<xsl:text> </xsl:text>
								<xsl:apply-templates select="rdd:PrDocumentNumber"/>
								<xsl:text> </xsl:text>
								<xsl:apply-templates mode="russian_date" select="rdd:PrDocumentDate"/>
								<!--xsl:text> </xsl:text>
								<xsl:apply-templates select="rdd:RequestPositionID"/-->
								<xsl:text> </xsl:text>
								<xsl:apply-templates select="rdd:DocCode"/>
								<xsl:if test="rdd:CommKind">
									<xsl:choose>
										<xsl:when test="rdd:CommKind=0"> документ из архива декларанта </xsl:when>
										<xsl:otherwise> Способ представления документа: <xsl:value-of select="rdd:CommKind"/></xsl:otherwise>
									</xsl:choose>
								</xsl:if>
								<xsl:if test="rdd:Comment">
									<xsl:text> </xsl:text>
									<xsl:apply-templates select="rdd:Comment"/>
								</xsl:if>
								<xsl:if test="position()!=last()"><br/></xsl:if>
							</xsl:for-each>
						</td>
						<td class="bordered">
							<xsl:for-each select="rdd:GoodNum">
								<xsl:value-of select="."/>
								<xsl:if test="position()!=last()">, </xsl:if>
							</xsl:for-each>
						</td>
						<td class="bordered">
							<xsl:apply-templates select="rdd:Comment"/>
						</td>
					</tr>
				</xsl:for-each>
			</tbody>
		</table>
	</xsl:template>
	
	
	<xsl:template mode="table" match="*">
		<table width="100%">
			<tbody>
				<tr valign="top" align="center">
					<td class="bordered" width="5%">№ п/п</td>
					<td class="bordered">Направление таможенного контроля</td>
					<td class="bordered">Перечень заявленных сведений, требующих подтверждения/уточнения</td>
					<td class="bordered">Перечень запрашиваемых документов и (или) сведений</td>
					<td class="bordered">Номера товаров, к которым запрашиваются документы</td>
					<td class="bordered">Примечание</td>
				</tr>
				<tr align="center">
					<td class="bordered">1</td>
					<td class="bordered">2</td>
					<td class="bordered">3</td>
					<td class="bordered">4</td>
					<td class="bordered">5</td>
					<td class="bordered">6</td>
				</tr>
				<xsl:for-each select="rdd:CustomsCostInf">
					<tr valign="top">
						<td class="bordered">
							<xsl:apply-templates select="rdd:Position"/>
						</td>
						<td class="bordered">
							<xsl:for-each select="rdd:DocSign">
								<xsl:if test="position()!=1"><br/></xsl:if>
								<xsl:apply-templates select="."/>
								<br/>
							</xsl:for-each>
						</td>
						<td class="bordered">
							<xsl:apply-templates select="rdd:CustCostInf"/>
						</td>
						<td class="bordered">
							<xsl:for-each select="rdd:ReqDocuments">
								<xsl:apply-templates select="rdd:PrDocumentName"/>
								<xsl:text> </xsl:text>
								<xsl:apply-templates select="rdd:PrDocumentNumber"/>
								<xsl:text> </xsl:text>
								<xsl:apply-templates mode="russian_date" select="rdd:PrDocumentDate"/>
								<!--xsl:text> </xsl:text>
								<xsl:apply-templates select="rdd:RequestPositionID"/-->
								<xsl:text> </xsl:text>
								<xsl:apply-templates select="rdd:DocCode"/>
								<xsl:if test="rdd:CommKind">
									<xsl:choose>
										<xsl:when test="rdd:CommKind=0"> документ из архива декларанта </xsl:when>
										<xsl:otherwise> Способ представления документа: <xsl:value-of select="rdd:CommKind"/></xsl:otherwise>
									</xsl:choose>
								</xsl:if>
								<xsl:if test="rdd:Comment">
									<xsl:text> </xsl:text>
									<xsl:apply-templates select="rdd:Comment"/>
								</xsl:if>
								<xsl:if test="position()!=last()"><br/></xsl:if>
							</xsl:for-each>
						</td>
						<td class="bordered">
							<xsl:for-each select="rdd:GoodNum">
								<xsl:value-of select="."/>
								<xsl:if test="position()!=last()">, </xsl:if>
							</xsl:for-each>
						</td>
						<td class="bordered">
							<xsl:apply-templates select="rdd:Comment"/>
						</td>
					</tr>
				</xsl:for-each>
			</tbody>
		</table>
	</xsl:template>
	
	<xsl:template match="rdd:DocSign">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:choose>
				<xsl:when test=". = 1">таможенная стоимость товаров</xsl:when>
				<xsl:when test=". = 2">классификация товара в соответствии с ТН ВЭД ЕАЭС</xsl:when>
				<xsl:when test=". = 3">происхождение товаров и (или) тарифные преференции</xsl:when>
				<xsl:when test=". = 4">соблюдение мер технического регулирования</xsl:when>
				<xsl:when test=". = 5">соблюдение санитарных мер</xsl:when>
				<xsl:when test=". = 6">соблюдение ветеринарно-санитарных мер</xsl:when>
				<xsl:when test=". = 7">соблюдение карантинных фитосанитарных мер</xsl:when>
				<xsl:when test=". = 8">соблюдение мер нетарифного регулирования</xsl:when>
				<xsl:when test=". = 9">соблюдение специальных экономических мер</xsl:when>
				<xsl:when test=". = 10">соблюдение мер экспортного контроля, в том числе мер в отношении продукции военного назначения</xsl:when>
				<xsl:when test=". = 11">соблюдение прав на объекты интеллектуальной собственности</xsl:when>
				<xsl:when test=". = 12">применение льгот по уплате таможенных платежей</xsl:when>
				<xsl:when test=". = 13">применение ставки НДС в размере 10%</xsl:when>
				<xsl:when test=". = 14">контроль правильности исчисления таможенных пошлин, специальных, антидемпинговых, компенсационных пошлин, таможенных сборов за таможенные операции</xsl:when>
				<xsl:when test=". = 15">контроль правильности исчисления акциза</xsl:when>
				<xsl:when test=". = 16">проверка количественных (весовых) характеристик товара, а также признаков, указывающих на недостоверность или неполноту заявленных в ДТ сведений</xsl:when>
				<xsl:otherwise><xsl:value-of select="."/></xsl:otherwise>		
			</xsl:choose>
		</element>
	</xsl:template>
	
	<xsl:template mode="DocSign" match="*">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:if test="rdd:CustomsCostInf/rdd:DocSign = 1">
				таможенной стоимости товаров
				<xsl:if test="rdd:CustomsCostInf/rdd:DocSign != 1">, </xsl:if>
			</xsl:if>
			<xsl:if test="rdd:CustomsCostInf/rdd:DocSign = 2">
				классификации товара в соответствии с ТН ВЭД ЕАЭС
			</xsl:if>
			<xsl:if test="rdd:CustomsCostInf/rdd:DocSign = 3">
				<xsl:if test="rdd:CustomsCostInf/rdd:DocSign = 2">, </xsl:if>происхождении товаров и (или) тарифных преференциях
			</xsl:if>
			<xsl:if test="rdd:CustomsCostInf/rdd:DocSign = 4">
				<xsl:if test="rdd:CustomsCostInf/rdd:DocSign = 2 or rdd:CustomsCostInf/rdd:DocSign = 3">, </xsl:if>соблюдении мер технического регулирования
			</xsl:if>
			<xsl:if test="rdd:CustomsCostInf/rdd:DocSign = 5">
				<xsl:if test="rdd:CustomsCostInf/rdd:DocSign = 2 or rdd:CustomsCostInf/rdd:DocSign = 3 or rdd:CustomsCostInf/rdd:DocSign = 4">, </xsl:if>соблюдении санитарных мер
			</xsl:if>
			<xsl:if test="rdd:CustomsCostInf/rdd:DocSign = 6">
				<xsl:if test="rdd:CustomsCostInf/rdd:DocSign = 2 or rdd:CustomsCostInf/rdd:DocSign = 3 or rdd:CustomsCostInf/rdd:DocSign = 4 or rdd:CustomsCostInf/rdd:DocSign = 5">, </xsl:if>соблюдении ветеринарно-санитарных мер
			</xsl:if>
			<xsl:if test="rdd:CustomsCostInf/rdd:DocSign = 7">
				<xsl:if test="rdd:CustomsCostInf/rdd:DocSign = 2 or rdd:CustomsCostInf/rdd:DocSign = 3 or rdd:CustomsCostInf/rdd:DocSign = 4 or rdd:CustomsCostInf/rdd:DocSign = 5 or rdd:CustomsCostInf/rdd:DocSign = 6">, </xsl:if>соблюдении карантинных фитосанитарных мер
			</xsl:if>
			<xsl:if test="rdd:CustomsCostInf/rdd:DocSign = 8">
				<xsl:if test="rdd:CustomsCostInf/rdd:DocSign = 2 or rdd:CustomsCostInf/rdd:DocSign = 3 or rdd:CustomsCostInf/rdd:DocSign = 4 or rdd:CustomsCostInf/rdd:DocSign = 5 or rdd:CustomsCostInf/rdd:DocSign = 6 or rdd:CustomsCostInf/rdd:DocSign = 7">, </xsl:if>соблюдении мер нетарифного регулирования
			</xsl:if>
			<xsl:if test="rdd:CustomsCostInf/rdd:DocSign = 9">
				<xsl:if test="rdd:CustomsCostInf/rdd:DocSign = 2 or rdd:CustomsCostInf/rdd:DocSign = 3 or rdd:CustomsCostInf/rdd:DocSign = 4 or rdd:CustomsCostInf/rdd:DocSign = 5 or rdd:CustomsCostInf/rdd:DocSign = 6 or rdd:CustomsCostInf/rdd:DocSign = 7 or rdd:CustomsCostInf/rdd:DocSign = 8">, </xsl:if>соблюдении специальных экономических мер
			</xsl:if>
			<xsl:if test="rdd:CustomsCostInf/rdd:DocSign = 10">
				<xsl:if test="rdd:CustomsCostInf/rdd:DocSign = 2 or rdd:CustomsCostInf/rdd:DocSign = 3 or rdd:CustomsCostInf/rdd:DocSign = 4 or rdd:CustomsCostInf/rdd:DocSign = 5 or rdd:CustomsCostInf/rdd:DocSign = 6 or rdd:CustomsCostInf/rdd:DocSign = 7 or rdd:CustomsCostInf/rdd:DocSign = 8 or rdd:CustomsCostInf/rdd:DocSign = 9">, </xsl:if>соблюдении мер экспортного контроля, в том числе мер в отношении продукции военного назначения
			</xsl:if>
			<xsl:if test="rdd:CustomsCostInf/rdd:DocSign = 11">
				<xsl:if test="rdd:CustomsCostInf/rdd:DocSign = 2 or rdd:CustomsCostInf/rdd:DocSign = 3 or rdd:CustomsCostInf/rdd:DocSign = 4 or rdd:CustomsCostInf/rdd:DocSign = 5 or rdd:CustomsCostInf/rdd:DocSign = 6 or rdd:CustomsCostInf/rdd:DocSign = 7 or rdd:CustomsCostInf/rdd:DocSign = 8 or rdd:CustomsCostInf/rdd:DocSign = 9 or rdd:CustomsCostInf/rdd:DocSign = 10">, </xsl:if>соблюдении прав на объекты интеллектуальной собственности
			</xsl:if>
			<xsl:if test="rdd:CustomsCostInf/rdd:DocSign = 12">
				<xsl:if test="rdd:CustomsCostInf/rdd:DocSign = 2 or rdd:CustomsCostInf/rdd:DocSign = 3 or rdd:CustomsCostInf/rdd:DocSign = 4 or rdd:CustomsCostInf/rdd:DocSign = 5 or rdd:CustomsCostInf/rdd:DocSign = 6 or rdd:CustomsCostInf/rdd:DocSign = 7 or rdd:CustomsCostInf/rdd:DocSign = 8 or rdd:CustomsCostInf/rdd:DocSign = 9 or rdd:CustomsCostInf/rdd:DocSign = 10 or rdd:CustomsCostInf/rdd:DocSign = 11">, </xsl:if>применении льгот по уплате таможенных платежей
			</xsl:if>
			<xsl:if test="rdd:CustomsCostInf/rdd:DocSign = 13">
				<xsl:if test="rdd:CustomsCostInf/rdd:DocSign = 2 or rdd:CustomsCostInf/rdd:DocSign = 3 or rdd:CustomsCostInf/rdd:DocSign = 4 or rdd:CustomsCostInf/rdd:DocSign = 5 or rdd:CustomsCostInf/rdd:DocSign = 6 or rdd:CustomsCostInf/rdd:DocSign = 7 or rdd:CustomsCostInf/rdd:DocSign = 8 or rdd:CustomsCostInf/rdd:DocSign = 9 or rdd:CustomsCostInf/rdd:DocSign = 10 or rdd:CustomsCostInf/rdd:DocSign = 11 or rdd:CustomsCostInf/rdd:DocSign = 12">, </xsl:if>применении ставки НДС в размере 10%
			</xsl:if>
			<xsl:if test="rdd:CustomsCostInf/rdd:DocSign = 14">
				<xsl:if test="rdd:CustomsCostInf/rdd:DocSign = 2 or rdd:CustomsCostInf/rdd:DocSign = 3 or rdd:CustomsCostInf/rdd:DocSign = 4 or rdd:CustomsCostInf/rdd:DocSign = 5 or rdd:CustomsCostInf/rdd:DocSign = 6 or rdd:CustomsCostInf/rdd:DocSign = 7 or rdd:CustomsCostInf/rdd:DocSign = 8 or rdd:CustomsCostInf/rdd:DocSign = 9 or rdd:CustomsCostInf/rdd:DocSign = 10 or rdd:CustomsCostInf/rdd:DocSign = 11 or rdd:CustomsCostInf/rdd:DocSign = 12 or rdd:CustomsCostInf/rdd:DocSign = 13">, </xsl:if>контроле правильности исчисления таможенных пошлин, специальных, антидемпинговых, компенсационных пошлин, таможенных сборов за таможенные операции
			</xsl:if>
			<xsl:if test="rdd:CustomsCostInf/rdd:DocSign = 15">
				<xsl:if test="rdd:CustomsCostInf/rdd:DocSign = 2 or rdd:CustomsCostInf/rdd:DocSign = 3 or rdd:CustomsCostInf/rdd:DocSign = 4 or rdd:CustomsCostInf/rdd:DocSign = 5 or rdd:CustomsCostInf/rdd:DocSign = 6 or rdd:CustomsCostInf/rdd:DocSign = 7 or rdd:CustomsCostInf/rdd:DocSign = 8 or rdd:CustomsCostInf/rdd:DocSign = 9 or rdd:CustomsCostInf/rdd:DocSign = 10 or rdd:CustomsCostInf/rdd:DocSign = 11 or rdd:CustomsCostInf/rdd:DocSign = 12 or rdd:CustomsCostInf/rdd:DocSign = 13 or rdd:CustomsCostInf/rdd:DocSign = 14">, </xsl:if>контроле правильности исчисления акциза
			</xsl:if>
			<xsl:if test="rdd:CustomsCostInf/rdd:DocSign = 16">
				<xsl:if test="rdd:CustomsCostInf/rdd:DocSign = 2 or rdd:CustomsCostInf/rdd:DocSign = 3 or rdd:CustomsCostInf/rdd:DocSign = 4 or rdd:CustomsCostInf/rdd:DocSign = 5 or rdd:CustomsCostInf/rdd:DocSign = 6 or rdd:CustomsCostInf/rdd:DocSign = 7 or rdd:CustomsCostInf/rdd:DocSign = 8 or rdd:CustomsCostInf/rdd:DocSign = 9 or rdd:CustomsCostInf/rdd:DocSign = 10 or rdd:CustomsCostInf/rdd:DocSign = 11 or rdd:CustomsCostInf/rdd:DocSign = 12 or rdd:CustomsCostInf/rdd:DocSign = 13 or rdd:CustomsCostInf/rdd:DocSign = 14 or rdd:CustomsCostInf/rdd:DocSign = 15">, </xsl:if>проверке количественных (весовых) характеристик товара, а также признаков, указывающих на недостоверность или неполноту заявленных в ДТ сведений
			</xsl:if>
		</element>
	</xsl:template>

	<xsl:template mode="DocSign1" match="*">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:if test="rdd:CustomsCostInf/rdd:DocSign = 1">
				таможенной стоимости товаров
				<xsl:if test="rdd:CustomsCostInf/rdd:DocSign != 1">, </xsl:if>
			</xsl:if>
			<xsl:if test="rdd:CustomsCostInf/rdd:DocSign = 2">
				классификации товара в соответствии с ТН ВЭД ЕАЭС
			</xsl:if>
			<xsl:if test="rdd:CustomsCostInf/rdd:DocSign = 3">
				<xsl:if test="rdd:CustomsCostInf/rdd:DocSign = 2">, </xsl:if>происхождения товаров и (или) тарифных преференций
			</xsl:if>
			<xsl:if test="rdd:CustomsCostInf/rdd:DocSign = 4">
				<xsl:if test="rdd:CustomsCostInf/rdd:DocSign = 2 or rdd:CustomsCostInf/rdd:DocSign = 3">, </xsl:if>соблюдения мер технического регулирования
			</xsl:if>
			<xsl:if test="rdd:CustomsCostInf/rdd:DocSign = 5">
				<xsl:if test="rdd:CustomsCostInf/rdd:DocSign = 2 or rdd:CustomsCostInf/rdd:DocSign = 3 or rdd:CustomsCostInf/rdd:DocSign = 4">, </xsl:if>соблюдения санитарных мер
			</xsl:if>
			<xsl:if test="rdd:CustomsCostInf/rdd:DocSign = 6">
				<xsl:if test="rdd:CustomsCostInf/rdd:DocSign = 2 or rdd:CustomsCostInf/rdd:DocSign = 3 or rdd:CustomsCostInf/rdd:DocSign = 4 or rdd:CustomsCostInf/rdd:DocSign = 5">, </xsl:if>соблюдения ветеринарно-санитарных мер
			</xsl:if>
			<xsl:if test="rdd:CustomsCostInf/rdd:DocSign = 7">
				<xsl:if test="rdd:CustomsCostInf/rdd:DocSign = 2 or rdd:CustomsCostInf/rdd:DocSign = 3 or rdd:CustomsCostInf/rdd:DocSign = 4 or rdd:CustomsCostInf/rdd:DocSign = 5 or rdd:CustomsCostInf/rdd:DocSign = 6">, </xsl:if>соблюдения карантинных фитосанитарных мер
			</xsl:if>
			<xsl:if test="rdd:CustomsCostInf/rdd:DocSign = 8">
				<xsl:if test="rdd:CustomsCostInf/rdd:DocSign = 2 or rdd:CustomsCostInf/rdd:DocSign = 3 or rdd:CustomsCostInf/rdd:DocSign = 4 or rdd:CustomsCostInf/rdd:DocSign = 5 or rdd:CustomsCostInf/rdd:DocSign = 6 or rdd:CustomsCostInf/rdd:DocSign = 7">, </xsl:if>соблюдения мер нетарифного регулирования
			</xsl:if>
			<xsl:if test="rdd:CustomsCostInf/rdd:DocSign = 9">
				<xsl:if test="rdd:CustomsCostInf/rdd:DocSign = 2 or rdd:CustomsCostInf/rdd:DocSign = 3 or rdd:CustomsCostInf/rdd:DocSign = 4 or rdd:CustomsCostInf/rdd:DocSign = 5 or rdd:CustomsCostInf/rdd:DocSign = 6 or rdd:CustomsCostInf/rdd:DocSign = 7 or rdd:CustomsCostInf/rdd:DocSign = 8">, </xsl:if>соблюдения специальных экономических мер
			</xsl:if>
			<xsl:if test="rdd:CustomsCostInf/rdd:DocSign = 10">
				<xsl:if test="rdd:CustomsCostInf/rdd:DocSign = 2 or rdd:CustomsCostInf/rdd:DocSign = 3 or rdd:CustomsCostInf/rdd:DocSign = 4 or rdd:CustomsCostInf/rdd:DocSign = 5 or rdd:CustomsCostInf/rdd:DocSign = 6 or rdd:CustomsCostInf/rdd:DocSign = 7 or rdd:CustomsCostInf/rdd:DocSign = 8 or rdd:CustomsCostInf/rdd:DocSign = 9">, </xsl:if>соблюдения мер экспортного контроля, в том числе мер в отношении продукции военного назначения
			</xsl:if>
			<xsl:if test="rdd:CustomsCostInf/rdd:DocSign = 11">
				<xsl:if test="rdd:CustomsCostInf/rdd:DocSign = 2 or rdd:CustomsCostInf/rdd:DocSign = 3 or rdd:CustomsCostInf/rdd:DocSign = 4 or rdd:CustomsCostInf/rdd:DocSign = 5 or rdd:CustomsCostInf/rdd:DocSign = 6 or rdd:CustomsCostInf/rdd:DocSign = 7 or rdd:CustomsCostInf/rdd:DocSign = 8 or rdd:CustomsCostInf/rdd:DocSign = 9 or rdd:CustomsCostInf/rdd:DocSign = 10">, </xsl:if>соблюдения прав на объекты интеллектуальной собственности
			</xsl:if>
			<xsl:if test="rdd:CustomsCostInf/rdd:DocSign = 12">
				<xsl:if test="rdd:CustomsCostInf/rdd:DocSign = 2 or rdd:CustomsCostInf/rdd:DocSign = 3 or rdd:CustomsCostInf/rdd:DocSign = 4 or rdd:CustomsCostInf/rdd:DocSign = 5 or rdd:CustomsCostInf/rdd:DocSign = 6 or rdd:CustomsCostInf/rdd:DocSign = 7 or rdd:CustomsCostInf/rdd:DocSign = 8 or rdd:CustomsCostInf/rdd:DocSign = 9 or rdd:CustomsCostInf/rdd:DocSign = 10 or rdd:CustomsCostInf/rdd:DocSign = 11">, </xsl:if>применения льгот по уплате таможенных платежей
			</xsl:if>
			<xsl:if test="rdd:CustomsCostInf/rdd:DocSign = 13">
				<xsl:if test="rdd:CustomsCostInf/rdd:DocSign = 2 or rdd:CustomsCostInf/rdd:DocSign = 3 or rdd:CustomsCostInf/rdd:DocSign = 4 or rdd:CustomsCostInf/rdd:DocSign = 5 or rdd:CustomsCostInf/rdd:DocSign = 6 or rdd:CustomsCostInf/rdd:DocSign = 7 or rdd:CustomsCostInf/rdd:DocSign = 8 or rdd:CustomsCostInf/rdd:DocSign = 9 or rdd:CustomsCostInf/rdd:DocSign = 10 or rdd:CustomsCostInf/rdd:DocSign = 11 or rdd:CustomsCostInf/rdd:DocSign = 12">, </xsl:if>применения ставки НДС в размере 10%
			</xsl:if>
			<xsl:if test="rdd:CustomsCostInf/rdd:DocSign = 14">
				<xsl:if test="rdd:CustomsCostInf/rdd:DocSign = 2 or rdd:CustomsCostInf/rdd:DocSign = 3 or rdd:CustomsCostInf/rdd:DocSign = 4 or rdd:CustomsCostInf/rdd:DocSign = 5 or rdd:CustomsCostInf/rdd:DocSign = 6 or rdd:CustomsCostInf/rdd:DocSign = 7 or rdd:CustomsCostInf/rdd:DocSign = 8 or rdd:CustomsCostInf/rdd:DocSign = 9 or rdd:CustomsCostInf/rdd:DocSign = 10 or rdd:CustomsCostInf/rdd:DocSign = 11 or rdd:CustomsCostInf/rdd:DocSign = 12 or rdd:CustomsCostInf/rdd:DocSign = 13">, </xsl:if>контроля правильности исчисления таможенных пошлин, специальных, антидемпинговых, компенсационных пошлин, таможенных сборов за таможенные операции
			</xsl:if>
			<xsl:if test="rdd:CustomsCostInf/rdd:DocSign = 15">
				<xsl:if test="rdd:CustomsCostInf/rdd:DocSign = 2 or rdd:CustomsCostInf/rdd:DocSign = 3 or rdd:CustomsCostInf/rdd:DocSign = 4 or rdd:CustomsCostInf/rdd:DocSign = 5 or rdd:CustomsCostInf/rdd:DocSign = 6 or rdd:CustomsCostInf/rdd:DocSign = 7 or rdd:CustomsCostInf/rdd:DocSign = 8 or rdd:CustomsCostInf/rdd:DocSign = 9 or rdd:CustomsCostInf/rdd:DocSign = 10 or rdd:CustomsCostInf/rdd:DocSign = 11 or rdd:CustomsCostInf/rdd:DocSign = 12 or rdd:CustomsCostInf/rdd:DocSign = 13 or rdd:CustomsCostInf/rdd:DocSign = 14">, </xsl:if>контроля правильности исчисления акциза
			</xsl:if>
			<xsl:if test="rdd:CustomsCostInf/rdd:DocSign = 16">
				<xsl:if test="rdd:CustomsCostInf/rdd:DocSign = 2 or rdd:CustomsCostInf/rdd:DocSign = 3 or rdd:CustomsCostInf/rdd:DocSign = 4 or rdd:CustomsCostInf/rdd:DocSign = 5 or rdd:CustomsCostInf/rdd:DocSign = 6 or rdd:CustomsCostInf/rdd:DocSign = 7 or rdd:CustomsCostInf/rdd:DocSign = 8 or rdd:CustomsCostInf/rdd:DocSign = 9 or rdd:CustomsCostInf/rdd:DocSign = 10 or rdd:CustomsCostInf/rdd:DocSign = 11 or rdd:CustomsCostInf/rdd:DocSign = 12 or rdd:CustomsCostInf/rdd:DocSign = 13 or rdd:CustomsCostInf/rdd:DocSign = 14 or rdd:CustomsCostInf/rdd:DocSign = 15">, </xsl:if>проверки количественных (весовых) характеристик товара, а также признаков, указывающих на недостоверность или неполноту заявленных в ДТ сведений
			</xsl:if>
		</element>
	</xsl:template>
	
	<xsl:template match="rdd:GTDID">
		<xsl:apply-templates select="cat_ru:CustomsCode"/>
		<xsl:text>/</xsl:text>
		<xsl:apply-templates mode="russian_date_gtd" select="cat_ru:RegistrationDate"/>
		<xsl:text>/</xsl:text>
		<xsl:apply-templates select="cat_ru:GTDNumber"/>
	</xsl:template>

	<xsl:template mode="time_words" match="*">
		<xsl:choose>
			<xsl:when test="substring(.,5,1)='-' and substring(.,8,1)='-'">
				<xsl:value-of select="substring(.,12,2)"/>
				<xsl:text> часов </xsl:text>
				<xsl:value-of select="substring(.,14,2)"/>
				<xsl:text> минут </xsl:text>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="."/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template name="date_words">
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<xsl:text> "</xsl:text>
				<xsl:value-of select="substring($dateIn,9,2)"/>
				<xsl:text>" </xsl:text>
				<xsl:if test="substring($dateIn,6,2)='01'">января</xsl:if>
				<xsl:if test="substring($dateIn,6,2)='02'">февраля</xsl:if>
				<xsl:if test="substring($dateIn,6,2)='03'">марта</xsl:if>
				<xsl:if test="substring($dateIn,6,2)='04'">апреля</xsl:if>
				<xsl:if test="substring($dateIn,6,2)='05'">мая</xsl:if>
				<xsl:if test="substring($dateIn,6,2)='06'">июня</xsl:if>
				<xsl:if test="substring($dateIn,6,2)='07'">июля</xsl:if>
				<xsl:if test="substring($dateIn,6,2)='08'">августа</xsl:if>
				<xsl:if test="substring($dateIn,6,2)='09'">сентября</xsl:if>
				<xsl:if test="substring($dateIn,6,2)='10'">октября</xsl:if>
				<xsl:if test="substring($dateIn,6,2)='11'">ноября</xsl:if>
				<xsl:if test="substring($dateIn,6,2)='12'">декабря</xsl:if>
				<xsl:text> </xsl:text>
				<xsl:value-of select="substring($dateIn,1,4)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="."/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
	<!--xsl:template match="rdd:DocSign">
		<xsl:if test="position()!=1">, </xsl:if>
		<xsl:variable name="proiskhozhdenie">
			<xsl:choose>
				<xsl:when test="./../rdd:DocKind =  1">происхождении </xsl:when>
				<xsl:otherwise>происхождения</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="preferentsii">
			<xsl:choose>
				<xsl:when test="./../rdd:DocKind =  1">преференциях</xsl:when>
				<xsl:otherwise>преференций </xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:choose>
				<xsl:when test=". = 1">таможенной стоимости товаров</xsl:when>
				<xsl:when test=". = 2">классификации товара в соответствии с ТН ВЭД ЕАЭС</xsl:when>
				<xsl:when test=". = 3"><xsl:value-of select="$proiskhozhdenie"/> товаров и (или) тарифных <xsl:value-of select="$preferentsii"/></xsl:when>
			</xsl:choose>
		</element>
		<xsl:if test=". = 9">
			<xsl:apply-templates select="../rdd:OtherReason"/>
		</xsl:if>
	</xsl:template-->
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
	<xsl:template match="//*[local-name()='ReqDataDecl']//*" priority="-1">
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
	<xsl:template match="*" mode="date_words">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:call-template name="date_words">
				<xsl:with-param name="dateIn" select="."/>
			</xsl:call-template>
		</element>
	</xsl:template>
</xsl:stylesheet>