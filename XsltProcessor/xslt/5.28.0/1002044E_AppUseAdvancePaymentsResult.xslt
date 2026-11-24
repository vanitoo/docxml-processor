<?xml version="1.0" encoding="UTF-8"?>
<!--НПА для формы нет. Ответ на AppUseAdvancePayments
Ответ на заявление лица, внесшего авансовые платежи, об использовании авансовых платежей в связи с получением уведомления (уточнения к уведомлению) о не уплаченных в установленный срок суммах таможенных платежей, специальных, антидемпинговых, компенсационных пошлин, процентов и пеней -->
<xsl:stylesheet exclude-result-prefixes="cat_ru auapr" version="1.0" xmlns:auapr="urn:customs.ru:Information:CommercialFinanceDocuments:AppUseAdvancePaymentsResult:5.24.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output encoding="utf-8" indent="yes" method="html" version="1.0"/>
	<xsl:template match="/">
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="auapr:AppUseAdvancePaymentsResult">
		<html>
			<META CONTENT="text/html; charset=UTF-8" HTTP-EQUIV="Content-Type"/>
			<style type="text/css">
					body {
					background: #cccccc;
					/*font-family: Arial;*/
					font-size: 11pt;
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
					padding: 10mm;
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
					margin: 0;
					font-size: 11pt;
					font-family: Arial;
					}

					/*table.border tr td
					{
					border: 1px solid gray;
					}*/

					.graph {
					font-family: Arial;
					font-size: 10pt;
					}

					.value
					{
					border-bottom: solid 1px black;
					font-style: Italic;
					}

					div.title, tr.title td { font-weight:bold;  }
					.bordered { border-collapse: collapse; }
					/*td.bordered
					{
					border: solid 1px windowtext;
					}*/

					td.graphMain
					{
					vertical-align:top;
					font-size: 10pt;
					}

					.graphHeader
					{
					vertical-align:top;
					font-size: 12pt;
					font-family: Arial;
					text-align: center;
					}					

					.graphLittle 
					{						
					font-family: Arial;						
					font-size: 7pt;
					text-align: center;
					vertical-align:top;
					}

					.bordered{
					border-collapse: collapse;
					border: 1px solid black;
					}

					.footnote{
					font-family: Arial;						
					font-size: 7pt;
					text-align: left;
					}

					.delim_3 {
					height: 3pt;
					}

                    </style>
			<body>
				<div class="page">
					<table class="grahpMain" width="100%">
						<tbody>
							<tr>
								<td>
									<table class="grahpMain" width="100%">
										<tbody>
											<tr>
												<td width="48%"/>
												<td width="2%"/>
												<td align="center" class="value" width="50%">
													<xsl:value-of select="auapr:Customs/cat_ru:OfficeName"/>
													<xsl:if test="auapr:Customs/cat_ru:OfficeName"> (</xsl:if>
													<xsl:value-of select="auapr:Customs/cat_ru:Code"/>
													<xsl:if test="auapr:Customs/cat_ru:OfficeName">)</xsl:if>
												</td>
											</tr>
											<tr>
												<td/>
												<td/>
												<td class="graphLittle" align="center">(наименование таможенного органа)</td>
											</tr>
											<tr>
												<td colspan="3" class="delim_3">
													<br/>
												</td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
							<tr align="center" class="graphHeader">
								<td>
									<b>Ответ на заявление лица, внесшего авансовые платежи, об использовании авансовых платежей в связи с получением уведомления (уточнения к уведомлению) о не уплаченных в установленный срок суммах таможенных платежей, специальных, антидемпинговых, компенсационных пошлин, процентов и пеней</b>
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
											<xsl:if test="auapr:AppInNumber">
												<tr>
													<td width="35%">
														<xsl:text>Поступившие реквизиты заявления</xsl:text>
													</td>
													<td width="65%">
														<xsl:if test="auapr:AppInNumber/cat_ru:PrDocumentDate"> от <xsl:call-template name="text_date">
																<xsl:with-param name="date" select="auapr:AppInNumber/cat_ru:PrDocumentDate"/>
															</xsl:call-template>
														</xsl:if>
														<xsl:if test="auapr:AppInNumber/cat_ru:PrDocumentNumber"> № <span class="value">
																<xsl:value-of select="auapr:AppInNumber/cat_ru:PrDocumentNumber"/>
															</span>
														</xsl:if>
													</td>
												</tr>
											</xsl:if>
											<xsl:if test="auapr:AppRegNumber">
												<tr>
													<td width="35%">
														<xsl:text>Реквизиты заявления, присвоенные в ОТП</xsl:text>
													</td>
													<td width="65%">
														<xsl:if test="auapr:AppRegNumber/cat_ru:PrDocumentDate"> от <xsl:call-template name="text_date">
																<xsl:with-param name="date" select="auapr:AppRegNumber/cat_ru:PrDocumentDate"/>
															</xsl:call-template>
														</xsl:if>
														<xsl:if test="auapr:AppRegNumber/cat_ru:PrDocumentNumber"> № <span class="value">
																<xsl:value-of select="auapr:AppRegNumber/cat_ru:PrDocumentNumber"/>
															</span>
														</xsl:if>
													</td>
												</tr>
											</xsl:if>
										</tbody>
									</table>
								</td>
							</tr>
							<tr>
								<td class="delim_3">
									<br/>
								</td>
							</tr>
							<xsl:choose>
								<xsl:when test="auapr:AppStatus='0'">
									<tr>
										<td style="text-indent: 5%; text-align:justify">
											<xsl:text>По результатам рассмотрения заявления лица, внесшего авансовые платежи, об использовании авансовых платежей в связи с получением уведомления (уточнения к уведомлению) о не уплаченных в установленный срок суммах таможенных платежей, специальных, антидемпинговых, компенсационных пошлин, процентов и пеней,  принято решение использовать в счет уплаты сумм таможенных платежей, специальных, антидемпинговых, компенсационных пошлин, процентов и пеней авансовые платежи, перечисленые на счет Федералього казначейства, и отраженные на лицевом счете:</xsl:text>
										</td>
									</tr>
									<tr>
										<td class="delim_3">
											<br/>
										</td>
									</tr>
									<xsl:if test="auapr:AdvancePaymentUsed">
										<tr>
											<td>
												<table class="grahpMain" width="100%">
													<tbody>
														<tr>
															<td width="4%"/>
															<td width="20%"/>
															<td width="38%"/>
															<td width="38%"/>
														</tr>
														<tr>
															<td class="bordered" align="center" rowspan="2">№</td>
															<td class="bordered" align="center" colspan="3">Сведения об использовании авансовых платежей</td>
														</tr>
														<tr>
															<td class="bordered" align="center">Код вида платежа</td>
															<td class="bordered" align="center">Сумма по заявлению, рубли</td>
															<td class="bordered" align="center">Сумма зачтенная в счет уплаты по уведомлению, рубли</td>
														</tr>
														<xsl:for-each select="auapr:AdvancePaymentUsed">
															<tr>
																<td class="bordered" align="center">
																	<xsl:value-of select="position()"/>
																</td>
																<td class="bordered" align="center">
																	<xsl:value-of select="auapr:PaymentModeCode"/>
																</td>
																<td class="bordered" align="right" style="padding-right: 10pt">
																	<xsl:value-of select="translate(translate(format-number(auapr:AppAmount, '#,###.00'),',',' '),'.',',')"/>
																</td>
																<td class="bordered" align="right" style="padding-right: 10pt">
																	<xsl:value-of select="translate(translate(format-number(auapr:UsedAmount, '#,###.00'),',',' '),'.',',')"/>
																</td>
															</tr>
														</xsl:for-each>
													</tbody>
												</table>
											</td>
										</tr>
									</xsl:if>
									<tr>
										<td class="delim_3">
											<br/>
										</td>
									</tr>
								</xsl:when>
								<xsl:when test="auapr:AppStatus='1'">
									<tr>
										<td style="text-indent: 5%; text-align:justify">
											<xsl:text>По результатам рассмотрения заявления лица, внесшего авансовые платежи, об использовании авансовых платежей в связи с получением уведомления (уточнения к уведомлению) о не уплаченных в установленный срок суммах таможенных платежей, специальных, антидемпинговых, компенсационных пошлин, процентов и пеней,  принято решение о невозможности использовать  авансовые платежи в счет уплаты сумм таможенных платежей, специальных, антидемпинговых, компенсационных пошлин, процентов и пеней по причине:</xsl:text>
										</td>
									</tr>
									<tr>
										<td class="delim_3"/>
									</tr>
									<tr>
										<td class="value">
											<xsl:value-of select="auapr:RefusalReason"/>
										</td>
									</tr>
								</xsl:when>
								<xsl:when test="auapr:AppStatus='2'">
									<tr>
										<td style="text-indent: 5%; text-align:justify">
											<xsl:text>По результатам рассмотрения заявления лица, внесшего авансовые платежи, об использовании авансовых платежей в связи с получением уведомления (уточнения к уведомлению) о не уплаченных в установленный срок суммах таможенных платежей, специальных, антидемпинговых, компенсационных пошлин, процентов и пеней,  принято решение о резервировании денежных средств.</xsl:text>
										</td>
									</tr>
								</xsl:when>
							</xsl:choose>
							<tr>
								<td class="delim_3">
									<br/>
									<br/>
								</td>
							</tr>
							<tr>
								<td>
									<table class="grahpMain" width="100%">
										<tbody>
											<tr>
												<td class="value" width="35%"/>
												<td width="25%"/>
												<td class="value" align="center" width="40%">
													<xsl:apply-templates select="auapr:CustPersSignature"/>
												</td>
											</tr>
											<tr>
												<td class="graphLittle">(подпись должностного лица таможенного органа)</td>
												<td/>
												<td class="graphLittle">(должность, фамилия, инициалы должностного лица таможенного органа)</td>
											</tr>
											<tr>
												<td colspan="2" class="delim_3">
													<br/>
													<br/>
												</td>
											</tr>
											<xsl:if test="auapr:CustPersSignature/cat_ru:IssueDate">
												<tr>
													<td colspan="2"/>
													<td>
														<xsl:call-template name="text_date">
															<xsl:with-param select="auapr:CustPersSignature/cat_ru:IssueDate" name="date"/>
														</xsl:call-template>
													</td>
												</tr>
											</xsl:if>
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
	<xsl:template name="russian_date">
		<xsl:param name="dateIn"/>
		<xsl:value-of select="substring ($dateIn, 9, 2)"/>
		<xsl:text>.</xsl:text>
		<xsl:value-of select="substring($dateIn, 6, 2)"/>
		<xsl:text>.</xsl:text>
		<xsl:value-of select="substring($dateIn, 1, 4)"/>
	</xsl:template>
	<xsl:template name="gtd_date">
		<xsl:param name="dateIn"/>
		<xsl:value-of select="substring ($dateIn, 9, 2)"/>
		<xsl:text/>
		<xsl:value-of select="substring($dateIn, 6, 2)"/>
		<xsl:text/>
		<xsl:value-of select="substring($dateIn, 3, 2)"/>
	</xsl:template>
	<xsl:template match="auapr:CustPersSignature">
		<xsl:if test="cat_ru:PersonPost">
			<xsl:value-of select="cat_ru:PersonPost"/>
			<xsl:text>, </xsl:text>
		</xsl:if>
		<xsl:for-each select="cat_ru:PersonSurname|cat_ru:PersonName|cat_ru:PersonMiddleName">
			<xsl:value-of select="."/>
			<xsl:if test="position()!=last()">
				<xsl:text> </xsl:text>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>
	<xsl:template mode="DTNumber" match="*">
		<xsl:value-of select="cat_ru:CustomsCode"/>
		<xsl:text>/</xsl:text>
		<xsl:call-template name="gtd_date">
			<xsl:with-param name="dateIn" select="cat_ru:RegistrationDate"/>
		</xsl:call-template>
		<xsl:text>/</xsl:text>
		<xsl:value-of select="cat_ru:GTDNumber"/>
	</xsl:template>
	<xsl:template name="text_date">
		<xsl:param name="date"/>«<span class="value">&#160;<xsl:value-of select="substring($date,9,2)"/>&#160;</span>
		<xsl:variable name="month" select="substring($date, 6, 2)"/>»&#160;<span class="value">&#160;<xsl:choose>
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
			</xsl:choose>&#160;</span>&#160;<xsl:value-of select="substring($date,1,2)"/>
		<span class="value">
			<xsl:value-of select="substring($date,3,2)"/>
		</span> г.</xsl:template>
</xsl:stylesheet>
