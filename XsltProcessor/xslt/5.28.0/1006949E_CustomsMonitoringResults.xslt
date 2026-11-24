<?xml version="1.0" encoding="utf-8" ?>
<!-- Проект приказа ФТС России "О технологии проведения таможенного мониторинга" -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" xmlns:cmr="urn:customs.ru:Information:CustomsAuditDocuments:CustomsMonitoringResults:5.25.0">
<!-- Шаблон для типа CustomsMonitoringResultsType -->
	<xsl:template match="cmr:CustomsMonitoringResults">
		<html>
			<head>
				<style>
					body {
					background: #cccccc;
					}
		
					div
					{
					white-space: nowrap;
					}
		
					div.page {
					width: 180mm;
					margin: 10px auto;
					margin-top: 6pt;
					margin-bottom: 6pt;
					padding: 10mm;
					padding-left: 20mm;
					background: #ffffff;
					border: solid 1pt #000000;
					page-break-after: always;
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

					.bordered
					{ border-collapse: collapse; }

					td.bordered
					{border: solid 1px windowtext;
					font-family: Arial;}
		
					.inlinetable
					{border: 0;
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
					text-align: center;}
		
					.descr{
					font-size: 8pt;
					text-align: center;
					}
		
					table.border tr td
					{
					border: 1px solid windowtext;
					}
		
					.graph {
					font-family: Arial;
					font-size: 10pt;
					}
		
					.value
					{
					border-bottom: solid 1px black;
					font-style: italic;
					}
		
					div.title, tr.title td { font-weight:bold;  }
					.bordered { border-collapse: collapse; }
					td.bordered
					{
					border: solid 1px windowtext;
					}
		
					.border_bottom
					{
					border-bottom: 1px solid black;
					}
		
					.graphMain
					{
					font-family: Arial;
					font-size: 11pt;
					}
		
					.graphLittle 
					{
					font-family: Arial;
					font-size: 7pt;
					}
			
					.graphDelim 
					{
					font-family: Arial;
					font-size: 4pt;
					}
		
					td.graphMain
					{
					vertical-align:top;
					}
					td.value.graphMain
					{
					vertical-align:top;
					}
		
					.graphHeader
					{
					font-family: Arial;
					font-size: 11pt;
					font-weight:bold;
					}
		
					td.graphHeader
					{
					vertical-align:top;
					}
					td.value.graphHeader
					{
					vertical-align:bottom;
					}
		
					.normal
					{
					font-size: 11pt;
					font-family:Arial;
					}			
		
					.bold
					{
					font-weight: bold;
					font-family:Arial;
					font-size: 9pt;
					}			
		
					.italic
					{
					font-style: italic;
					font-family:Arial;
					font-size: 11pt;
					}		
					
					.delim {
						height: 7pt;
					}
		
					.delim_3 {
						height: 3pt;
					}
		
				</style>
			</head>
			<body>
				<div class="page">
					<table>
						<tbody align="left" class="graphMain">
							<tr>
								<td width="50%"></td>
								<td width="15%" align="right">Начальнику&#160;</td>
								<td width="35%" class="value">
									<xsl:if test="cmr:Customs/cat_ru:OfficeName"><xsl:apply-templates select="cmr:Customs/cat_ru:OfficeName"/> (</xsl:if>
									<xsl:apply-templates select="cmr:Customs/cat_ru:Code"/>
									<xsl:if test="cmr:Customs/cat_ru:OfficeName">)</xsl:if>
								</td>
							</tr>
							<tr class="graphLittle" align="center">
								<td> </td>
								<td colspan="2">(наименование таможенного органа, которым проведен таможенный мониторинг)</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<table>
						<tbody align="left" class="graphMain">
							<tr align="center" class="graphHeader">
								<td class="graphMain">РЕЗУЛЬТАТЫ</td>
							</tr>
							<tr class="delim"><td> </td></tr>
							<tr align="center">
								<td>рассмотрения подконтрольным лицом заключения по результатам<br/>таможенного мониторинга</td>
							</tr>
							<tr class="delim_3"><td> </td></tr>
						</tbody>
					</table>
					<br/>
					<table>
						<tbody align="center" class="graphMain">
							<tr>
								<td width="30%" class="value">
									<xsl:call-template name="russian_date">
										<xsl:with-param name="dateIn" select="cmr:DocDate"/>
									</xsl:call-template>
								</td>
								<td width="30%"> </td>
								<td width="40%" class="value">
									<xsl:value-of select="cmr:DocNumber/cmr:CustomsCode"/>/<xsl:value-of select="cmr:DocNumber/cmr:Part_2"/>/<xsl:call-template name="gtd_date"><xsl:with-param name="dateIn" select="cmr:DocNumber/cmr:RegistrationDate"/></xsl:call-template>/<xsl:value-of select="cmr:DocNumber/cmr:GTDNumber"/>/<xsl:value-of select="cmr:DocNumber/cmr:Part_5"/>
								</td>
							</tr>
							<tr class="graphLittle">
								<td width="30%">(дата, ДД.ММ.ГГГГ)</td>
								<td width="30%"> </td>
								<td width="40%">(номер)</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<table>
						<tbody align="left" class="graphMain">
							<tr class="delim"><td> </td></tr>
							<tr style="text-align:justify">
								<td>
									<xsl:text>Рассмотрев заключение по результатам таможенного мониторинга </xsl:text>
									<xsl:call-template name="inlinetable">
										<xsl:with-param name="data">
											&#160;&#160;<xsl:value-of select="cmr:ConclusionsNumber/cmr:CustomsCode"/>/<xsl:value-of select="cmr:ConclusionsNumber/cmr:Part_2"/>/<xsl:call-template name="gtd_date"><xsl:with-param name="dateIn" select="cmr:ConclusionsNumber/cmr:RegistrationDate"/></xsl:call-template>/<xsl:value-of select="cmr:ConclusionsNumber/cmr:GTDNumber"/>/<xsl:value-of select="cmr:ConclusionsNumber/cmr:Part_5"/>&#160;&#160;
										</xsl:with-param>
										<xsl:with-param name="data_align" select="'center'"/>
										<xsl:with-param name="width" select="'60mm'"/>
										<xsl:with-param name="comma" select="0"/>
										<xsl:with-param name="description" select="'(номер заявления)'"/>
									</xsl:call-template>
									<xsl:text>&#160;составленное </xsl:text>
									<xsl:call-template name="inlinetable">
										<xsl:with-param name="data">
											&#160;&#160;<xsl:if test="cmr:Customs/cat_ru:OfficeName"><xsl:apply-templates select="cmr:Customs/cat_ru:OfficeName"/> (</xsl:if>
											<xsl:apply-templates select="cmr:Customs/cat_ru:Code"/>
											<xsl:if test="cmr:Customs/cat_ru:OfficeName">)</xsl:if>&#160;&#160;
										</xsl:with-param>
										<xsl:with-param name="data_align" select="'center'"/>
										<xsl:with-param name="width" select="'80mm'"/>
										<xsl:with-param name="description" select="'(наименование таможенного органа, которым проведен таможенный мониторинг)'"/>
									</xsl:call-template>
									<xsl:text>&#160;в отношении: </xsl:text>
									<xsl:call-template name="inlinetable">
										<xsl:with-param name="data">
											&#160;&#160;<xsl:apply-templates select="cmr:FEAPerson/cmr:OrganizationName"/>, ОГРН - <xsl:apply-templates select="cmr:FEAPerson/cmr:OGRN"/>, ИНН - <xsl:apply-templates select="cmr:FEAPerson/cmr:INN"/>, КПП - <xsl:apply-templates select="cmr:FEAPerson/cmr:KPP"/>, место государственной регистрации: <xsl:apply-templates select="cmr:FEAPerson/cmr:Address"/>&#160;&#160;
										</xsl:with-param>
										<xsl:with-param name="data_align" select="'center'"/>
										<xsl:with-param name="width" select="'100%'"/>
										<xsl:with-param name="description" select="'(сведения о лице, в отношении которого проведен таможенный мониторинг: краткое наименование организации, ИНН, КПП, ОГРН)'"/>
									</xsl:call-template>
									<xsl:text>&#160;сообщаем, что риски нарушений международных договоров и актов, составляющих право Евразийского экономического союза, регулирующих таможенные правоотношения, и (или) законодательства Российской Федерации о таможенном регулировании (далее – таможенное законодательство):</xsl:text>
								</td>
							</tr>
							<tr class="delim"><td> </td></tr>
							<tr>
								<td>
									<table>
										<tbody>
											<tr>
												<td width="90%">не подтвердились</td>
												<td width="10%" class="bordered">
													<xsl:choose>
														<xsl:when test="cmr:Results/cmr:Code='0'">Х</xsl:when>
														<xsl:otherwise> </xsl:otherwise>
													</xsl:choose>
												</td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
							<tr class="delim"><td> </td></tr>
							<tr>
								<td>
									<table>
										<tbody>
											<tr>
												<td width="90%">подтвердились частично</td>
												<td width="10%" class="bordered">
													<xsl:choose>
														<xsl:when test="cmr:Results/cmr:Code='2'">Х</xsl:when>
														<xsl:otherwise> </xsl:otherwise>
													</xsl:choose>
												</td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
							<tr class="delim"><td> </td></tr>
							<tr>
								<td>
									<table>
										<tbody>
											<tr>
												<td width="90%">подтвердились</td>
												<td width="10%" class="bordered">
													<xsl:choose>
														<xsl:when test="cmr:Results/cmr:Code='1'">Х</xsl:when>
														<xsl:otherwise> </xsl:otherwise>
													</xsl:choose>
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
						<tbody align="left" class="graphMain">
							<tr style="text-align:justify">
								<td>
									<b><xsl:text>РАЗДЕЛ I.</xsl:text></b>
									<xsl:text> Сведения о товарах, по которым не подтвердились риски нарушения таможенного законодательства:</xsl:text></td>
							</tr>
							<tr class="delim"><td> </td></tr>
							<xsl:if test="cmr:NoRiskGoods">
								<tr style="text-align:justify; text-indent: 5%">
									<td>
										<xsl:text>Перечень товаров, по которым не подтвердилось наличие рисков нарушения таможенного законодательства, приведен в приложении № 1.</xsl:text>
									</td>
								</tr>
								<tr style="text-indent: 5%">
									<td>
										<xsl:text>Изменение показателей внешнеэкономических показателей по данным товарам связано</xsl:text>
										<br/>
										<xsl:call-template name="inlinetable">
											<xsl:with-param name="data">
												<xsl:apply-templates select="cmr:NoRiskGoods/cmr:Reasons"/>
											</xsl:with-param>
											<xsl:with-param name="data_align" select="'center'"/>
											<xsl:with-param name="width" select="'100%'"/>
											<xsl:with-param name="description" select="'(пояснения, указание законов и иных нормативных правовых актов, которым, по мнению организации, не соответствуют выводы, изложенные в заключении)'"/>
										</xsl:call-template>
									</td>
								</tr>
								<tr style="text-align:justify; text-indent: 5%">
									<td>
										<xsl:text>В качестве подтверждения отсутствия рисков нарушения таможенного законодательства прилагаем следующие документы:</xsl:text>
										<br/>
										<xsl:call-template name="inlinetable">
											<xsl:with-param name="data">
												<xsl:for-each select="cmr:NoRiskGoods/cmr:Document">
													<xsl:sort data-type="number" order="ascending" select="cmr:DocNumber"/>
													<xsl:if test="position()!=1">; </xsl:if>
													<xsl:apply-templates select="cmr:DocKind"/>
													<xsl:text>№ </xsl:text>
													<xsl:apply-templates select="cat_ru:PrDocumentNumber"/>
													<xsl:if test="cat_ru:PrDocumentDate">
														<xsl:text> от </xsl:text>
														<xsl:call-template name="russian_date">
															<xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
														</xsl:call-template>
													</xsl:if>
												</xsl:for-each>
											</xsl:with-param>
											<xsl:with-param name="data_align" select="'center'"/>
											<xsl:with-param name="width" select="'100%'"/>
											<xsl:with-param name="description" select="'(сведения о документах: вид, номер, дата)'"/>
										</xsl:call-template>
									</td>
								</tr>
							</xsl:if>
						</tbody>
					</table>
					<br/>
					<table>
						<tbody align="left" class="graphMain">
							<tr style="text-align:justify">
								<td>
									<b><xsl:text>РАЗДЕЛ II.</xsl:text></b>
									<xsl:text> Сведения о товарах, по которым подтвердились риски нарушения таможенного законодательства:</xsl:text></td>
							</tr>
							<tr class="delim"><td> </td></tr>
							<xsl:if test="cmr:RiskGoods">
								<tr style="text-indent: 5%">
									<td>
										<xsl:text>Перечень товаров, по которым подтверждаем наличие рисков нарушения таможенного законодательства, приведен в приложении № 2.</xsl:text>
									</td>
								</tr>
								<tr style="text-align:justify; text-indent: 5%">
									<td>
										<xsl:text>В целях устранения рисков нарушения таможенного законодательства организацией приняты следующие меры</xsl:text>
										<br/>
										<xsl:call-template name="inlinetable">
											<xsl:with-param name="data">
												<xsl:apply-templates select="cmr:RiskGoods/cmr:Event"/>
											</xsl:with-param>
											<xsl:with-param name="data_align" select="'center'"/>
											<xsl:with-param name="width" select="'100%'"/>
											<xsl:with-param name="description" select="'(описание мер, принятых для устранения негативных последствий)'"/>
										</xsl:call-template>
									</td>
								</tr>
								<tr style="text-align:justify; text-indent: 5%">
									<td>
										<xsl:text>В качестве подтверждения прилагаем следующие документы:</xsl:text>
										<br/>
										<xsl:call-template name="inlinetable">
											<xsl:with-param name="data">
												<xsl:for-each select="cmr:RiskGoods/cmr:Document">
													<xsl:sort data-type="number" order="ascending" select="cmr:DocNumber"/>
													<xsl:if test="position()!=1">; </xsl:if>
													<xsl:apply-templates select="cmr:DocKind"/>
													<xsl:text>№ </xsl:text>
													<xsl:apply-templates select="cat_ru:PrDocumentNumber"/>
													<xsl:if test="cat_ru:PrDocumentDate">
														<xsl:text> от </xsl:text>
														<xsl:call-template name="russian_date">
															<xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
														</xsl:call-template>
													</xsl:if>
												</xsl:for-each>
											</xsl:with-param>
											<xsl:with-param name="data_align" select="'center'"/>
											<xsl:with-param name="width" select="'100%'"/>
											<xsl:with-param name="description" select="'(сведения о документах: вид, номер, дата)'"/>
										</xsl:call-template>
									</td>
								</tr>
							</xsl:if>
						</tbody>
					</table>
					<br/>
					<table>
						<tbody align="left" class="graphMain">
							<tr>
								<td>
									<xsl:text>Просим учесть данную информацию и прилагаемые документы при рассмотрении вопроса о назначении таможенной проверки.</xsl:text>
									<br/>
									<xsl:call-template name="inlinetable">
										<xsl:with-param name="data">
											<xsl:apply-templates select="cmr:AdditionalInformation"/>
										</xsl:with-param>
										<xsl:with-param name="data_align" select="'center'"/>
										<xsl:with-param name="width" select="'100%'"/>
										<xsl:with-param name="description" select="'(иные предложения, пояснения лица)'"/>
									</xsl:call-template>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<table>
						<tbody align="left" class="graphMain">
							<tr>
								<td>
									<xsl:text>Приложение: </xsl:text>
									<xsl:if test="not(cmr:Application1) and not(cmr:Application2)">
										<xsl:text>_____</xsl:text>
									</xsl:if>
									<xsl:if test="cmr:Application1 and not(cmr:Application2)">
										<u>&#160;&#160;<xsl:text>1</xsl:text>&#160;&#160;</u>
									</xsl:if>
									<xsl:if test="not(cmr:Application1) and cmr:Application2">
										<u>&#160;&#160;<xsl:text>1</xsl:text>&#160;&#160;</u>
									</xsl:if>
									<xsl:if test="cmr:Application1 and cmr:Application2">
										<u>&#160;&#160;<xsl:text>2</xsl:text>&#160;&#160;</u>
									</xsl:if>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<table>
						<tbody class="graphMain">
							<tr align="center">
								<td width="30%" class="value">
									<xsl:apply-templates select="cmr:SignedPerson/cat_ru:PersonPost"/>
								</td>
								<td width="15%"> </td>
								<td width="55%" class="value">
									<xsl:apply-templates select="cmr:SignedPerson" mode="signature"/>
								</td>
							</tr>
							<tr class="graphLittle" align="center">
								<td width="55%">(должность)</td>
								<td width="15%"> </td>
								<td width="30%">(инициалы, фамилия)</td>
							</tr>
						</tbody>
					</table>
				</div>
				<xsl:if test="cmr:Application1">
					<div class="page">
						<table>
							<tbody align="left" class="graphMain">
								<tr>
									<td width="45%"></td>
									<td width="55%" align="left">Приложение № 1 к РЕЗУЛЬТАТАМ<br/>рассмотрения подконтрольным лицом<br/>заключения по результатам<br/>таможенного мониторинга</td>
								</tr>
								<tr class="graphMain" align="center">
									<td></td>
									<td class="value">
										<xsl:text>от </xsl:text>
										<xsl:call-template name="russian_date">
											<xsl:with-param name="dateIn" select="cmr:DocDate"/>
										</xsl:call-template>
										<xsl:text> № </xsl:text>
										<xsl:value-of select="cmr:DocNumber/cmr:CustomsCode"/>/<xsl:value-of select="cmr:DocNumber/cmr:Part_2"/>/<xsl:call-template name="gtd_date"><xsl:with-param name="dateIn" select="cmr:DocNumber/cmr:RegistrationDate"/></xsl:call-template>/<xsl:value-of select="cmr:DocNumber/cmr:GTDNumber"/>/<xsl:value-of select="cmr:DocNumber/cmr:Part_5"/>
									</td>
								</tr>
								<tr class="graphLittle" align="center">
									<td> </td>
									<td>(дата и номер)</td>
								</tr>
							</tbody>
						</table>
						<br/>
						<table>
							<tbody align="left" class="graphMain">
								<tr align="center">
									<td>Перечень товаров, по которым не подтвердилось наличие рисков нарушения таможенного законодательства</td>
								</tr>
							</tbody>
						</table>
						<table class="bordered">
							<tbody>
								<tr class="title" align="center">
									<td class="graphMain bordered">№ п/п</td>
									<td class="graphMain bordered">Номер ДТ</td>
									<td class="graphMain bordered">Номер товара в ДТ</td>
									<td class="graphMain bordered">Пояснения</td>
									<xsl:if test="cmr:Application1/cmr:AppendixIndicator">
										<td class="graphMain bordered">Наличие приложений</td>
									</xsl:if>
								</tr>
								<xsl:for-each select="cmr:Application1">
									<xsl:sort data-type="number" order="ascending" select="cmr:Number"/>
									<xsl:apply-templates mode="good" select="."/>
								</xsl:for-each>
							</tbody>
						</table>
					</div>
				</xsl:if>
				<xsl:if test="cmr:Application2">
					<div class="page">
						<table>
							<tbody align="left" class="graphMain">
								<tr>
									<td width="45%"></td>
									<td width="55%" align="left">Приложение № 2 к РЕЗУЛЬТАТАМ<br/>рассмотрения подконтрольным лицом<br/>заключения по результатам<br/>таможенного мониторинга</td>
								</tr>
								<tr class="graphMain" align="center">
									<td></td>
									<td class="value">
										<xsl:text>от </xsl:text>
										<xsl:call-template name="russian_date">
											<xsl:with-param name="dateIn" select="cmr:DocDate"/>
										</xsl:call-template>
										<xsl:text> № </xsl:text>
										<xsl:value-of select="cmr:DocNumber/cmr:CustomsCode"/>/<xsl:value-of select="cmr:DocNumber/cmr:Part_2"/>/<xsl:call-template name="gtd_date"><xsl:with-param name="dateIn" select="cmr:DocNumber/cmr:RegistrationDate"/></xsl:call-template>/<xsl:value-of select="cmr:DocNumber/cmr:GTDNumber"/>/<xsl:value-of select="cmr:DocNumber/cmr:Part_5"/>
									</td>
								</tr>
								<tr class="graphLittle" align="center">
									<td> </td>
									<td>(дата и номер)</td>
								</tr>
							</tbody>
						</table>
						<br/>
						<table>
							<tbody align="left" class="graphMain">
								<tr align="center">
									<td>Перечень товаров, по которым подтвердилось наличие рисков нарушения таможенного законодательства</td>
								</tr>
							</tbody>
						</table>
						<table class="bordered">
							<tbody>
								<tr class="title" align="center">
									<td class="graphMain bordered">№ п/п</td>
									<td class="graphMain bordered">Номер ДТ</td>
									<td class="graphMain bordered">Номер товара в ДТ</td>
									<td class="graphMain bordered">Пояснения</td>
									<xsl:if test="cmr:Application2/cmr:AppendixIndicator">
										<td class="graphMain bordered">Наличие приложений</td>
									</xsl:if>
								</tr>
								<xsl:for-each select="cmr:Application2">
									<xsl:sort data-type="number" order="ascending" select="cmr:Number"/>
									<xsl:apply-templates mode="good" select="."/>
								</xsl:for-each>
							</tbody>
						</table>
					</div>
				</xsl:if>
			</body>
		</html>
	</xsl:template>

	<!-- Шаблон для типа cmr:GoodsType -->
	<xsl:template mode="good" match="*">
		<xsl:param name="wdth" select="0" />
		<xsl:variable name="w" select="$wdth - 5" />
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<tr>
				<td class="graphMain bordered" align="center">
					<xsl:apply-templates select="cmr:Number"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="cmr:DTNumber"/>
				</td>
				<td class="graphMain bordered">
					<xsl:for-each select="cmr:GoodsDT">
						<xsl:if test="position()!=1">, </xsl:if>
						<xsl:apply-templates select="cmr:GoodsNumber"/>
					</xsl:for-each>
				</td>
				<td class="graphMain bordered">
					<xsl:for-each select="cmr:GoodsDT">
						<xsl:if test="position()!=1">; </xsl:if>
						<xsl:apply-templates select="cmr:Notes"/>
					</xsl:for-each>
				</td>
				<xsl:if test="cmr:AppendixIndicator">
					<td class="graphMain bordered">
						<xsl:choose>
							<xsl:when test="cmr:AppendixIndicator='0'">
								<xsl:text>Приложений нет</xsl:text>
							</xsl:when>
							<xsl:when test="cmr:AppendixIndicator='1'">
								<xsl:text>Приложения есть</xsl:text>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="cmr:AppendixIndicator"/>
							</xsl:otherwise>
						</xsl:choose>
					</td>
				</xsl:if>
			</tr>
		</div>
	</xsl:template>

	<!-- Шаблон для типа cat_ru:GTDIDType -->
	<xsl:template match="cmr:DTNumber">
		<xsl:value-of select="cat_ru:CustomsCode"/>
		<xsl:text>/</xsl:text>
		<xsl:call-template name="gtd_date">
			<xsl:with-param name="dateIn" select="cat_ru:RegistrationDate"/>
		</xsl:call-template>
		<xsl:text>/</xsl:text>
		<xsl:value-of select="cat_ru:GTDNumber"/>
	</xsl:template>

	<!-- Шаблон для типа cat_ru:AddressType -->
	<xsl:template match="cmr:FEAPerson/cmr:Address">
		<xsl:for-each select="*">
			<xsl:if test="local-name()='PostalCode'">Почтовый индекс: </xsl:if>
			<xsl:if test="local-name()='TerritoryCode'">Код административно - территориальной единицы: </xsl:if>
			<xsl:choose>
				<xsl:when test="local-name()='CountryCode'">
					<xsl:if test="not(../cat_ru:CounryName)">
						<xsl:value-of select="."/>
					</xsl:if>	
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="."/>
					<xsl:if test="local-name()='CounryName'">
						<xsl:if test="../cat_ru:CountryCode"> (<xsl:value-of select="../cat_ru:CountryCode"/>)</xsl:if>
					</xsl:if>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:if test="position()!=last() and ((local-name()!='CountryCode') or (local-name()='CountryCode' and not(../cat_ru:CounryName)))">, </xsl:if>
		</xsl:for-each>
	</xsl:template>

	<xsl:template mode="signature" match="*">
		<xsl:value-of select="substring(cat_ru:PersonName,1,1)"/>
		<xsl:if test="cat_ru:PersonName">.</xsl:if>
		<xsl:value-of select="substring(cat_ru:PersonMiddleName,1,1)"/>
		<xsl:if test="cat_ru:PersonMiddleName">.</xsl:if>&#160;
		<xsl:value-of select="cat_ru:PersonSurname"/>
	</xsl:template>

	<xsl:template name="inlinetable">
		<xsl:param name="data"/>
		<xsl:param name="description"/>
		<xsl:param name="width"/>
		<xsl:param name="data_align"/>
		<xsl:param name="list" select="0"/>
		<xsl:param name="comma" select="0"/>
		<xsl:param name="dot" select="0"/>
		<xsl:variable name="width_td1">
			<xsl:choose>
				<xsl:when test="$comma=0 and $list=0 and $dot=0">
					<xsl:value-of select="'100%'"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="'99%'"/>
				</xsl:otherwise>
			</xsl:choose>.
		</xsl:variable>
		<table class="inlinetable" style="width: {$width};">
			<tbody>
				<tr align="{$data_align}">
					<td class="value" width="{$width_td1}">
						<xsl:value-of select="$data"/>
						<br/>
					</td>
					<xsl:if test="$comma != 0">
						<td width="1%" valign="bottom">,</td>
					</xsl:if>
					<xsl:if test="$list != 0">
						<td width="1%" valign="bottom">;</td>
					</xsl:if>
					<xsl:if test="$dot != 0">
						<td width="1%" valign="bottom">.</td>
					</xsl:if>
				</tr>
				<tr align="center">
					<td class="descr" width="{$width_td1}">
						<xsl:value-of select="$description"/>
					</td>
					<xsl:if test="$comma != 0 or $list != 0 or $dot != 0">
						<td class="descr" width="1%">
							<br/>
						</td>
					</xsl:if>
				</tr>
			</tbody>
		</table>
	</xsl:template>

	<xsl:template match="//*[local-name()='CustomsMonitoringResults']//*" priority="-1">
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
		<xsl:param name="dateIn" />
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<span class="normal">
					<xsl:value-of select="substring($dateIn,9,2)" />
				</span>
				<span class="normal">.</span>
				<span class="normal">
					<xsl:value-of select="substring($dateIn,6,2)" />
				</span>
				<span class="normal">.</span>
				<span class="normal">
					<xsl:value-of select="substring($dateIn,1,4)" />
				</span>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dateIn" />
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
	<xsl:template name="DateStr">
		<xsl:param name="date"/>
		<xsl:choose>
			<xsl:when test="string-length($date) &gt; 0">
				<xsl:variable name="month" select="substring($date, 6, 2)"/>
				&#34;<u>&#160;<xsl:value-of select="substring($date,9,2)"/>&#160;</u>&#34;
				&#160;&#160;<u>&#160;
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
				&#160;</u>&#160;&#160;<xsl:value-of select="substring($date,1,2)"/><u><xsl:value-of select="substring($date,3,2)"/>&#160;</u>&#160;г.&#160;
			</xsl:when>
			<xsl:otherwise>
				&#34;&#160;<u>&#160;&#160;&#160;&#160;&#160;&#160;&#160;</u>&#160;&#34;
				&#160;&#160;<u>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;</u>&#160;&#160;
				20<u>&#160;&#160;&#160;&#160;&#160;</u>&#160;г.&#160;
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet>