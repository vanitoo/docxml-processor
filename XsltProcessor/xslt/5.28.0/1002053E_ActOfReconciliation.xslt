<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:aor="urn:customs.ru:Information:CommercialFinanceDocuments:ActOfReconciliation:5.26.0" xmlns:CategoryCust="urn:customs.ru:Categories:3.0.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:els_leaf="urn:customs.ru:Information:ELSDocuments:ELSLeafTypes:5.26.0" xmlns:xs="http://www.w3.org/2001/XMLSchema">
	<!-- Шаблон для типа ActOfReconciliationType -->
	<xsl:template match="aor:ActOfReconciliation">
		<xsl:param name="w" select="277"/>
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
                  .underline{
					border-bottom: 1px solid black;
                  }
                  .descr{
					font-size:8pt;
					text-align: center;
                  }
                </style>
			</head>
			<body>
				<div class="page" style="width: {$w}mm;">
					<table>
						<tbody>
							<tr>
								<td align="center">АКТ СВЕРКИ<br/>
								использования субсидий на возмещение затрат по уплате ввозной таможенной пошлины и налога на добавленную стоимость,<br/>
								понесенных юридическими лицами, индивидуальными предпринимателями, являющимися лицами,<br/>
								участвующими в реализации проекта создания и обеспечения функционирования территориально обособленного комплекса<br/>
								(инновационного центра «Сколково») (инновационного научно-технологического центра)
								</td>
							</tr>
							<tr>
								<td align="center">
									<br/>
									<xsl:text>за </xsl:text>
										<xsl:apply-templates select="aor:ActDetails/aor:Month" mode="month_name"/>
									<xsl:text> месяц </xsl:text>
									<xsl:apply-templates select="aor:ActDetails/aor:Year"/>
									<xsl:text> г.</xsl:text>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<table>
						<tbody>
							<tr>
								<td width="60%" colspan="2">
									<xsl:text>1. Предусмотрено бюджетных ассигнований в федеральном бюджете на </xsl:text>
									<xsl:apply-templates select="aor:ActDetails/aor:Year"/>
									<xsl:text> год - </xsl:text>
								</td>
								<td width="60%" align="left">
									<xsl:apply-templates select="aor:ActDetails/aor:TotalAppropriations" mode="roubles"/>
								</td>
							</tr>
							<tr>
								<td width="35%">
									<xsl:text>2. Остаток бюджетных ассигнований на начало</xsl:text>
								</td>
								<td width="25%">
									<xsl:apply-templates select="aor:ActDetails/aor:Month" mode="month_name_genitive"/>
									<xsl:text> месяца </xsl:text>
									<xsl:apply-templates select="aor:ActDetails/aor:Year"/>
									<xsl:text> г.</xsl:text>
								</td>
								<td width="40%"></td>
							</tr>
							<tr>
								<td>
								</td>
								<td>
									<xsl:apply-templates select="aor:ActDetails/aor:RemainderAppropriations" mode="roubles"/>
								</td>
								<td>
									<xsl:apply-templates select="aor:ActDetails/aor:RemainderAppropriations" mode="kopeikas"/>
								</td>
							</tr>
							<tr>
								<td>
									<xsl:text>3. Израсходовано бюджетних ассигнований в текущем месяце</xsl:text>
								</td>
								<td>
									<xsl:apply-templates select="aor:ActDetails/aor:UsedAppropriations" mode="roubles"/>
								</td>
								<td>
									<xsl:apply-templates select="aor:ActDetails/aor:UsedAppropriations" mode="kopeikas"/>
								</td>
							</tr>
							<tr>
								<td colspan="3">
									<table>
										<tbody>
											<tr align="center" valign="top">
												<td class="bordered" rowspan="2">№ п/п</td>
												<td class="bordered" rowspan="2">Наименование декларанта</td>
												<td class="bordered" rowspan="2">ИНН декларанта</td>
												<td class="bordered" colspan="3">Использовано субсидий (рублей)</td>
											</tr>
											<tr align="center" valign="top">
												<td class="bordered">ввоздная<br/>таможенная<br/>пошлина</td>
												<td class="bordered">налог на<br/>добавленную<br/>стоимость</td>
												<td class="bordered">сумма<br/>таможенного<br/>платежа</td>
											</tr>
											<xsl:for-each select="aor:Declarant">
												<tr>
													<td class="bordered">
														<xsl:value-of select="position()"/>
													</td>
													<td class="bordered">
														<xsl:apply-templates select="aor:OrganizationName"/>
													</td>
													<td class="bordered">
														<xsl:apply-templates select="aor:INN"/>
													</td>
													<td class="bordered" align="right">
														<xsl:apply-templates select="aor:ImportCustomsDuty" mode="translate_number"/>
													</td>
													<td class="bordered" align="right">
														<xsl:apply-templates select="aor:ValueAddedTax" mode="translate_number"/>
													</td>
													<td class="bordered" align="right">
														<xsl:apply-templates select="aor:CustomsPaymentAmount" mode="translate_number"/>
													</td>
												</tr>
											</xsl:for-each>
											<tr>
												<td class="bordered" colspan="3" align="center">Итого:</td>
												<td class="bordered" align="right">
													<xsl:apply-templates select="aor:TotalAmount/aor:ImportCustomsDuty" mode="translate_number"/>
												</td>
												<td class="bordered" align="right">
													<xsl:apply-templates select="aor:TotalAmount/aor:ValueAddedTax" mode="translate_number"/>
												</td>
												<td class="bordered" align="right">
													<xsl:apply-templates select="aor:TotalAmount/aor:CustomsPaymentAmount" mode="translate_number"/>
												</td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
							<tr>
								<td width="40%">
									<xsl:text>4. Остаток бюджетных ассигнований на 1</xsl:text>
								</td>
								<td width="20%" valign="top">
									<xsl:choose>
										<xsl:when test="aor:ActDetails/aor:ActAattribute = 2">
											<xsl:apply-templates select="aor:ActDetails/aor:Month" mode="month_name_genitive"/>
											<xsl:text> месяца </xsl:text>
											<xsl:apply-templates select="aor:ActDetails/aor:Year"/>
											<xsl:text> г.</xsl:text>
										</xsl:when>
										<xsl:otherwise>
											<xsl:if test="aor:ActDetails[aor:Month and aor:Year]">
												<xsl:variable name="month_real" select="aor:ActDetails/aor:Month"/>
												<xsl:variable name="month_plus" select="$month_real + 1"/>
												<xsl:variable name="month" select="($month_plus mod 13) + 1"/>
												<xsl:variable name="year">
													<xsl:choose>
														<xsl:when test="$month_plus > 12">
															<xsl:value-of select="aor:ActDetails/aor:Year + 1"/>
														</xsl:when>
														<xsl:otherwise>
															<xsl:value-of select="aor:ActDetails/aor:Year"/>
														</xsl:otherwise>
													</xsl:choose>
												</xsl:variable>
												<table style="display: inline-block; width:40mm;">
													<tbody>
														<tr>
															<td class="underline" align="center">
																<xsl:call-template name="month_name_genitive"><xsl:with-param name="val" select="$month"/></xsl:call-template>
															</td>
														</tr>
														<tr>
															<td class="descr">(месяц)</td>
														</tr>
													</tbody>
												</table>
												<xsl:text> </xsl:text>
												<xsl:value-of select="$year"/>
												<xsl:text> г.</xsl:text>
											</xsl:if>
										</xsl:otherwise>
									</xsl:choose>
									
								</td>
								<td width="40%"></td>
							</tr>
							<tr>
								<td width="40%">
								</td>
								<td width="20%">
									<xsl:apply-templates select="aor:RemainderAppNextMonth" mode="roubles"/>
								</td>
								<td width="40%">
									<xsl:apply-templates select="aor:RemainderAppNextMonth" mode="kopeikas"/>
								</td>
							</tr>
							<tr>
								<td colspan="3">
									<xsl:text>5. Реквизиты для перечисления управляющей компанией остатка неизрасходованных бюджетных ассигнований:</xsl:text><br/>
									<xsl:apply-templates select="aor:Recipient"/>
								</td>
							</tr>
							<tr>
								<td><br/><br/><br/></td>
							</tr>
							<xsl:for-each select="aor:ApprovedPerson">
								<tr>
									<td colspan="3">
										<table>
											<tbody>
												<tr valign="bottom" align="center">
													<td width="30%" class="underline">
														<xsl:apply-templates select="*[local-name() = 'PersonPost']"/>
													</td>
													<td width="10%"></td>
													<td width="20%" class="underline"></td>
													<td width="10%"></td>
													<td width="30%" class="underline" align="center">
														<xsl:apply-templates select="*[local-name() = 'PersonSurname']"/>
														<xsl:text> </xsl:text>
														<xsl:apply-templates select="*[local-name() = 'PersonName']"/>
														<xsl:text> </xsl:text>
														<xsl:apply-templates select="*[local-name() = 'PersonMiddleName']"/>
													</td>
												</tr>
												<tr>
													<td class="descr">(должность)</td>
													<td></td>
													<td class="descr">(подпись)</td>
													<td></td>
													<td class="descr">(ф.и.о.)</td>
												</tr>
											</tbody>
										</table>
									</td>
								</tr>
							</xsl:for-each>
						</tbody>
					</table>
				</div>
			</body>
		</html>
	</xsl:template>
	
	<xsl:template match="aor:Recipient">
		<xsl:for-each select="*">
			<xsl:if test="position()!=1">, </xsl:if>
			<xsl:variable name="ln" select="local-name()"/>
			<xsl:choose>
				<xsl:when test="$ln = 'INN'">ИНН</xsl:when>
				<xsl:when test="$ln = 'KPP'">КПП</xsl:when>
				<xsl:when test="$ln = 'PersonalAccountUFK'">л/с в УФК</xsl:when>
				<xsl:when test="$ln = 'BankName'">Банк</xsl:when>
				<xsl:when test="$ln = 'BICID'">БИК</xsl:when>
				<xsl:when test="$ln = 'CheckingAccount'">р/с</xsl:when>
				<xsl:when test="$ln = 'BeneficiaryAccount'">счет получателя</xsl:when>
				<xsl:when test="$ln = 'BCC'">КБК</xsl:when>
				<xsl:when test="$ln = 'OKTMO'">ОКТМО</xsl:when>
			</xsl:choose>
			<xsl:if test="position()!=1">
				<xsl:text>: </xsl:text>
			</xsl:if>
			<xsl:apply-templates select="."/>
		</xsl:for-each>
	</xsl:template>
	
	<xsl:template match="*" mode="roubles">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<span class="underline" style="display: inline-block; width:40mm; text-align: center;">
			<element xml_node="{$xpath_date}">
				<xsl:variable name="roubles_part" select="substring-before(., '.')"/>
				<xsl:choose>
					<xsl:when test="string-length($roubles_part) = 0">0</xsl:when>
					<xsl:otherwise><xsl:value-of select="$roubles_part"/></xsl:otherwise>
				</xsl:choose>
			</element>
		</span>
		<xsl:text> рублей</xsl:text>
	</xsl:template>
	<xsl:template match="*" mode="kopeikas">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<span class="underline" style="display: inline-block; width:40mm; text-align: center;">
			<element xml_node="{$xpath_date}">
				<xsl:variable name="kopeikas_part" select="substring-after(., '.')"/>
				<xsl:choose>
					<xsl:when test="string-length($kopeikas_part) = 0">00</xsl:when>
					<xsl:otherwise><xsl:value-of select="$kopeikas_part"/></xsl:otherwise>
				</xsl:choose>
			</element>
		</span>
		<xsl:text> копеек</xsl:text>
	</xsl:template>
	
	<xsl:template name="month_name_genitive">
		<xsl:param name="val"/>
		<xsl:choose>
			<xsl:when test="$val = 1">января</xsl:when>
			<xsl:when test="$val = 2">февраля</xsl:when>
			<xsl:when test="$val = 3">марта</xsl:when>
			<xsl:when test="$val = 4">апреля</xsl:when>
			<xsl:when test="$val = 5">мая</xsl:when>
			<xsl:when test="$val = 6">июня</xsl:when>
			<xsl:when test="$val = 7">июля</xsl:when>
			<xsl:when test="$val = 8">августа</xsl:when>
			<xsl:when test="$val = 9">сентября</xsl:when>
			<xsl:when test="$val = 10">октября</xsl:when>
			<xsl:when test="$val = 11">ноября</xsl:when>
			<xsl:when test="$val = 12">декабря</xsl:when>
			<xsl:otherwise><xsl:value-of select="$val"/></xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
	<xsl:template match="*" mode="month_name_genitive"><!-- месяц в родительном падеже -->
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<span style="display: inline-block; width:30mm;text-align:center;" class="underline">
			<element xml_node="{$xpath_date}">
				<xsl:call-template name="month_name_genitive"><xsl:with-param name="val" select="."/></xsl:call-template>
			</element>
		</span>
	</xsl:template>
	
	<xsl:template match="*" mode="month_name">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<span style="display: inline-block; width:30mm; text-aligh:center;" class="underline">
			<element xml_node="{$xpath_date}">
				<xsl:choose>
					<xsl:when test=". = 1">январь</xsl:when>
					<xsl:when test=". = 2">февраль</xsl:when>
					<xsl:when test=". = 3">март</xsl:when>
					<xsl:when test=". = 4">апрель</xsl:when>
					<xsl:when test=". = 5">май</xsl:when>
					<xsl:when test=". = 6">июнь</xsl:when>
					<xsl:when test=". = 7">июль</xsl:when>
					<xsl:when test=". = 8">август</xsl:when>
					<xsl:when test=". = 9">сентябрь</xsl:when>
					<xsl:when test=". = 10">октябрь</xsl:when>
					<xsl:when test=". = 11">ноябрь</xsl:when>
					<xsl:when test=". = 12">декабрь</xsl:when>
					<xsl:otherwise><xsl:value-of select="."/></xsl:otherwise>
				</xsl:choose>
			</element>
		</span>
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
	<xsl:template match="//*[local-name()='ActOfReconciliation']//*" priority="-1">
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
