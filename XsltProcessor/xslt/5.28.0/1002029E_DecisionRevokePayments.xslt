<?xml version="1.0" encoding="utf-8"?>
	<!-- 
Функциональные требования ГУФТДиТР 2018 № 00415 ФТ на ЛК и Задолженность по формам (пошлины) (приложение).tif Приложения 3, 5, 7, 8 
Приложение 3 Решение таможенного органа об отзыве инкассового поручения (DocType = РОИ) - УБРАН отсюда в версии 5.14.5 (переехал в DebtIncashANDCommission.xsd (OrderType=2, DocumentType=2) - Решение таможенного органа об отзыве инкассового поручения (поручения таможенного органа на перевод электронных денежных средств))
Приложение 5 Решение таможенного органа об отзыве поручения таможенного органа на перевод электронных денежных средств (DocType = РОП) - УБРАН отсюда в версии 5.14.5 (переехал в DebtIncashANDCommission.xsd (OrderType=2, DocumentType=2) - Решение таможенного органа об отзыве инкассового поручения (поручения таможенного органа на перевод электронных денежных средств))
Приказ ФТС России от 08.02.2019 г. № 211:
Приложение 6 Решение таможенного органа о приостановлении операций по счетам плательщика таможенных пошлин, налогов, специальных, антидемпинговых, компенсационных пошлин и переводов его электронных денежных средств (DocType = РПО)
Приложение 7 Решение таможенного органа об отмене приостановления операций по счетам (счету) плательщика таможенных пошлин, налогов, специальных, антидемпинговых, компенсационных пошлин и переводов его электронных денежных средств (DocType = РОПО)
С 01.01.2025 вступают в силу положения Федерального закона от 24.07.2023 № 340-ФЗ «О внесении изменений в отдельные законодательные акты Российской Федерации» (далее – Федеральный закон № 340) в части взыскания таможенных платежей, пеней за счет цифровых рублей, учитываемых на счете цифрового рубля плательщика (лица, несущего солидарную обязанность)» 
DocType = РПОЦ - Решение таможенного органа о приостановлении операций по счету цифрового рубля плательщика (DocType = РПОЦ)
DocType = РОПОЦ - Решение таможенного органа об отмене приостановления операций по счету цифрового рубля плательщика (DocType = РОПОЦ)
-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" xmlns:drp="urn:customs.ru:Information:CommercialFinanceDocuments:DecisionRevokePayments:5.24.0">
	<!-- Шаблон для типа DecisionRevokePaymentsType -->
	<xsl:template match="drp:DecisionRevokePayments">
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
			}

		</style>
			</head>
			<body>
				<div class="page">
					<table>
						<tbody align="left" class="graphMain">
							<!--tr  align="center" class="graphHeader">
						<td>РЕШЕНИЕ</td>
					</tr>
					<tr class="delim_3"><td> </td></tr-->
							<tr align="center">
								<td>
									<b>
										<xsl:choose>
											<xsl:when test="drp:DocType = 'РПО'">Решение таможенного органа о приостановлении операций по счетам плательщика (лица, несущего солидарную обязанность) в банке и переводов его электронных денежных средств</xsl:when>
											<xsl:when test="drp:DocType = 'РОПО'">Решение таможенного органа об отмене приостановления операций по счетам плательщика (лица, несущего солидарную обязанность) в банке и переводов его электронных денежных средств</xsl:when>
											<xsl:when test="drp:DocType = 'РПОЦ'">Решение таможенного органа о приостановлении операций по счету цифрового рубля</xsl:when>
											<xsl:when test="drp:DocType = 'РОПОЦ'">Решение таможенного органа об отмене приостановления операций по счету цифрового рубля</xsl:when>
											<xsl:otherwise>Решение&#160;<u>&#160;&#160;&#160;&#160;&#160;</u>
											</xsl:otherwise>
										</xsl:choose>
									</b>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<br/>
					<table>
						<tbody align="center" class="graphMain">
							<tr>
								<td width="3%" align="right">от&#160; </td>
								<td width="45%" align="left">
									<xsl:call-template name="Date">
										<xsl:with-param name="date" select="drp:DateDecision"/>
									</xsl:call-template>
								</td>
								<td width="12%" align="right">№&#160; </td>
								<td width="40%" class="border_bottom">
									<xsl:value-of select="drp:NumberDecision"/>
									<!--xsl:call-template name="DocNumber">
										<xsl:with-param name="DocumentReference" select="drp:DocumentReference"/>
										<xsl:with-param name="DocType" select="drp:DocType"/>
									</xsl:call-template-->
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<br/>
					<table>
						<tbody align="center" class="graphMain">
							<tr>
								<td class="border_bottom">
									<span class="normal">
										<xsl:value-of select="drp:DRP_Customs/drp:FullOfficeName"/>
									</span>
									<!--xsl:if test="drp:DRP_Customs/drp:FullOfficeName">
										<span class="normal"> (</span>
									</xsl:if>
									<span class="normal">
										<xsl:value-of select="drp:DRP_Customs/cat_ru:Code"/>
									</span>
									<xsl:if test="drp:DRP_Customs/drp:FullOfficeName">
										<span class="normal">)</span>
									</xsl:if-->
								</td>
							</tr>
							<tr class="graphLittle">
								<td align="center">(наименование таможенного органа)</td>
							</tr>
							<tr class="delim_3">
								<td> </td>
							</tr>
							<tr>
								<td align="left" style="text-align: justify;">
									<span class="normal">
										<xsl:choose>
											<xsl:when test="drp:DocType = 'РПО'">
												<xsl:text>в соответствии с </xsl:text>
												<u>&#160;&#160;
												<xsl:value-of select="drp:ParagraphNumber"/>
												&#160;&#160;</u>
												<sup>1</sup>
												<xsl:text>  статьи 77 Федерального закона от 3 августа 2018 г. №&#160;289-ФЗ "О таможенном регулировании в Российской Федерации </xsl:text>
												<xsl:text>и о внесении изменений в отдельные законодательные акты Российской Федерации" принимает решение:</xsl:text>
											</xsl:when>
											<xsl:when test="drp:DocType = 'РОПО'">
												<xsl:text>в соответствии со статьей 77 Федерального закона от 3 августа 2018 г. № 289-ФЗ "О таможенном регулировании в </xsl:text>
												<xsl:text>Российской Федерации и о внесении изменений в отдельные законодательные акты Российской Федерации" принимает решение:</xsl:text>
											</xsl:when>
											<xsl:when test="drp:DocType = 'РПОЦ' and drp:ParagraphNumber">
												<xsl:text>в соответствии с </xsl:text>
												<u>&#160;&#160;
												<xsl:value-of select="drp:ParagraphNumber"/>
												&#160;&#160;</u>
												<sup>1</sup>
												<xsl:text>  статьи 77 Федерального закона от 3 августа 2018 г. №&#160;289-ФЗ "О таможенном регулировании в Российской Федерации </xsl:text>
												<xsl:text>и о внесении изменений в отдельные законодательные акты Российской Федерации" принимает решение:</xsl:text>
											</xsl:when>
											<xsl:when test="drp:DocType = 'РОПОЦ' and drp:ParagraphNumber">
												<xsl:text>в соответствии с </xsl:text>
												<u>&#160;&#160;
												<xsl:value-of select="drp:ParagraphNumber"/>
												&#160;&#160;</u>
												<sup>1</sup>
												<xsl:text>  статьи 77 Федерального закона от 3 августа 2018 г. №&#160;289-ФЗ "О таможенном регулировании в Российской Федерации </xsl:text>
												<xsl:text>и о внесении изменений в отдельные законодательные акты Российской Федерации" принимает решение:</xsl:text>
											</xsl:when>
											<xsl:otherwise>причины решения:&#160;<u>&#160;&#160;&#160;&#160;&#160;</u></xsl:otherwise>
										</xsl:choose>
									</span>
								</td>
							</tr>
							<xsl:if test="drp:DocType = 'РОПО' or drp:DocType = 'РОПОЦ'">
								<tr>
									<td align="left" style="text-align: justify;">
										<span class="normal">
											Отменить решение таможенного органа о приостановлении операций
											<xsl:if test="drp:DocType = 'РОПО'"> по счетам плательщика (лица, несущего солидарную обязанность) в банке и переводов его электронных денежных средств</xsl:if>
											<xsl:if test="drp:DocType = 'РОПОЦ'"> по счету цифрового рубля</xsl:if> от&#160;
											<u>&#160;&#160;
												<xsl:call-template name="russian_date">
													<xsl:with-param name="dateIn" select="drp:DRP_Doc/drp:DRP_DocDate"/>
												</xsl:call-template>
												&#160;г.&#160;&#160;</u>&#160;№&#160;
											<u>&#160;&#160;
												<xsl:value-of select="drp:DRP_Doc/drp:DRP_DocNumber"/>
												<!--xsl:call-template name="DocNumber">
													<xsl:with-param name="DocumentReference" select="drp:DRP_Doc"/>
													<xsl:with-param name="DocType" select="'РПО'"/>
												</xsl:call-template-->&#160;&#160;
											</u>, выставленное к счетам (счету)
										</span>
									</td>
								</tr>
								<tr>
									<td class="border_bottom">
										<span class="normal">
											номер(а) счет(а/ов):
											<xsl:for-each select="drp:AccountInfoPayer">
												<xsl:value-of select="drp:BankAccount"/>
												<xsl:if test="position()!=last()">, </xsl:if>
											</xsl:for-each>
											; тип счет(а/ов): <xsl:apply-templates select="drp:AccountInfoPayer/drp:BankAccountDescription"/>
											<xsl:if test="drp:AccountInfoPayer/drp:CEMPId">
												; идентификатор КЭСП: <xsl:value-of select="drp:AccountInfoPayer/drp:CEMPId"/>
											</xsl:if>
										</span>
									</td>
								</tr>
								<tr class="graphLittle">
									<td align="center">
										<xsl:text>(указывается вид и номер счета плательщика (лица, несущего солидарную обязанность), реквизиты корпоративного электронного средства платежа плательщика (лица, несущего солидарную обязанность)</xsl:text>
									</td>
								</tr>
								<tr class="delim_3">
									<td> </td>
								</tr>
							</xsl:if>
							<tr class="delim">
								<td> </td>
							</tr>
							<tr>
								<td align="left">
									<span class="normal">
										<xsl:choose>
											<xsl:when test="drp:DocType = 'РПО' or drp:DocType = 'РПОЦ'">
												Приостановить в банке
											</xsl:when>
											<xsl:when test="drp:DocType = 'РОПО' or drp:DocType = 'РОПОЦ'">
												в банке
											</xsl:when>
										</xsl:choose>
									</span>
								</td>
							</tr>
							<tr>
								<td class="border_bottom">
									<span class="normal">
										<xsl:apply-templates select="drp:BankInfoPayer/drp:OrganizationName"/>
									</span>
									<xsl:if test="drp:BankInfoPayer/drp:BICID">
										<span class="normal">, БИК </span>
									</xsl:if>
									<span class="normal">
										<xsl:value-of select="drp:BankInfoPayer/drp:BICID"/>
									</span>
								</td>
							</tr>
							<tr class="graphLittle">
								<td align="center">
									<span>
										<xsl:text>(полное наименование, банковский идентификационный код)</xsl:text>
									</span>
								</td>
							</tr>
							<xsl:if test="drp:DocType = 'РПО' or drp:DocType = 'РПОЦ'">
								<tr>
									<td>
										<br/>
									</td>
								</tr>
								<tr>
									<td align="left">
										<span class="normal">по счетам (счету)</span>
									</td>
								</tr>
								<tr>
									<td class="border_bottom">
										<span class="normal">
											<xsl:if test="drp:AccountInfoPayer/drp:BankAccountDescription">
												<xsl:value-of select="drp:AccountInfoPayer/drp:BankAccountDescription"/>
												<xsl:text>, </xsl:text>
											</xsl:if>
											<xsl:value-of select="drp:AccountInfoPayer/drp:BankAccount"/>
										</span>
									</td>
								</tr>
								<tr class="graphLittle">
									<td align="center">
										<xsl:text>(указываются вид и номер счета </xsl:text>
										<xsl:if test="drp:DocType = 'РПО'">
											<xsl:text>плательщика (лица, несущего солидарную обязанность), реквизиты корпоративного электронного средства платежа плательщика (лица, несущего солидарную обязанность)</xsl:text>
										</xsl:if>
										<xsl:if test="drp:DocType = 'РПОЦ'">
											<xsl:text>цифрового рубля)</xsl:text>
										</xsl:if>
									</td>
								</tr>
								<tr class="delim_3">
									<td> </td>
								</tr>
							</xsl:if>
							<tr>
								<td align="left">
									<span class="normal">
										<xsl:text>открытым (открытому)</xsl:text>
									</span>
								</td>
							</tr>
							<tr>
								<td class="border_bottom">
									<span class="normal">
										<xsl:apply-templates select="drp:PayerInfo"/>
									</span>
								</td>
							</tr>
							<tr class="graphLittle">
								<td align="center">
									<xsl:text>(полное фирменное наименование организации или фамилия, имя, отчество (при наличии) плательщика (лица, несущего солидарную обязанность) индивидуального предпринимателя, идентификационный номер налогоплательщика)</xsl:text>
								</td>
							</tr>
							<tr class="delim_3">
								<td> </td>
							</tr>
							<xsl:if test="drp:DocType = 'РПО' or drp:DocType = 'РПОЦ'">
								<tr>
									<td align="left" style="text-align:justify">
										<br/>
										<span class="normal">
											все <xsl:if test="drp:DocType = 'РПО'">расходные </xsl:if>операции <xsl:if test="drp:DocType = 'РПОЦ'">с цифровыми рублями </xsl:if>на сумму&#160;
											<xsl:call-template name="inlinetable">
												<xsl:with-param name="data">
													<xsl:value-of select="translate(translate(format-number(drp:Amount, '#,###0.00'),',',' '),'.',',')"/>
												</xsl:with-param>
												<xsl:with-param name="description"/>
												<xsl:with-param name="width">40%</xsl:with-param>
												<xsl:with-param name="data_align">center</xsl:with-param>
											</xsl:call-template>
											&#160;рублей, за исключением операций по платежам, очередность исполнения которых в соответствии с гражданским законодательством Российской Федерации предшествует исполнению обязанности по уплате таможенных платежей, специальных, антидемпинговых, компенсационных пошлин, процентов и пеней.
										</span>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="drp:DocType = 'РОПО' or drp:DocType = 'РОПОЦ'">
								<tr>
									<td align="left">
										<br/>
										<span class="normal">
											в сумме&#160;
											<xsl:call-template name="inlinetable">
												<xsl:with-param name="data">
													<xsl:value-of select="translate(translate(format-number(drp:Amount, '#,###0.00'),',',' '),'.',',')"/>
												</xsl:with-param>
												<xsl:with-param name="description"/>
												<xsl:with-param name="width">40%</xsl:with-param>
												<xsl:with-param name="data_align">center</xsl:with-param>
											</xsl:call-template>
											&#160;рублей.
										</span>
									</td>
								</tr>
							</xsl:if>
							<tr>
								<td>
									<br/>
									<br/>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<table>
						<tr class="graphMain" align="center">
							<td width="41%" rowspan="2" align="left">
								<span class="normal">
									Начальник таможенного органа (или лицо, им уполномоченное)
								</span>
							</td>
							<td width="3%"> </td>
							<td width="15%" class="border_bottom"> </td>
							<td width="3%"> </td>
							<td width="38%" class="border_bottom">
								<span class="normal">
									<xsl:value-of select="drp:CustomsChief/drp:PersonSurname"/>&#160;
									<xsl:value-of select="concat(substring(drp:CustomsChief/drp:PersonName, 1, 1),'.')"/>
									<xsl:if test="drp:CustomsChief/drp:PersonMiddleName">
										<xsl:value-of select="concat(substring(drp:CustomsChief/drp:PersonMiddleName,1, 1), '.')"/>
									</xsl:if>
									<br/>
								</span>
							</td>
						</tr>
						<tr class="graphLittle" align="center">
							<td width="3%"> </td>
							<td width="15%">(подпись)</td>
							<td width="3%"> </td>
							<td width="38%">(фамилия, инициалы)</td>
						</tr>
					</table>
					<br/>
					<br/>
					<table>
						<tr class="graphMain" align="center">
							<td width="15%" align="left">
								<span class="normal">
									Исполнитель
								</span>
							</td>
							<td width="50%" class="border_bottom">
								<span class="normal">
									<xsl:apply-templates select="drp:Executor"/>
									<br/>
								</span>
							</td>
							<td width="35%"> </td>
						</tr>
						<tr class="graphLittle" align="center">
							<td width="15%"> </td>
							<td width="50%">(фамилия, инициалы должностного лица таможенного органа)</td>
							<td width="35%"> </td>
						</tr>
					</table>
					<xsl:if test="drp:DocType = 'РПО'">
						<br/>
						<table>
							<tr class="graphLittle" align="left">
								<td>
									<sup>1</sup>
									<xsl:text>Указывается номер пункта (при наличии) и части статьи 77 Федерального закона от 3 августа 2018 г. № 289-ФЗ </xsl:text>
									<xsl:text>"О таможенном регулировании в Российской Федерации и о внесении изменений в отдельные законодательные акты Российской Федерации".</xsl:text>
								</td>
							</tr>
						</table>
					</xsl:if>
				</div>
			</body>
		</html>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:OrganizationBaseType -->
	<xsl:template match="drp:PayerInfo|drp:BankName">
		<xsl:if test="drp:OrganizationName">
			<xsl:value-of select="drp:OrganizationName"/>
		</xsl:if>
		<xsl:if test="not(drp:OrganizationName) and drp:ShortName">
			<!--xsl:if test="string-length(drp:OrganizationName) &gt; 0">
				<span class="normal"> (</span>
			</xsl:if-->
			<xsl:value-of select="drp:ShortName"/>
			<!--xsl:if test="string-length(drp:OrganizationName) &gt; 0">
				<span class="normal">)</span>
			</xsl:if-->
		</xsl:if>
		<xsl:if test="string-length(drp:INN) &gt; 0 or string-length(drp:KPP) &gt; 0">
			<span class="normal">, </span>
			<span class="italic">
				<xsl:if test="string-length(drp:INN) &gt; 0">
					<span class="italic">ИНН</span>
				</xsl:if>
				<!--xsl:if test="string-length(drp:INN) &gt; 0 and string-length(drp:KPP) &gt; 0">
					<span class="normal">/</span>
				</xsl:if>
				<xsl:if test="string-length(drp:KPP) &gt; 0">
					<span class="italic">КПП</span>
				</xsl:if-->
				<span class="normal">: </span>
			</span>
		</xsl:if>
		<xsl:if test="drp:INN">
			<xsl:value-of select="drp:INN"/>
		</xsl:if>
		<!--xsl:if test="drp:KPP">
			<xsl:if test="string-length(drp:INN) &gt; 0">
				<span class="normal"> / </span>
			</xsl:if>
			<xsl:value-of select="drp:KPP"/>
		</xsl:if-->
		<!--xsl:apply-templates select="cat_ru:RFOrganizationFeatures"/>
		<xsl:apply-templates select="cat_ru:RKOrganizationFeatures"/>
		<xsl:apply-templates select="cat_ru:RBOrganizationFeatures"/>
		<xsl:apply-templates select="cat_ru:RAOrganizationFeatures"/>
		<xsl:apply-templates select="cat_ru:KGOrganizationFeatures"/-->
	</xsl:template>
	<!-- Шаблон для типа cat_ru:RFOrganizationFeaturesType -->
	<xsl:template match="cat_ru:RFOrganizationFeatures">
		<xsl:if test="string-length(cat_ru:INN) &gt; 0 or string-length(cat_ru:KPP) &gt; 0">
			<span class="normal">, </span>
			<span class="italic">
				<xsl:if test="string-length(cat_ru:INN) &gt; 0">
					<span class="italic">ИНН</span>
				</xsl:if>
				<xsl:if test="string-length(cat_ru:INN) &gt; 0 and string-length(cat_ru:KPP) &gt; 0">
					<span class="normal">/</span>
				</xsl:if>
				<xsl:if test="string-length(cat_ru:KPP) &gt; 0">
					<span class="italic">КПП</span>
				</xsl:if>
				<span class="normal">: </span>
			</span>
		</xsl:if>
		<xsl:if test="cat_ru:INN">
			<xsl:value-of select="cat_ru:INN"/>
		</xsl:if>
		<xsl:if test="cat_ru:KPP">
			<xsl:if test="string-length(cat_ru:INN) &gt; 0">
				<span class="normal"> / </span>
			</xsl:if>
			<xsl:value-of select="cat_ru:KPP"/>
		</xsl:if>
		<!--xsl:if test="cat_ru:OGRN">
		<span class="normal">, </span>
		<span class="italic">ОГРН</span>
		<span class="normal">: </span>
		<xsl:value-of select="cat_ru:OGRN" />
	</xsl:if-->
	</xsl:template>
	<!-- Шаблон для типа cat_ru:RKOrganizationFeatures -->
	<xsl:template match="cat_ru:RKOrganizationFeatures">
		<xsl:if test="cat_ru:BIN">
			<span class="normal">, </span>
			<span class="italic">БИН</span>
			<span class="normal">: </span>
			<xsl:value-of select="cat_ru:BIN"/>
		</xsl:if>
		<xsl:if test="cat_ru:IIN">
			<xsl:if test="string-length(cat_ru:BIN) &gt; 0">
				<span class="normal"> / </span>
			</xsl:if>
			<xsl:if test="string-length(cat_ru:BIN) = 0">
				<span class="normal">, </span>
			</xsl:if>
			<span class="italic">ИИН</span>
			<span class="normal">: </span>
			<xsl:value-of select="cat_ru:IIN"/>
		</xsl:if>
		<xsl:if test="cat_ru:ITN">
			<span class="normal">, </span>
			<span class="italic">ИТН</span>
			<span class="normal">: </span>
			<xsl:value-of select="cat_ru:CategoryCode"/>
			<span class="normal"> / </span>
			<xsl:value-of select="cat_ru:KATOCode"/>
			<xsl:if test="cat_ru:RNN">
				<span class="normal"> / </span>
				<xsl:value-of select="cat_ru:RNN"/>
			</xsl:if>
			<xsl:if test="cat_ru:ITNReserv">
				<span class="normal"> / </span>
				<xsl:value-of select="cat_ru:ITNReserv"/>
			</xsl:if>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:RBOrganizationFeatures -->
	<xsl:template match="cat_ru:RBOrganizationFeatures">
		<xsl:if test="cat_ru:UNP">
			<span class="normal">, </span>
			<span class="italic">УНП</span>
			<span class="normal">: </span>
			<xsl:value-of select="cat_ru:UNP"/>
		</xsl:if>
		<xsl:if test="cat_ru:RBIdentificationNumber">
			<span class="normal">, </span>
			<span class="italic">ИНФЛ</span>
			<span class="normal">: </span>
			<xsl:value-of select="cat_ru:RBIdentificationNumber"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:RAOrganizationFeatures -->
	<xsl:template match="cat_ru:RAOrganizationFeatures">
		<xsl:if test="cat_ru:UNN">
			<span class="normal">, </span>
			<span class="italic">УНН</span>
			<span class="normal">: </span>
			<xsl:value-of select="cat_ru:UNN"/>
		</xsl:if>
		<xsl:if test="cat_ru:SocialServiceNumber">
			<span class="normal">, </span>
			<span class="italic">НЗОУ</span>
			<span class="normal">: </span>
			<xsl:value-of select="cat_ru:SocialServiceNumber"/>
		</xsl:if>
		<xsl:if test="cat_ru:SocialServiceCertificate">
			<span class="normal">, </span>
			<span class="italic">№ справки об отсутв. НЗОУ</span>
			<span class="normal">: </span>
			<xsl:value-of select="cat_ru:SocialServiceCertificate"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:KGOrganizationFeatures -->
	<xsl:template match="cat_ru:KGOrganizationFeatures">
		<xsl:if test="cat_ru:KGINN">
			<span class="italic">, ИНН(ПИН)</span>
			<span class="normal">: </span>
			<xsl:value-of select="cat_ru:KGINN"/>
		</xsl:if>
		<xsl:if test="cat_ru:KGOKPO">
			<span class="italic">, ОКПО</span>
			<span class="normal">: </span>
			<xsl:value-of select="cat_ru:KGOKPO"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа drp:ExecutoType -->
	<xsl:template match="drp:Executor">
		<span class="normal">
			<!--xsl:if test="drp:PersonPost">
				<xsl:value-of select="drp:PersonPost"/>,&#160;
			</xsl:if-->
			<xsl:value-of select="drp:PersonSurname"/>&#160;
			<xsl:value-of select="concat(substring(drp:PersonName, 1, 1), '.')"/>
			<xsl:if test="drp:PersonMiddleName">
				<xsl:value-of select="concat(substring(drp:PersonMiddleName, 1, 1), '.')"/>
			</xsl:if>
			<xsl:if test="drp:Phone">
				<xsl:text>, тел: </xsl:text><xsl:value-of select="drp:Phone"/>
			</xsl:if>
		</span>
	</xsl:template>
	<!-- Шаблон для типа drp:DRP_DocumentReferenceType -->
	<xsl:template name="DocNumber">
		<xsl:param name="DocumentReference"/>
		<xsl:param name="DocType"/>
		<span class="normal">
			<xsl:value-of select="$DocumentReference/drp:CustomsCode"/>/<xsl:value-of select="$DocumentReference/drp:RegistrationYear"/>/<xsl:value-of select="$DocType"/>/<xsl:value-of select="$DocumentReference/drp:DocNumber"/>
		</span>
	</xsl:template>
	<xsl:template name="russian_date">
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<span class="normal">
					<xsl:value-of select="substring($dateIn,9,2)"/>
				</span>
				<span class="normal">.</span>
				<span class="normal">
					<xsl:value-of select="substring($dateIn,6,2)"/>
				</span>
				<span class="normal">.</span>
				<span class="normal">
					<xsl:value-of select="substring($dateIn,1,4)"/>
				</span>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dateIn"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="Date">
		<xsl:param name="date"/>
		<table>
			<tbody align="center" class="graphMain">
				<tr>
					<td width="2%" align="right">" </td>
					<td width="13%" class="border_bottom">
						<xsl:value-of select="substring($date,9,2)"/>
					</td>
					<td width="2%" align="left"> "</td>
					<td width="3%"> </td>
					<td width="58%" class="border_bottom">
						<xsl:variable name="month" select="substring($date, 6, 2)"/>
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
					<td width="2%" align="right">20</td>
					<td width="9%" class="border_bottom" align="left">
						<xsl:value-of select="substring($date,3,2)"/>
					</td>
					<td width="4%"> </td>
					<td width="2%"> г.</td>
				</tr>
			</tbody>
		</table>
	</xsl:template>
	<xsl:template name="inlinetable">
		<xsl:param name="data"/>
		<xsl:param name="description"/>
		<xsl:param name="width"/>
		<xsl:param name="data_align"/>
		<table class="inlinetable" style="width: {$width};">
			<tbody>
				<tr align="{$data_align}" style="align: {$data_align};">
					<!--да, выравнивание дважды, нужно для кроссплатформенности-->
					<td class="border_bottom">
						<xsl:value-of select="$data"/>
						<br/>
					</td>
				</tr>
				<tr align="center">
					<td class="graphLittle">
						<xsl:value-of select="$description"/>
					</td>
				</tr>
			</tbody>
		</table>
	</xsl:template>
</xsl:stylesheet>
