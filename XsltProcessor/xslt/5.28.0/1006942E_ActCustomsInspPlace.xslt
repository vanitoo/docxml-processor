<?xml version="1.0" encoding="utf-8"?>
<!--Решение КТС от 20.05.2010 № 260 "О формах таможенных документов" 
в ред. Решения Коллегии ЕЭК от 11.07.2017 № 84 "О внесении изменений в Решение Комиссии Таможенного союза от 20 мая 2010 г. N 260"-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.24.0" xmlns:adt_cat="urn:customs.ru:Information:CustomsAuditDocuments:AuditCommonAggregateTypesCust:5.24.0" xmlns:acip="urn:customs.ru:Information:CustomsAuditDocuments:ActCustomsInspPlace:5.24.0">
	<!-- Шаблон для типа ActCustomsInspPlaceType -->
	<xsl:template match="acip:ActCustomsInspPlace">
		<xsl:param name="w" select="190"/>
		<html>
			<head>
				<style>
					body
					{background: #cccccc;
					font-family: Arial;}

					div
					{white-space: normal;}

					div.page
					{margin: 10px auto;
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
					{border: 1px solid windowtext;}

					.value
					{border-bottom: solid 1px black;
					font-family: Arial;
					font-size: 11pt;
					font-style: italic;}

					.annot
					{font-family: Arial;
					font-size: 11pt;}

					.title
					{font-weight:bold;
					font-family: Arial;
					font-size: 11pt;}

					tr.title td
					{font-weight:bold;
					font-family: Arial;
					font-size: 9pt;}

					.bordered
					{border-collapse: collapse;}

					td.bordered
					{border: solid 1px windowtext;}

					td.graphMain
					{vertical-align:top;}

					td.value.graphMain
					{vertical-align:bottom;}

					.graphLittle
					{font-family: Arial;
					font-size: 7pt;}

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

					.descr
					{font-size: 8pt;
					text-align: center;
					vertical-align:top;}
				</style>
			</head>
			<body>
				<div class="page" style="width: {$w}mm;">
					<table>
						<tbody>
							<tr align="center">
								<td class="value">
									<xsl:for-each select="acip:Customs">
										<xsl:if test="position()!=1"><xsl:text> (</xsl:text></xsl:if>
										<xsl:apply-templates select="."/>
										<xsl:if test="position()!=1"><xsl:text>)</xsl:text></xsl:if>
									</xsl:for-each>
								</td>
							</tr>
							<tr align="center">
								<td class="graphLittle">(наименование таможенного органа)</td>
							</tr>
						</tbody>
					</table>
					<table>
						<tbody>
							<tr>
								<td align="center" class="title">
									<font size="4">
										<b>Акт<br/>таможенного осмотра помещений и территорий</b>
									</font>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<table>
						<tbody>
							<tr>
								<td width="25%" align="left">
									<xsl:apply-templates select="acip:Date" mode="russian_date_month"/>
									<xsl:if test="not(acip:Date)">
										<xsl:call-template name="russian_date_month"/>
									</xsl:if>
								</td>
								<td width="50%" align="right"></td>
								<td width="25%" align="right">
									<table>
										<tbody>
											<tr>
												<td width="10%">№ </td>
												<td width="90%" class="value" align="center">
													<xsl:apply-templates select="acip:ActNumber"/>
												</td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<br/>
					<table>
						<tbody>
							<tr>
								<td style="width:30mm;">Осмотр начат: </td>
								<td style="width:2mm;"><xsl:text> </xsl:text></td>
								<td style="width:25mm" class="value" align="center"><xsl:apply-templates select="acip:BeginInspDate" mode="russian_date"/></td>
								<td style="width:2mm;"><xsl:text> </xsl:text></td>
								<td style="width:25mm;" class="value" align="center"><xsl:apply-templates select="acip:BeginInspDate" mode="russian_time_date"/></td>
								<td/>
							</tr>
							<tr align="center">
								<td style="width:30mm;"></td>
								<td style="width:2mm;"></td>
								<td style="width:25mm" class="graphLittle">(дата)</td>
								<td style="width:2mm;"><xsl:text> </xsl:text></td>
								<td style="width:25mm;" class="graphLittle">(время)</td>
								<td/>
							</tr>
						</tbody>
					</table>
					<table>
						<tbody>
							<tr>
								<td style="width:35mm;">Осмотр окончен: </td>
								<td style="width:2mm;"><xsl:text> </xsl:text></td>
								<td style="width:25mm" class="value" align="center"><xsl:apply-templates select="acip:EndInspDate" mode="russian_date"/></td>
								<td style="width:2mm;"><xsl:text> </xsl:text></td>
								<td style="width:25mm;" class="value" align="center"><xsl:apply-templates select="acip:EndInspDate" mode="russian_time_date"/></td>
								<td/>
							</tr>
							<tr align="center">
								<td style="width:35mm;"></td>
								<td style="width:2mm;"></td>
								<td style="width:25mm" class="graphLittle">(дата)</td>
								<td style="width:2mm;"><xsl:text> </xsl:text></td>
								<td style="width:25mm;" class="graphLittle">(время)</td>
								<td/>
							</tr>
						</tbody>
					</table>
					<br/>
					<table>
						<tbody>
							<tr>
								<td>Должностным лицом (должностными лицами):</td>
							</tr>
							<tr>
								<td>
									<table class="inlinetable" style="width: 100%;">
										<tbody>
											<tr align="left">
												<td class="value" width="100%">
													<xsl:for-each select="acip:CustomsPerson">
														<xsl:if test="position()!=1">, </xsl:if>
														<xsl:value-of select="cat_ru:PersonPost"/>
														<xsl:text> </xsl:text>
														<xsl:apply-templates select="." mode="fio"/>
													</xsl:for-each>
													<br/>
												</td>
											</tr>
											<tr align="center">
												<td class="descr" width="100%">
													<xsl:text>(должность, фамилия, инициалы должностного лица, которое провело таможенный осмотр помещений и территорий)</xsl:text>
												</td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
							<tr>
								<td>
									<xsl:text>на  основании  статьи  330  Таможенного кодекса Евразийского экономического союза и</xsl:text>
								</td>
							</tr>
							<tr>
								<td>
									<table class="inlinetable" style="width: 100%;">
										<tbody>
											<tr align="left">
												<td class="value" width="100%">
													<xsl:apply-templates select="acip:DocumentBase" mode="document"/>
													<br/>
												</td>
											</tr>
											<tr align="center">
												<td class="descr" width="100%">
													<xsl:text>(наименование документа, дата и номер предписания на проведение таможенного осмотра помещений и территорий либо решения (предписания) о проведении выездной таможенной проверки)</xsl:text>
												</td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
							<tr>
								<td>
									<xsl:text>в присутствии:</xsl:text>
								</td>
							</tr>
							<tr>
								<td>
									<xsl:text>владельца   (пользователя)   помещений   и  (или)   территорий   либо   его представителя:</xsl:text>
								</td>
							</tr>
							<tr>
								<td>
									<table class="inlinetable" style="width: 100%;">
										<tbody>
											<tr align="left">
												<td class="value" width="100%">
													<xsl:apply-templates select="acip:Owner" mode="person"/>
													<br/>
												</td>
											</tr>
											<tr align="center">
												<td class="descr" width="100%">
													<xsl:text>(место работы, должность, фамилия, инициалы, наименование и номер документа, удостоверяющего личность, место жительства)</xsl:text>
												</td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
							<tr>
								<td>
									<xsl:text>понятых:</xsl:text>
								</td>
							</tr>
							<tr>
								<td>
									<table class="inlinetable" style="width: 100%;">
										<tbody>
											<tr align="left">
												<td class="value" width="100%">
													<xsl:apply-templates select="acip:Witnesses" mode="person"/>
													<br/>
												</td>
											</tr>
											<tr align="center">
												<td class="descr" width="100%">
													<xsl:text>(место работы, должность, фамилия, инициалы, наименование и номер документа, удостоверяющего личность, место жительства)</xsl:text>
												</td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
							<tr>
								<td>
									<xsl:text>иных лиц:</xsl:text>
								</td>
							</tr>
							<tr>
								<td>
									<table class="inlinetable" style="width: 100%;">
										<tbody>
											<tr align="left">
												<td class="value" width="100%">
													<xsl:apply-templates select="acip:Other" mode="person"/>
													<br/>
												</td>
											</tr>
											<tr align="center">
												<td class="descr" width="100%">
													<xsl:text>(место работы, должность, фамилия, инициалы, наименование и номер документа, удостоверяющего личность, место жительства)</xsl:text>
												</td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
							<tr>
								<td>
									<xsl:text>с участием специалиста:</xsl:text>
								</td>
							</tr>
							<tr>
								<td>
									<table class="inlinetable" style="width: 100%;">
										<tbody>
											<tr align="left">
												<td class="value" width="100%">
													<xsl:apply-templates select="acip:Specialist" mode="person"/>
													<br/>
												</td>
											</tr>
											<tr align="center">
												<td class="descr" width="100%">
													<xsl:text>(место работы, должность, фамилия, инициалы, наименование и номер документа, удостоверяющего личность, место жительства)</xsl:text>
												</td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
							<tr>
								<td>
									<xsl:text>которому  разъяснены  его  права  и  обязанности, установленные статьей 346 Таможенного кодекса Евразийского экономического союза, проведен таможенный осмотр помещений и территорий</xsl:text>
								</td>
							</tr>
							<tr>
								<td>
									<table class="inlinetable" style="width: 100%;">
										<tbody>
											<tr align="left">
												<td class="value" width="100%">
													<xsl:for-each select="acip:NamePlaceInfo">
														<xsl:if test="position()!=1">; </xsl:if>
														<xsl:apply-templates select="acip:NamePlace"/>
													</xsl:for-each>
													<br/>
												</td>
											</tr>
											<tr align="center">
												<td class="descr" width="100%">
													<xsl:text>(наименование помещения и (или) территории)</xsl:text>
												</td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
							<tr>
								<td>
									<xsl:text>расположенных по адресу:</xsl:text>
								</td>
							</tr>
							<tr>
								<td>
									<table class="inlinetable" style="width: 100%;">
										<tbody>
											<tr align="left">
												<td class="value" width="100%">
													<xsl:for-each select="acip:NamePlaceInfo">
														<xsl:if test="position()!=1">; </xsl:if>
														<xsl:for-each select="acip:AddressPlace/*">
															<xsl:if test="position()!=1">, </xsl:if>
															<xsl:apply-templates select="."/>
														</xsl:for-each>
													</xsl:for-each>
													<br/>
												</td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
							<tr>
								<td>
									<xsl:text>В ходе таможенного осмотра помещений и территорий должностным(и) лицом(ами) таможенного органа совершены следующие действия:</xsl:text>
								</td>
							</tr>
							<tr>
								<td>
									<table class="inlinetable" style="width: 100%;">
										<tbody>
											<tr align="left">
												<td class="value" width="100%">
													<xsl:for-each select="acip:Actions">
														<xsl:if test="position()!=1"><br/></xsl:if>
														<xsl:apply-templates select="."/>
													</xsl:for-each>
													<br/>
												</td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
							<tr>
								<td>
									<xsl:text>В ходе таможенного осмотра помещений и территорий проводилась:</xsl:text>
								</td>
							</tr>
							<tr>
								<td>
									<table class="inlinetable" style="width: 100%;">
										<tbody>
											<tr align="left">
												<td class="value" width="100%">
													<xsl:for-each select="acip:FixInfo">
														<xsl:if test="position()!=1"><br/></xsl:if>
														<xsl:apply-templates select="."/>
													</xsl:for-each>
													<br/>
												</td>
											</tr>
											<tr align="center">
												<td class="descr" width="100%">
													<xsl:text>(фотосъемка, видео-, аудиозапись и т.п.)</xsl:text>
												</td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
							<tr>
								<td>
									<xsl:text>В результате таможенного осмотра помещений и территорий установлено:</xsl:text>
								</td>
							</tr>
							<tr>
								<td>
									<table class="inlinetable" style="width: 100%;">
										<tbody>
											<tr align="left">
												<td class="value" width="100%">
													<xsl:for-each select="acip:Results">
														<xsl:if test="position()!=1"><br/></xsl:if>
														<xsl:apply-templates select="."/>
													</xsl:for-each>
													<br/>
												</td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
							<tr>
								<td>
									<xsl:text>К акту таможенного осмотра помещений и территорий прилагаются </xsl:text>
									<xsl:text> (документы и материалы, имеющие значение, в том числе чертежи, схемы места осмотра, фото, таблицы и др.)</xsl:text>
									<xsl:text>: </xsl:text>
								</td>
							</tr>
							<tr>
								<td>
									<table class="inlinetable" style="width: 100%;">
										<tbody>
											<tr align="left">
												<td class="value" width="100%">
													<xsl:for-each select="acip:Applications">
														<xsl:if test="position()!=1"><br/></xsl:if>
														<xsl:apply-templates select="."/>
													</xsl:for-each>
													<br/>
												</td>
											</tr>
											<tr align="center">
												<td class="descr" width="100%">
													<!--xsl:text>(чертеж, схема места осмотра, фото, таблицы и т.п.)</xsl:text-->
												</td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
							<tr>
								<td>
									<xsl:text>Особые отметки</xsl:text>
									<xsl:text> (факты отказа в доступе на территорию (в помещения), пресечения сопротивления, 
									вскрытия запертых помещений (с указанием даты и времени вскрытия), 
									перерывы в проведении таможенного осмотра помещений и территорий на время убытия должностного лица (должностных лиц), 
									проводящего такой осмотр, из помещения и (или) с территории (дата и время начала перерыва, дата и время возобновления таможенного осмотра помещений и территорий) и др.)</xsl:text>
									<xsl:text>:</xsl:text>
								</td>
							</tr>
							<tr>
								<td>
									<table class="inlinetable" style="width: 100%;">
										<tbody>
											<tr align="left">
												<td class="value" width="100%">
													<xsl:for-each select="acip:SpecialMarks/acip:SpecialMarksText">
														<xsl:if test="position()!=1"><br/></xsl:if>
														<xsl:apply-templates select="."/>
													</xsl:for-each>
													<br/>
													<xsl:if test="acip:SpecialMarks/acip:OpeningDate">
														<xsl:text>Дата вскрытия: </xsl:text>
														<xsl:call-template name="russian_date">
															<xsl:with-param name="dateIn" select="acip:SpecialMarks/acip:OpeningDate"/>
														</xsl:call-template>
														<br/>
													</xsl:if>
													<xsl:if test="acip:SpecialMarks/acip:OpeningTime">
														<xsl:text>Время вскрытия: </xsl:text>
														<xsl:call-template name="russian_time">
															<xsl:with-param name="dateIn" select="acip:SpecialMarks/acip:OpeningTime"/>
														</xsl:call-template>
														<br/>
													</xsl:if>
													<xsl:if test="acip:SpecialMarks/acip:CustomsInspBreak/acip:BreakBegin">
														<xsl:text>Дата и время начала перерыва: </xsl:text>
														<xsl:call-template name="russian_date_time">
															<xsl:with-param name="dateIn" select="acip:SpecialMarks/acip:CustomsInspBreak/acip:BreakBegin"/>
														</xsl:call-template>
														<br/>
													</xsl:if>
													<xsl:if test="acip:SpecialMarks/acip:CustomsInspBreak/acip:BreakEnd">
														<xsl:text>Дата и время возобновления таможенного осмотра помещений и территорий: </xsl:text>
														<xsl:call-template name="russian_date_time">
															<xsl:with-param name="dateIn" select="acip:SpecialMarks/acip:CustomsInspBreak/acip:BreakEnd"/>
														</xsl:call-template>
														<br/>
													</xsl:if>
												</td>
											</tr>
											<tr align="center">
												<td class="descr" width="100%">
													<!--xsl:text>(факты отказа в доступе на территорию (в помещения), пресечения сопротивления, вскрытия запертых помещений и др.)</xsl:text-->
												</td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
							<tr>
								<td>
									<xsl:text>Замечания,  заявления, сделанные лицами, присутствующими (участвующими) при таможенном осмотре помещений и территорий:</xsl:text>
								</td>
							</tr>
							<tr>
								<td>
									<table class="inlinetable" style="width: 100%;">
										<tbody>
											<tr align="left">
												<td class="value" width="100%">
													<xsl:for-each select="acip:PersonsNotesInfo">
														<xsl:if test="position()!=1"><br/></xsl:if>
														<xsl:apply-templates select="."/>
													</xsl:for-each>
													<br/>
												</td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
							<tr>
								<td>
									<br/>
									<xsl:text>Подписи  лиц,  принимавших  участие  (присутствовавших)  в (при) проведении таможенного осмотра помещений и территорий:</xsl:text>
								</td>
							</tr>
							<tr>
								<td>
									<br/>
									<xsl:text>Должностное(ые) лицо(а) таможенного органа:</xsl:text>
								</td>
							</tr>
							<xsl:for-each select="acip:CustomsPerson">
								<tr>
									<td width="60%">
										<table class="inlinetable" style="width: 100%;">
											<tbody>
												<tr align="left">
													<td class="value" width="60%">
														<xsl:for-each select="acip:SpecialMarks">
															<xsl:if test="position()!=1"><br/></xsl:if>
															<xsl:apply-templates select="."/>
														</xsl:for-each>
														<br/>
													</td>
													<td width="5%"></td>
													<td class="value" width="35%" align="center">
														<xsl:apply-templates select="." mode="fio"/>
													</td>
												</tr>
												<tr align="center">
													<td class="descr" width="60%">
														<xsl:text>(подпись, личная номерная печать (при наличии))</xsl:text>
													</td>
													<td width="10%"></td>
													<td class="descr" width="30%">(фамилия, инициалы)</td>
												</tr>
											</tbody>
										</table>
									</td>
								</tr>
							</xsl:for-each>
							<tr>
								<td>
									<br/>
									<xsl:text>Представитель лица:</xsl:text>
								</td>
							</tr>
							<xsl:for-each select="acip:Owner">
								<tr>
									<td width="60%">
										<table class="inlinetable" style="width: 100%;">
											<tbody>
												<tr align="left">
													<td class="value" width="45%">
														<xsl:for-each select="acip:SpecialMarks">
															<xsl:if test="position()!=1"><br/></xsl:if>
															<xsl:apply-templates select="."/>
														</xsl:for-each>
														<br/>
													</td>
													<td width="25%"></td>
													<td class="value" width="30%" align="center">
														<xsl:apply-templates select="." mode="fio"/>
													</td>
												</tr>
												<tr align="center">
													<td class="descr" width="45%">
														<xsl:text>(подпись)</xsl:text>
													</td>
													<td width="25%"></td>
													<td class="descr" width="30%">(фамилия, инициалы)</td>
												</tr>
											</tbody>
										</table>
									</td>
								</tr>
							</xsl:for-each>
							<tr>
								<td>
									<br/>
									<xsl:text>Присутствующие лица:</xsl:text>
								</td>
							</tr>
							<xsl:for-each select="acip:Witnesses|acip:Other">
								<tr>
									<td width="60%">
										<table class="inlinetable" style="width: 100%;">
											<tbody>
												<tr align="left">
													<td class="value" width="45%">
														<xsl:for-each select="acip:SpecialMarks">
															<xsl:if test="position()!=1"><br/></xsl:if>
															<xsl:apply-templates select="."/>
														</xsl:for-each>
														<br/>
													</td>
													<td width="25%"></td>
													<td class="value" width="30%" align="center">
														<xsl:apply-templates select="." mode="fio"/>
													</td>
												</tr>
												<tr align="center">
													<td class="descr" width="45%">
														<xsl:text>(подпись)</xsl:text>
													</td>
													<td width="25%"></td>
													<td class="descr" width="30%">(фамилия, инициалы)</td>
												</tr>
											</tbody>
										</table>
									</td>
								</tr>
							</xsl:for-each>
							<tr>
								<td>
									<br/>
									<xsl:text>Специалист:</xsl:text>
								</td>
							</tr>
							<xsl:for-each select="acip:Specialist">
								<tr>
									<td width="60%">
										<table class="inlinetable" style="width: 100%;">
											<tbody>
												<tr align="left">
													<td class="value" width="45%">
														<xsl:for-each select="acip:SpecialMarks">
															<xsl:if test="position()!=1"><br/></xsl:if>
															<xsl:apply-templates select="."/>
														</xsl:for-each>
														<br/>
													</td>
													<td width="25%"></td>
													<td class="value" width="30%" align="center">
														<xsl:apply-templates select="." mode="fio"/>
													</td>
												</tr>
												<tr align="center">
													<td class="descr" width="45%">
														<xsl:text>(подпись)</xsl:text>
													</td>
													<td width="25%"></td>
													<td class="descr" width="30%">(фамилия, инициалы)</td>
												</tr>
											</tbody>
										</table>
									</td>
								</tr>
							</xsl:for-each>
							<tr>
								<td>
									<br/>
									<xsl:text>Второй экземпляр акта получил:</xsl:text>
								</td>
							</tr>
							<xsl:for-each select="acip:SecondExempReceived">
								<tr>
									<td width="60%">
										<table class="inlinetable" style="width: 100%;">
											<tbody>
												<tr align="left">
													<td class="value" width="75%">
														<xsl:apply-templates select="cat_ru:PersonPost"/>
														<xsl:text> </xsl:text>
														<xsl:apply-templates select="." mode="fio"/>
														<br/>
													</td>
													<td width="5%"></td>
													<td class="value" width="20%" align="center">
														
													</td>
												</tr>
												<tr align="center">
													<td class="descr" width="75%">
														<xsl:text>(должность, фамилия, инициалы лица, получившего второй экземпляр акта)</xsl:text>
													</td>
													<td width="5%"></td>
													<td class="descr" width="20%">(подпись)</td>
												</tr>
											</tbody>
										</table>
									</td>
								</tr>
							</xsl:for-each>
							<tr>
								<td>
									<br/>
									<table class="inlinetable" style="width: 25%;">
										<tbody>
											<tr align="left">
												<td width="100%">
													<xsl:apply-templates mode="russian_date_month" select="acip:SecondExempReceived/adt_cat:Date"/>
												</td>
											</tr>
											<tr align="center">
												<td class="descr" width="100%">
													<xsl:text>(дата получения второго экземпляра акта)</xsl:text>
												</td>
											</tr>
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
	
	<xsl:template match="*" mode="person">
		<xsl:if test="position()!=1">; </xsl:if>
		<xsl:apply-templates select="adt_cat:Job"/>
		<xsl:text> </xsl:text>
		<xsl:apply-templates select="cat_ru:PersonPost"/>
		<xsl:text> </xsl:text>
		<xsl:apply-templates select="." mode="fio"/>
		<xsl:text> </xsl:text>
		<xsl:apply-templates select="adt_cat:Passport" mode="passport"/>
		<xsl:text> </xsl:text>
		<xsl:if test="adt_cat:ResidencePlace">
			<xsl:text>, адрес: </xsl:text>
			<xsl:for-each select="adt_cat:ResidencePlace/*">
				<xsl:if test="position()!=1">, </xsl:if>
				<xsl:apply-templates select="."/>
			</xsl:for-each>
		</xsl:if>
	</xsl:template>
	
	<xsl:template match="*" mode="passport">
		<xsl:text>, </xsl:text>
		<xsl:apply-templates select="RUScat_ru:FullIdentityCardName"/>
		<xsl:text> </xsl:text>
		<xsl:apply-templates select="RUScat_ru:IdentityCardSeries"/>
		<xsl:text> </xsl:text>
		<xsl:apply-templates select="RUScat_ru:IdentityCardNumber"/>
	</xsl:template>
	
	<xsl:template mode="document" match="*">
		<xsl:apply-templates select="cat_ru:PrDocumentName"/>
		<xsl:if test="cat_ru:PrDocumentNumber">
			<xsl:text> № </xsl:text>
			<xsl:apply-templates select="cat_ru:PrDocumentNumber"/>
		</xsl:if>
		<xsl:if test="cat_ru:PrDocumentDate">
			<xsl:text> от </xsl:text>
			<xsl:apply-templates select="cat_ru:PrDocumentDate" mode="russian_date"/>
		</xsl:if>
	</xsl:template>
	
	<xsl:template match="*" mode="fio">
		<xsl:apply-templates select="cat_ru:PersonSurname"/>
		<xsl:text> </xsl:text>
		<xsl:apply-templates select="cat_ru:PersonName" mode="initial"/>
		<xsl:apply-templates select="cat_ru:PersonMiddleName" mode="initial"/>
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
	<xsl:template name="russian_time_date">
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<xsl:value-of select="substring($dateIn, 12, 8)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dateIn"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="russian_date_month">
		<xsl:param name="dateIn"/>
		<table>
			<tbody align="center" class="graphMain">
				<tr>
					<td width="2%" align="right">" </td>
					<td width="13%" class="value">
						<xsl:value-of select="substring($dateIn,9,2)"/>
					</td>
					<td width="2%" align="left"> "</td>
					<td width="3%"> </td>
					<td width="58%" class="value">
						<xsl:variable name="month" select="substring($dateIn, 6, 2)"/>
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
						<xsl:value-of select="substring($dateIn,1,2)"/>
					</td>
					<td width="9%" class="value" align="left">
						<xsl:value-of select="substring($dateIn,3,2)"/>
					</td>
					<td width="4%"> </td>
					<td width="2%"> г.</td>
				</tr>
			</tbody>
		</table>
	</xsl:template>
	<xsl:template match="//*[local-name()='ActCustomsInspPlace']//*" priority="-1">
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
	<xsl:template match="*" mode="russian_date_month">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:call-template name="russian_date_month">
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
	<xsl:template match="*" mode="russian_time_date">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:call-template name="russian_time_date">
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
