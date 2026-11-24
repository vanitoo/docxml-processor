<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.24.0" xmlns:rrdi="urn:customs.ru:Information:CustomsAuditDocuments:ReportResultsDocInspection:5.27.0">
	<!-- Шаблон для типа ReportResultsDocInspectionType -->
	<xsl:template match="rrdi:ReportResultsDocInspection">
		<xsl:param name="w" select="210"/>
		<html>
			<head>
				<style>
                  body {
                  background: #cccccc;
                  font-family:Arial;
                  }

                  div
                  {
                  white-space: normal;
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
                  font-size: 11pt;
                  font-style: italic;
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
                  .descr{
					font-size: 8pt;
					text-align: center;
					vertical-align:top;
					}
				.borderTop{
					border-top: 1px solid black;
				}
                </style>
			</head>
			<body>
				<div class="page" style="width: {$w}mm;">
					<table>
						<tbody>
							<tr>
								<td align="center" class="title">
									<font size="4">
										ФЕДЕРАЛЬНАЯ ТАМОЖЕННАЯ СЛУЖБА
									</font>
								</td>
							</tr>
						</tbody>
					</table>
					<table>
						<tbody>
							<tr align="center">
								<td>
									<xsl:apply-templates select="rrdi:CustomsName"/>
									<xsl:if test="rrdi:DepartmentName">
										<br/>
										<xsl:apply-templates select="rrdi:DepartmentName"/>
									</xsl:if>
								</td>
							</tr>
							<tr>
								<td class="descr borderTop">(наименование таможенного органа)</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<table>
						<tbody>
							<tr>
								<td width="40%" align="left">
									<xsl:apply-templates select="rrdi:DocDate" mode="russian_date_month"/>
								</td>
								<td/>
								<td width="40%" align="center">
									<table>
										<tbody>
											<tr valign="bottom">
												<td>
													Начальнику (заместителю начальника) таможенного органа
													<br/>
													<xsl:for-each select="rrdi:HeadOrDeputyHead/*[contains(local-name(), 'ame')]">
														<xsl:if test="position() != 1"><xsl:text> </xsl:text></xsl:if>
														<xsl:apply-templates select="."/>
													</xsl:for-each>
													<xsl:if test="rrdi:HeadOrDeputyHead/*[local-name() = 'PersonPost']">
														<xsl:text>, </xsl:text>
														<xsl:apply-templates select="rrdi:HeadOrDeputyHead/*[local-name() = 'PersonPost']"/>
													</xsl:if>
												</td>
											</tr>
											<tr>
												<td class="descr borderTop">(Ф.И.О.)</td>
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
							<tr align="center">
								<th>ДОКЛАДНАЯ ЗАПИСКА</th>
							</tr>
							<tr align="center">
								<td>по результатам проверки таможенных, иных документов и (или) сведений</td>
							</tr>
							<tr align="center">
								<td>
									<br/>
									<xsl:text>№ </xsl:text>
									<xsl:apply-templates select="rrdi:DocNumber"/>
								</td>
							</tr>
							<tr>
								<td>
									<br/>
									<xsl:text>Должностными лицами:</xsl:text>
									<table class="inlinetable" style="width: 100%;">
										<tbody>
											<tr align="left">
												<td class="value" width="100%">
													<xsl:apply-templates select="rrdi:CustomsPersons"  mode="list"/>
												</td>
											</tr>
											<tr align="center">
												<td class="descr" width="100%">
													<xsl:text>(должоность, структурное подразделение, Ф.И.О. (при наличии) лиц, проводивших проверку таможенных, иных документов и (или) сведений (далее - проверка))</xsl:text>
												</td>
											</tr>
										</tbody>
									</table>
									<xsl:text>c </xsl:text>
									<xsl:apply-templates select="rrdi:StartControlDate" mode="russian_date_month"/>
									<xsl:if test="rrdi:FinishControlDate">
										<xsl:text> по </xsl:text>
										<xsl:apply-templates select="rrdi:FinishControlDate" mode="russian_date_month"/>
									</xsl:if>
									<xsl:text> на основании статьи 326 ТК ЕАЭС и статей 225, 226 Федерального закона от 03.08.2018 № 289-ФЗ (О таможенном регулировании в Российской Федерации и о внесении изменений в отдельные законодательные акты Российской Федерации" у</xsl:text>
									<table class="inlinetable" style="width: 100%;">
										<tbody>
											<tr align="left">
												<td class="value" width="100%">
													<xsl:apply-templates select="rrdi:VerifiedPerson"/>
												</td>
											</tr>
											<tr align="center">
												<td class="descr" width="100%">
													<xsl:text>(указываются сведения о лице, чил документы и (или) сведения проверялись)</xsl:text>
												</td>
											</tr>
										</tbody>
									</table>
									<xsl:text>проведена проверка, объектам которой являются:</xsl:text>
									<table class="inlinetable" style="width: 100%;">
										<tbody>
											<tr align="left">
												<td class="value" width="100%">
													<xsl:apply-templates select="rrdi:PreviousDocDocDetails"/>
												</td>
											</tr>
											<tr align="center">
												<td class="descr" width="100%">
													<xsl:text>(номера деклараций на товары либо иных документов, представленных таможенному органу при совершении таможенных операций)</xsl:text>
												</td>
											</tr>
										</tbody>
									</table>
									<xsl:text>Направление проверки: </xsl:text>
									<br/>
									<xsl:for-each select="rrdi:CheckDirections">
										<xsl:if test="position() != 1"><br/></xsl:if>
										<xsl:apply-templates select="rrdi:CheckDirectionsCode"/>
										<xsl:if test="rrdi:CheckDirectionsName">
											<xsl:text> - </xsl:text>
											<xsl:apply-templates select="rrdi:CheckDirectionsName"/>
										</xsl:if>
									</xsl:for-each>
									<br/>
									<xsl:text>Проверка проведения на основании следующих документов:</xsl:text>
									<table class="inlinetable" style="width: 100%;">
										<tbody>
											<tr align="left">
												<td class="value" width="100%">
													<xsl:for-each select="rrdi:DocumentRequest">
														<xsl:if test="position() != 1"><br/></xsl:if>
														<xsl:apply-templates select="." mode="doc_num"/>
													</xsl:for-each>
												</td>
											</tr>
											<tr align="center">
												<td class="descr" width="100%">
													<xsl:text>(виды проверенных документов, включая дополнительно запрошенные, и при необходимости перечень конкретных документов)</xsl:text>
												</td>
											</tr>
										</tbody>
									</table>
									<xsl:text>В ходе проверки установлено: </xsl:text>
									<br/>
									<xsl:for-each select="rrdi:ResultsDescription"/>
									<br/>
									<br/>
									<xsl:text>Выводы и предолжения: </xsl:text>
									<br/>
									<xsl:for-each select="rrdi:ConclusionsAndOffers">
										<xsl:if test="position() != 1"><br/></xsl:if>
										<xsl:apply-templates select="."/>
									</xsl:for-each>
									<br/>
									<br/>
									<xsl:text>Должностные лица, проводившие проверку:</xsl:text>
									<xsl:apply-templates select="rrdi:CustomsPersons" mode="sig"/>
									<br/>
									<br/>
									<xsl:text>Согласовано:</xsl:text>
									<table class="inlinetable" style="width: 100%;">
										<tbody>
											<tr align="left">
												<td class="value" width="100%">
													<xsl:for-each select="rrdi:CustomsHeadPersons/*[contains(local-name(), 'ame')]">
														<xsl:if test="position() != 1"><xsl:text> </xsl:text></xsl:if>
														<xsl:apply-templates select="."/>
													</xsl:for-each>
												</td>
											</tr>
											<tr align="center">
												<td class="descr" width="100%">
													<xsl:text>(начальник (заместитель начальника) таможенного органа, Ф.И.О.(при наличии), подпись)</xsl:text>
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
	
	<xsl:template match="rrdi:CustomsPersons" mode="sig">
		<table class="inlinetable" style="width: 100%;">
			<tbody>
				<tr align="left">
					<td class="value" width="100%">
						<xsl:for-each select="*[contains(local-name(), 'ame')]">
							<xsl:if test="position() != 1"><xsl:text> </xsl:text></xsl:if>
							<xsl:apply-templates select="."/>
						</xsl:for-each>
					</td>
				</tr>
				<tr align="center">
					<td class="descr" width="100%">
						<xsl:text>(Ф.И.О., подпись)</xsl:text>
					</td>
				</tr>
			</tbody>
		</table>
	</xsl:template>
	
	<xsl:template match="rrdi:ConclusionsAndOffers">
		<xsl:apply-templates select="rrdi:ConclAndOffersText"/>
		<xsl:if test="rrdi:NeedSendActSign">
			<xsl:text> Необходимо направить акт и материалы проверки: </xsl:text>
			<xsl:for-each select="rrdi:NeedSendActSign">
				<xsl:if test="position() != 1"><xsl:text>, </xsl:text></xsl:if>
				<xsl:apply-templates select="."/>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="rrdi:ActionsSign">
			<xsl:text> Необходимо провести: </xsl:text>
			<xsl:for-each select="rrdi:ActionsSign">
				<xsl:if test="position() != 1"><xsl:text>, </xsl:text></xsl:if>
				<xsl:apply-templates select="."/>
			</xsl:for-each>
		</xsl:if>
	</xsl:template>
	
	<xsl:template match="rrdi:ActionsSign">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:choose>
				<xsl:when test=". = 1">внесение изменений в нормативные правовые акты</xsl:when>
				<xsl:when test=". = 2">разработка проекта профиля риска и ориентировки</xsl:when>
				<xsl:when test=". = 3">назначение проведения таможенной ревизии</xsl:when>
				<xsl:otherwise><xsl:value-of select="."/></xsl:otherwise>
			</xsl:choose>
		</element>
	</xsl:template>
	
	<xsl:template match="rrdi:NeedSendActSign">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:if test=". = 0 or . = false or . = f">нет</xsl:if>
			<xsl:if test=". = 1 or . = true or . = t">да</xsl:if>
			<!--xsl:choose>
				<xsl:when test=". = 1">в соответствующее структурное подразделение ТО для отмены ранее принятого решения и принятия нового решения по направлению Проверки, а также выставления требования об уплате таможенных платежей</xsl:when>
				<xsl:when test=". = 2">в правоохранительное подразделение ТО для возбуждения дела об АП и (или) УД</xsl:when>
				<xsl:when test=". = 3">в правоохранительные и иные контролирующие органы для проведения проверок по выявленным фактам несоблюдения законодательства РФ</xsl:when>
				<xsl:when test=". = 4">руководителю ТО для принятия решения о проведении служебной проверки по фактам несоблюдения должностными лицами таможенного органа таможенного законодательства РФ</xsl:when>
				<xsl:otherwise><xsl:value-of select="."/></xsl:otherwise>
			</xsl:choose-->
		</element>
	</xsl:template>
	
	<xsl:template match="rrdi:PreviousDocDocDetails">
		<xsl:if test="position() != 1"><br/></xsl:if>
		<xsl:if test="rrdi:CustomsDeclarationIdDetails">Декларации: </xsl:if>
		<xsl:for-each select="rrdi:CustomsDeclarationIdDetails">
			<xsl:if test="position()!=1"><xsl:text>, </xsl:text></xsl:if>
			<xsl:apply-templates select="." mode="gtd_num"/>
		</xsl:for-each>
		<xsl:if test="rrdi:OtherDocDetails"> Документы: </xsl:if>
		<xsl:for-each select="rrdi:OtherDocDetails">
			<xsl:if test="position() != 1"><xsl:text>, </xsl:text></xsl:if>
			<xsl:apply-templates select="." mode="doc_num"/>
		</xsl:for-each>
	</xsl:template>
	
	<xsl:template match="*" mode="gtd_num">
		<xsl:apply-templates select="*[local-name() = 'CustomsCode']"/>
		<xsl:text>/</xsl:text>
		<xsl:apply-templates select="*[local-name() = 'RegistrationDate']" mode="num_date"/>
		<xsl:text>/</xsl:text>
		<xsl:apply-templates select="*[local-name() = 'GTDNumber']"/>
	</xsl:template>
	
	<xsl:template match="*" mode="doc_num">
		<xsl:for-each select="*">
			<xsl:choose>
				<xsl:when test="contains(local-name(), 'Number')"> № </xsl:when>
				<xsl:when test="contains(local-name(), 'Date')"> от </xsl:when>
				<xsl:when test="contains(local-name(), 'Code')"> код </xsl:when>
			</xsl:choose>
			<xsl:choose>
				<xsl:when test="contains(local-name(), 'Date')">
					<xsl:apply-templates select="." mode="russian_date"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:apply-templates select="."/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:for-each>
	</xsl:template>
	
	<xsl:template match="rrdi:VerifiedPerson">
		<xsl:if test="rrdi:VerifiedPersonYUL">
			<xsl:for-each select="rrdi:VerifiedPersonYUL/*">
				<xsl:if test="position() != 1"><xsl:text>, </xsl:text></xsl:if>
				<xsl:apply-templates select="."/>
			</xsl:for-each>
			<xsl:if test="rrdi:OGRN">
				<xsl:text>, ОГРН: </xsl:text>
				<xsl:apply-templates select="rrdi:OGRN"/>
			</xsl:if>
			<xsl:if test="rrdi:INN">
				<xsl:text>, ИНН: </xsl:text>
				<xsl:apply-templates select="rrdi:INN"/>
			</xsl:if>
			<xsl:if test="rrdi:KPP">
				<xsl:text>, КПП: </xsl:text>
				<xsl:apply-templates select="rrdi:KPP"/>
			</xsl:if>
			<xsl:if test="rrdi:FactAddress">
				<xsl:text>, место нахождения: </xsl:text>
				<xsl:apply-templates select="rrdi:FactAddress" mode="address"/>
			</xsl:if>
			<xsl:if test="rrdi:Address">
				<xsl:text>, место регистрации: </xsl:text>
				<xsl:apply-templates select="rrdi:Address" mode="address"/>
			</xsl:if>
		</xsl:if>
		<xsl:if test="rrdi:VerifiedPersonFL">
			<xsl:for-each select="rrdi:VerifiedPersonFL/*">
				<xsl:if test="position() != 1"><xsl:text> </xsl:text></xsl:if>
				<xsl:apply-templates select="."/>
			</xsl:for-each>
			<xsl:if test="rrdi:OGRN">
				<xsl:text>, ОГРНИП: </xsl:text>
				<xsl:apply-templates select="rrdi:OGRN"/>
			</xsl:if>
		</xsl:if>
	</xsl:template>
	
	<xsl:template match="*" mode="address">
		<xsl:choose>
			<xsl:when test="*[local-name() = 'AddressText']">
				<xsl:apply-templates select="*[local-name() = 'AddressText']"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:for-each select="*[local-name() != 'AddressText' and local-name() != 'AddressKindCode']">
					<xsl:if test="position() != 1"><xsl:text>, </xsl:text></xsl:if>
					<xsl:apply-templates select="."/>
				</xsl:for-each>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
	<xsl:template match="rrdi:CustomsPersons" mode="list">
		<xsl:if test="position() != 1"><br/></xsl:if>
		<xsl:for-each select="*[contains(local-name(), 'ame')]">
			<xsl:if test="position() != 1"><xsl:text> </xsl:text></xsl:if>
			<xsl:apply-templates select="."/>
		</xsl:for-each>
		<xsl:if test="*[local-name() = 'PersonPost']">
			<xsl:text>, </xsl:text>
			<xsl:apply-templates select="*[local-name() = 'PersonPost']"/>
		</xsl:if>
		<xsl:if test="*[local-name() = 'StructuralSubdivision']">
			<xsl:text>, </xsl:text>
			<xsl:apply-templates select="*[local-name() = 'StructuralSubdivision']"/>
		</xsl:if>
	</xsl:template>
	
	<xsl:template match="*" mode="customs">
		<xsl:for-each select="*">
			<xsl:if test="position() != 1"><xsl:text> </xsl:text></xsl:if>
			<xsl:apply-templates select="."/>
		</xsl:for-each>
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
	
	<xsl:template name="num_date">
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
	
	<xsl:template name="russian_date_month">
		<xsl:param name="dateIn"/>
		<xsl:comment>
			<xsl:copy-of select="$dateIn"/>
		</xsl:comment>
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<xsl:value-of select="substring (., 9, 2)"/>
				<xsl:text> </xsl:text>
				<xsl:variable name="month" select="substring(., 6, 2)"/>
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
				<xsl:text> </xsl:text>		
				<xsl:value-of select="substring(., 1, 4)"/> г.
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dateIn"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="//*[local-name()='ReportResultsDocInspection']//*" priority="-1">
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
	
	<xsl:template match="*" mode="num_date">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:call-template name="num_date">
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
