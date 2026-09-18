<?xml version="1.0" encoding="utf-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html" standalone="yes" indent="yes" />
	<xsl:key name="species" match="Pokemon" use="Rasse/Name" />
	<!-- ===================================================== -->
	<!-- Generationen                                           -->
	<!-- Obere ID-Grenze je Generation. Neue Generation (z.B.   -->
	<!-- Generation 10) hinzufügen:                             -->
	<!--  1) hier eine weitere genMaxN-Variable ergänzen         -->
	<!--  2) im Template "get-generation" den auskommentierten   -->
	<!--     xsl:when-Block für die neue Generation aktivieren   -->
	<!--  3) im Template "gen-stats" die auskommentierte         -->
	<!--     cumN-Variable und den letzten xsl:if-Block aktivieren -->
	<!-- ===================================================== -->
	<xsl:variable name="genMax1">151</xsl:variable>
	<xsl:variable name="genMax2">251</xsl:variable>
	<xsl:variable name="genMax3">386</xsl:variable>
	<xsl:variable name="genMax4">493</xsl:variable>
	<xsl:variable name="genMax5">649</xsl:variable>
	<xsl:variable name="genMax6">721</xsl:variable>
	<xsl:variable name="genMax7">809</xsl:variable>
	<xsl:variable name="genMax8">905</xsl:variable>
	<xsl:variable name="genMax9">1025</xsl:variable>
	<!-- Generation 10: <xsl:variable name="genMax10">....</xsl:variable> -->

	<!-- Liefert die Generationsnummer für eine übergebene Rasse/ID -->
	<xsl:template name="get-generation">
		<xsl:param name="id"/>
		<xsl:choose>
			<xsl:when test="number($id) &lt;= $genMax1">1</xsl:when>
			<xsl:when test="number($id) &lt;= $genMax2">2</xsl:when>
			<xsl:when test="number($id) &lt;= $genMax3">3</xsl:when>
			<xsl:when test="number($id) &lt;= $genMax4">4</xsl:when>
			<xsl:when test="number($id) &lt;= $genMax5">5</xsl:when>
			<xsl:when test="number($id) &lt;= $genMax6">6</xsl:when>
			<xsl:when test="number($id) &lt;= $genMax7">7</xsl:when>
			<xsl:when test="number($id) &lt;= $genMax8">8</xsl:when>
			<xsl:when test="number($id) &lt;= $genMax9">9</xsl:when>
			<!-- Generation 10: <xsl:when test="number($id) &lt;= $genMax10">10</xsl:when> -->
			<xsl:otherwise>?</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<!-- Liefert die Generationen-Anzeige (Badges + gestapelter Balken) für eine übergebene Pokemon-Knotenmenge -->
	<xsl:template name="gen-stats">
		<xsl:param name="pokemons" select="/.."/>
		<xsl:variable name="total" select="count($pokemons)"/>
		<xsl:if test="$total &gt; 0">
			<xsl:variable name="cum1" select="count($pokemons[number(Rasse/ID) &lt;= $genMax1])"/>
			<xsl:variable name="cum2" select="count($pokemons[number(Rasse/ID) &lt;= $genMax2])"/>
			<xsl:variable name="cum3" select="count($pokemons[number(Rasse/ID) &lt;= $genMax3])"/>
			<xsl:variable name="cum4" select="count($pokemons[number(Rasse/ID) &lt;= $genMax4])"/>
			<xsl:variable name="cum5" select="count($pokemons[number(Rasse/ID) &lt;= $genMax5])"/>
			<xsl:variable name="cum6" select="count($pokemons[number(Rasse/ID) &lt;= $genMax6])"/>
			<xsl:variable name="cum7" select="count($pokemons[number(Rasse/ID) &lt;= $genMax7])"/>
			<xsl:variable name="cum8" select="count($pokemons[number(Rasse/ID) &lt;= $genMax8])"/>
			<xsl:variable name="cum9" select="count($pokemons[number(Rasse/ID) &lt;= $genMax9])"/>
			<!-- Generation 10: <xsl:variable name="cum10" select="count($pokemons[number(Rasse/ID) &lt;= $genMax10])"/> -->

			<!-- Zeile 1: Badges -->
			<span class="gen-badges">
				<xsl:if test="$cum1 &gt; 0">
					<span class="gen-badge gen01">Gen 01: <xsl:value-of select="$cum1"/> (<xsl:value-of select="format-number($cum1 div $total * 100,'0')"/>%)</span>
				</xsl:if>
				<xsl:if test="$cum2 &gt; $cum1">
					<span class="gen-badge gen02">Gen 02: <xsl:value-of select="$cum2 - $cum1"/> (<xsl:value-of select="format-number(($cum2 - $cum1) div $total * 100,'0')"/>%)</span>
				</xsl:if>
				<xsl:if test="$cum3 &gt; $cum2">
					<span class="gen-badge gen03">Gen 03: <xsl:value-of select="$cum3 - $cum2"/> (<xsl:value-of select="format-number(($cum3 - $cum2) div $total * 100,'0')"/>%)</span>
				</xsl:if>
				<xsl:if test="$cum4 &gt; $cum3">
					<span class="gen-badge gen04">Gen 04: <xsl:value-of select="$cum4 - $cum3"/> (<xsl:value-of select="format-number(($cum4 - $cum3) div $total * 100,'0')"/>%)</span>
				</xsl:if>
				<xsl:if test="$cum5 &gt; $cum4">
					<span class="gen-badge gen05">Gen 05: <xsl:value-of select="$cum5 - $cum4"/> (<xsl:value-of select="format-number(($cum5 - $cum4) div $total * 100,'0')"/>%)</span>
				</xsl:if>
				<xsl:if test="$cum6 &gt; $cum5">
					<span class="gen-badge gen06">Gen 06: <xsl:value-of select="$cum6 - $cum5"/> (<xsl:value-of select="format-number(($cum6 - $cum5) div $total * 100,'0')"/>%)</span>
				</xsl:if>
				<xsl:if test="$cum7 &gt; $cum6">
					<span class="gen-badge gen07">Gen 07: <xsl:value-of select="$cum7 - $cum6"/> (<xsl:value-of select="format-number(($cum7 - $cum6) div $total * 100,'0')"/>%)</span>
				</xsl:if>
				<xsl:if test="$cum8 &gt; $cum7">
					<span class="gen-badge gen08">Gen 08: <xsl:value-of select="$cum8 - $cum7"/> (<xsl:value-of select="format-number(($cum8 - $cum7) div $total * 100,'0')"/>%)</span>
				</xsl:if>
				<xsl:if test="$cum9 &gt; $cum8">
					<span class="gen-badge gen09">Gen 09: <xsl:value-of select="$cum9 - $cum8"/> (<xsl:value-of select="format-number(($cum9 - $cum8) div $total * 100,'0')"/>%)</span>
				</xsl:if>
				<!-- Generation 10:
				<xsl:if test="$cum10 &gt; $cum9">
					<span class="gen-badge gen10">Gen 10: <xsl:value-of select="$cum10 - $cum9"/> (<xsl:value-of select="format-number(($cum10 - $cum9) div $total * 100,'0')"/>%)</span>
				</xsl:if>
				-->
			</span>
			<br/>
			<!-- Zeile 2: gestapelter Balken -->
			<span class="gen-bar">
				<xsl:if test="$cum1 &gt; 0">
					<span class="gen01" style="width:{format-number($cum1 div $total * 100,'0.##')}%" title="{concat('Gen 01: ',$cum1,' (',format-number($cum1 div $total * 100,'0'),'%)')}"></span>
				</xsl:if>
				<xsl:if test="$cum2 &gt; $cum1">
					<span class="gen02" style="width:{format-number(($cum2 - $cum1) div $total * 100,'0.##')}%" title="{concat('Gen 02: ',$cum2 - $cum1,' (',format-number(($cum2 - $cum1) div $total * 100,'0'),'%)')}"></span>
				</xsl:if>
				<xsl:if test="$cum3 &gt; $cum2">
					<span class="gen03" style="width:{format-number(($cum3 - $cum2) div $total * 100,'0.##')}%" title="{concat('Gen 03: ',$cum3 - $cum2,' (',format-number(($cum3 - $cum2) div $total * 100,'0'),'%)')}"></span>
				</xsl:if>
				<xsl:if test="$cum4 &gt; $cum3">
					<span class="gen04" style="width:{format-number(($cum4 - $cum3) div $total * 100,'0.##')}%" title="{concat('Gen 04: ',$cum4 - $cum3,' (',format-number(($cum4 - $cum3) div $total * 100,'0'),'%)')}"></span>
				</xsl:if>
				<xsl:if test="$cum5 &gt; $cum4">
					<span class="gen05" style="width:{format-number(($cum5 - $cum4) div $total * 100,'0.##')}%" title="{concat('Gen 05: ',$cum5 - $cum4,' (',format-number(($cum5 - $cum4) div $total * 100,'0'),'%)')}"></span>
				</xsl:if>
				<xsl:if test="$cum6 &gt; $cum5">
					<span class="gen06" style="width:{format-number(($cum6 - $cum5) div $total * 100,'0.##')}%" title="{concat('Gen 06: ',$cum6 - $cum5,' (',format-number(($cum6 - $cum5) div $total * 100,'0'),'%)')}"></span>
				</xsl:if>
				<xsl:if test="$cum7 &gt; $cum6">
					<span class="gen07" style="width:{format-number(($cum7 - $cum6) div $total * 100,'0.##')}%" title="{concat('Gen 07: ',$cum7 - $cum6,' (',format-number(($cum7 - $cum6) div $total * 100,'0'),'%)')}"></span>
				</xsl:if>
				<xsl:if test="$cum8 &gt; $cum7">
					<span class="gen08" style="width:{format-number(($cum8 - $cum7) div $total * 100,'0.##')}%" title="{concat('Gen 08: ',$cum8 - $cum7,' (',format-number(($cum8 - $cum7) div $total * 100,'0'),'%)')}"></span>
				</xsl:if>
				<xsl:if test="$cum9 &gt; $cum8">
					<span class="gen09" style="width:{format-number(($cum9 - $cum8) div $total * 100,'0.##')}%" title="{concat('Gen 09: ',$cum9 - $cum8,' (',format-number(($cum9 - $cum8) div $total * 100,'0'),'%)')}"></span>
				</xsl:if>
				<!-- Generation 10:
				<xsl:if test="$cum10 &gt; $cum9">
					<span class="gen10" style="width:{format-number(($cum10 - $cum9) div $total * 100,'0.##')}%" title="{concat('Gen 10: ',$cum10 - $cum9,' (',format-number(($cum10 - $cum9) div $total * 100,'0'),'%)')}"></span>
				</xsl:if>
				-->
			</span>
		</xsl:if>
	</xsl:template>
	<xsl:template match="/">
		<html>
			<head>
				<meta name="viewport" content="width=device-width, initial-scale=1.0" />
				<style>
					*{box-sizing:border-box}
					html{scroll-behavior:auto}
					body{margin:0;padding:20px;background:#f3f4f6;color:#202124;font-family:Arial,Helvetica,sans-serif}
					a{color:#315f8c}
					/* ===================================================== */
					/* Navigation */
					/* ===================================================== */
					.part-control{
					z-index:500;
					background:#fff;
					border:solid #d0d4d9 1px;
					border-radius:8px;
					padding:10px 15px;
					margin-bottom:10px;
					box-shadow:0 2px 6px rgba(0,0,0,.08)
					}
					.part-navigation{
					display:inline-flex;
					align-items:center;
					gap:10px;
					margin-left:20px
					}
					.part-navigation a{
					border:1px solid #bbb;
					border-radius:5px;
					background:#f1f3f5;
					padding:4px 12px;
					font-size:16px;
					cursor:pointer;
					text-decoration:none;
					color:#202124
					}
					.part-navigation a:hover{
					background:#e1e4e7
					}
					.team-navigation{
					display:inline-flex;
					flex-wrap:wrap;
					align-items:center;
					gap:6px 8px;
					margin-left:20px
					}
					.team-navigation a{
					border:1px solid #bbb;
					border-radius:5px;
					background:#f1f3f5;
					padding:4px 10px;
					font-size:15px;
					cursor:pointer;
					text-decoration:none;
					color:#202124
					}
					.team-navigation a:hover{
					background:#e1e4e7
					}
					/* ===================================================== */
					/* Teile */
					/* ===================================================== */
					.page-part{
					display:block
					}
					#part-statistik{
					display:block
					}
					.trainer-part{
					display:none
					}
					.trainer-part:target{
					display:block
					}
					body:has(#alle:target) .trainer-part{
					display:block
					}
					body:has(.trainer-part:target) #part-statistik{
					display:none
					}
					body:has(#alle:target) #part-statistik{
					display:block
					}
					/* ===================================================== */
					/* Statistiken */
					/* ===================================================== */
					.statistics-container{
					display:flex;
					flex-wrap:wrap;
					align-items:flex-start;
					gap:20px;
					margin-bottom:10px
					}
					.statistics{
					border:solid #d0d4d9 1px;
					border-radius:8px;
					padding:10px 20px;
					background:#fff;
					box-shadow:0 2px 6px rgba(0,0,0,.08)
					}
					.statistics h1{
					margin-top:0;
					margin-bottom:10px
					}
					.statistics p{
					margin:3px 0
					}
					.statistics .record{
					margin-top:10px
					}
					.statistics .record:first-of-type{
					margin-top:12px
					}
					.statistics .record-value{
					padding-left:20px
					}
					.game-statistics{
					border:solid #d0d4d9 1px;
					border-collapse:separate;
					border-spacing:0;
					border-radius:8px;
					overflow:hidden;
					background:#fff;
					box-shadow:0 2px 6px rgba(0,0,0,.08)
					}
					.game-statistics th,
					.game-statistics td{
					border-bottom:solid #d0d4d9 1px;
					padding:7px 10px;
					text-align:left
					}
					.game-statistics th{
					font-weight:bold;
					background:#e9ecef
					}
					.game-statistics tr:last-child td{
					border-bottom:0
					}
					.game-statistics .sum{
					font-weight:bold;
					background:#f1f3f5
					}
					.game-statistics td.max{
					font-weight:bold;
					background:#e1e4e7
					}
					.game-statistics td.gen-cell{
					font-size:12px;
					color:#444
					}
					/* ===================================================== */
					/* Generations-Statistiken (Badges + Balken)              */
					/* ===================================================== */
					.gen-box{
					margin-top:10px;
					margin-bottom:14px
					}
					.gen-badges{
					display:inline-flex;
					flex-wrap:wrap;
					gap:6px
					}
					.gen-badge{
					display:inline-flex;
					align-items:center;
					padding:3px 9px;
					border-radius:12px;
					font-size:12px;
					font-weight:bold;
					color:#fff;
					white-space:nowrap
					}
					.gen-bar{
					display:inline-flex;
					height:14px;
					width:100%;
					max-width:400px;
					border-radius:4px;
					overflow:hidden;
					box-shadow:inset 0 0 0 1px rgba(0,0,0,.08);
					margin-top:6px
					}
					.gen-bar span{
					height:100%
					}
					.gen01{background:#4C72B0}
					.gen02{background:#DD8452}
					.gen03{background:#55A868}
					.gen04{background:#C44E52}
					.gen05{background:#8172B2}
					.gen06{background:#937860}
					.gen07{background:#DA8BC3}
					.gen08{background:#8C8C8C}
					.gen09{background:#CCB974}
					/* Generation 10: .gen10{background:#....} */
					/* ===================================================== */
					/* Statistik-Listen */
					/* ===================================================== */
					.statistics-lists{
					display:flex;
					align-items:flex-start;
					gap:20px;
					margin-top:10px;
					margin-bottom:10px
					}
					.statistics-list{
					border:solid #d0d4d9 1px;
					border-radius:8px;
					padding:10px 20px;
					background:#fff;
					box-shadow:0 2px 6px rgba(0,0,0,.08);
					width:320px;
					height:362px;
					overflow:auto
					}
					.statistics-list h2{
					margin-top:0;
					margin-bottom:12px
					}
					.statistics-list p{
					margin:8px 0
					}
					.statistics-list .game-name{
					display:block;
					font-weight:bold;
					margin-bottom:4px
					}
					.statistics-list .trainer-list{
					display:flex;
					flex-wrap:wrap;
					gap:4px 12px;
					padding-left:10px
					}
					.statistics-list .trainer-list a{
					text-decoration:none;
					white-space:nowrap
					}
					.species-list{
					display:flex;
					flex-direction:column;
					gap:6px
					}
					.species-entry{
					display:flex;
					align-items:center;
					min-height:60px
					}
					.species-entry img{
					width:60px;
					height:60px;
					padding-right:10px;
					flex:0 0 auto
					}
					.species-name{
					display:block
					}
					.species-count{
					font-size:12px;
					color:#666
					}
					/* ===================================================== */
					/* Trainer-Navigation */
					/* ===================================================== */
					.trainer-navigation{
					border:solid #d0d4d9 1px;
					border-radius:8px;
					padding:10px 20px;
					margin-top:10px;
					margin-bottom:10px;
					background:#fff;
					box-shadow:0 2px 6px rgba(0,0,0,.08)
					}
					.trainer-navigation h2{
					margin-top:0;
					margin-bottom:12px
					}
					.trainer-navigation p{
					margin:8px 0
					}
					.trainer-navigation .game-name{
					display:block;
					font-weight:bold;
					margin-bottom:4px
					}
					.trainer-navigation .trainer-list{
					display:flex;
					flex-wrap:wrap;
					gap:4px 12px;
					padding-left:10px
					}
					.trainer-navigation .trainer-list a{
					text-decoration:none;
					white-space:nowrap
					}
					.trainer-links{
					margin-bottom:5px
					}
					.trainer-links a{
					text-decoration:none;
					padding:0 5px
					}
					.trainer{
					display:block;
					width:100%;
					position:relative;
					margin-bottom:20px
					}
					/* ===================================================== */
					/* Trainer-Überschrift und permanente Daten-Box */
					/* ===================================================== */
					.trainer-heading{
					display:flex;
					align-items:center;
					gap:10px;
					position:relative;
					width:963px;
					margin-bottom:8px
					}
					.trainer-heading h2{
					margin-top:0;
					margin-bottom:0
					}
					.trainer-name{
					font-weight:bold
					}
					.team-name{
					font-weight:normal;
					color:#666
					}
					.team-name:before{
					content:" · ";
					color:#999
					}
					.trainer-heading .tooltip{
					position:static;
					display:block;
					opacity:1;
					margin:0 0 0 auto;
					padding:8px 12px;
					background:#25282c;
					color:#fff;
					border:1px solid #555b63;
					border-radius:6px;
					box-shadow:0 3px 10px rgba(0,0,0,.2);
					white-space:nowrap;
					pointer-events:none
					}
					/* ===================================================== */
					/* Trainer-Bild + Hover auf Trainer01 */
					/* ===================================================== */
					.zoom{
					height:362px;
					width:303px;
					max-width:375px;
					overflow:hidden;
					display:inline-block;
					position:relative;
					cursor:pointer
					}
					.zoom>img{
					height:405px;
					width:720px;
					margin-left:-99px;
					margin-top:-14px
					}
					.zoom>.tooltip{
					position:absolute;
					top:0;
					left:0;
					width:100%;
					height:100%;
					margin:0;
					padding:0;
					border:0;
					border-radius:0;
					box-shadow:none;
					background:transparent;
					white-space:normal;
					z-index:30;
					pointer-events:none
					}
					.zoom>.tooltip img{
					height:405px;
					width:720px;
					margin-left:-99px;
					margin-top:-14px
					}
					.hover{
					position:relative
					}
					.tooltip{
					top:-10px;
					z-index:10;
					padding:10px 12px;
					margin:4px;
					background:#25282c;
					color:#fff;
					border:1px solid #555b63;
					border-radius:6px;
					opacity:0;
					position:absolute;
					box-shadow:0 3px 10px rgba(0,0,0,.2);
					white-space:nowrap;
					transition:opacity .2s
					}
					.hover:hover .tooltip{
					opacity:1
					}
					.trainer:hover .zoom>.tooltip{
					opacity:1
					}
					.zoom:hover{
					box-shadow:0 0 0 3px rgba(49,95,140,.45);
					border-radius:4px
					}
					/* ===================================================== */
					/* Vergrößerungs-Symbol */
					/* ===================================================== */
					.zoom-indicator{
					position:absolute;
					top:10px;
					right:10px;
					z-index:40;
					padding:4px 7px;
					border-radius:6px;
					background:rgba(0,0,0,.65);
					color:#fff;
					font-size:22px;
					line-height:24px;
					pointer-events:none
					}
					/* ===================================================== */
					/* Pokémon-Liste */
					/* ===================================================== */
					.pkmn{
					display:inline;
					margin-top:10px;
					border-radius:6px;
					transition:background .15s,box-shadow .15s
					}
					.pkmn>div{
					position:absolute;
					top:50%;
					left:50%;
					transform:translate(-50%,-50%)
					}
					.pkmn img{
					width:60px;
					height:60px;
					padding-right:10px
					}
					.pkmn:hover{
					background:#eef3f8;
					box-shadow:0 0 0 2px #c4d4e3
					}
					.list{
					display:inline-flex;
					height:362px;
					max-height:362px;
					width:660px;
					position:absolute;
					overflow:overlay;
					flex-flow:column wrap;
					border:solid #d0d4d9 1px;
					border-radius:8px;
					padding-top:10px;
					padding-left:10px;
					background:#fff
					}
					/* ===================================================== */
					/* Carousel */
					/* ===================================================== */
					.carousel-open{
					position:absolute;
					top:0;
					left:0;
					width:303px;
					height:362px;
					z-index:20;
					text-decoration:none;
					cursor:pointer
					}
					.carousel-overlay{
					display:block;
					position:fixed;
					z-index:1000;
					top:0;
					left:0;
					width:100%;
					height:100%;
					background:rgba(20,22,25,.96);
					padding:30px;
					visibility:hidden;
					opacity:0;
					pointer-events:none;
					transition:opacity .2s
					}
					.carousel-overlay:target{
					visibility:visible;
					opacity:1;
					pointer-events:auto
					}
					.carousel{
					position:relative;
					width:100%;
					height:100%;
					max-width:1400px;
					margin:0 auto
					}
					.carousel-radio{
					position:absolute;
					opacity:0;
					pointer-events:none
					}
					.carousel-slides{
					position:relative;
					width:100%;
					height:100%
					}
					.carousel-slide{
					display:none;
					align-items:center;
					justify-content:center;
					width:100%;
					height:100%;
					gap:40px
					}
					.carousel-radio:nth-of-type(1):checked ~ .carousel-slides .carousel-slide:nth-child(1),
					.carousel-radio:nth-of-type(2):checked ~ .carousel-slides .carousel-slide:nth-child(2),
					.carousel-radio:nth-of-type(3):checked ~ .carousel-slides .carousel-slide:nth-child(3),
					.carousel-radio:nth-of-type(4):checked ~ .carousel-slides .carousel-slide:nth-child(4),
					.carousel-radio:nth-of-type(5):checked ~ .carousel-slides .carousel-slide:nth-child(5),
					.carousel-radio:nth-of-type(6):checked ~ .carousel-slides .carousel-slide:nth-child(6),
					.carousel-radio:nth-of-type(7):checked ~ .carousel-slides .carousel-slide:nth-child(7),
					.carousel-radio:nth-of-type(8):checked ~ .carousel-slides .carousel-slide:nth-child(8),
					.carousel-radio:nth-of-type(9):checked ~ .carousel-slides .carousel-slide:nth-child(9),
					.carousel-radio:nth-of-type(10):checked ~ .carousel-slides .carousel-slide:nth-child(10){
					display:flex
					}
					.carousel-image-container{
					display:flex;
					align-items:center;
					justify-content:center;
					flex:1 1 auto;
					min-width:0;
					height:100%
					}
					.carousel-image{
					max-width:100%;
					max-height:90vh;
					width:auto;
					height:auto;
					object-fit:contain
					}
					.carousel-info{
					flex:0 1 350px;
					max-height:80vh;
					overflow:auto;
					padding:18px 20px;
					background:#25282c;
					color:#fff;
					border:1px solid #555b63;
					border-radius:8px;
					line-height:1.5
					}
					.carousel-info h2{
					margin-top:0;
					margin-bottom:12px;
					color:#fff
					}
					.carousel-info p{
					margin:5px 0
					}
					.carousel-slide-nav{
					position:absolute;
					left:0;
					right:0;
					top:50%;
					transform:translateY(-50%);
					display:flex;
					justify-content:space-between;
					align-items:center;
					pointer-events:none
					}
					.carousel-slide-nav .carousel-button{
					pointer-events:auto
					}
					.carousel-slide-nav .carousel-button:last-child{
					margin-right:370px
					}
					.carousel-button{
					display:block;
					flex:0 0 auto;
					width:46px;
					height:46px;
					border:1px solid #666;
					border-radius:50%;
					background:#30343a;
					color:#fff;
					font-size:28px;
					line-height:40px;
					text-align:center;
					cursor:pointer;
					user-select:none
					}
					.carousel-button:hover{
					background:#444a52
					}
					.carousel-close{
					position:absolute;
					top:10px;
					right:15px;
					z-index:1002;
					width:42px;
					height:42px;
					border:0;
					background:transparent;
					color:#fff;
					font-size:32px;
					line-height:32px;
					cursor:pointer;
					text-decoration:none
					}
					.carousel-back{
					position:absolute;
					top:14px;
					left:15px;
					z-index:1002;
					padding:6px 10px;
					border:1px solid #666;
					border-radius:6px;
					background:#30343a;
					color:#fff;
					font-size:16px;
					text-decoration:none
					}
					.carousel-back:hover{
					background:#444a52
					}
					.carousel-counter{
					position:absolute;
					bottom:10px;
					left:50%;
					transform:translateX(-50%);
					color:#ccc;
					font-size:14px
					}
					/* ===================================================== */
					/* Mobil */
					/* ===================================================== */
					@media(max-width:700px){
					body{padding:10px}
					.statistics-container{display:block}
					.statistics{margin-bottom:10px}
					.game-statistics{width:100%}
					.game-statistics th,.game-statistics td{padding:6px}
					.trainer-navigation{padding:10px}
					.trainer{width:100%}
					.trainer-heading{
					width:100%
					}
					.trainer-heading .tooltip{
					display:none
					}
					.team-navigation{
					margin-left:10px
					}
					.zoom{width:303px;max-width:100%}
					.list{
					width:100%;
					max-width:100%;
					position:relative;
					height:auto;
					max-height:none;
					display:flex;
					flex-flow:row wrap;
					overflow:visible
					}
					.part-navigation{margin-left:10px}
					.statistics-lists{
					display:block
					}
					.statistics-list{
					width:100%;
					height:300px;
					margin-bottom:10px
					}
					}
					@media(max-width:700px){
					.carousel-overlay{padding:45px 10px 35px}
					.carousel{gap:5px}
					.carousel-slide{
					flex-direction:column;
					gap:12px
					}
					.carousel-image-container{
					width:100%;
					height:55%;
					flex:0 0 55%
					}
					.carousel-image{
					max-width:100%;
					max-height:100%
					}
					.carousel-info{
					width:100%;
					max-width:500px;
					max-height:30%;
					flex:0 0 auto;
					padding:10px 12px;
					overflow:auto
					}
					.carousel-info h2{
					margin-bottom:6px;
					font-size:18px
					}
					.carousel-info p{
					margin:3px 0
					}
					.carousel-button{
					width:38px;
					height:38px;
					font-size:24px;
					line-height:32px
					}
					.carousel-slide-nav .carousel-button:last-child{
					margin-right:0
					}
					.carousel-back{
					top:8px;
					left:10px;
					font-size:14px
					}
					.carousel-close{
					top:5px;
					right:8px
					}
					}
				</style>
			</head>
			<body id="top">
				<span id="alle"></span>
				<div class="page-part" id="part-statistik">
					<div class="part-control">
						<b>Navigation:</b>
						<span class="part-navigation">
							<a href="#part-statistik">↑</a>
							<xsl:if test="//Trainer[string-length(Name/text()) &gt; 0]">
								<a href="#{generate-id(//Trainer[string-length(Name/text()) &gt; 0][1])}">→</a>
							</xsl:if>
							<a href="#alle">Alle</a>
						</span>
					</div>
					<div class="statistics-container">
						<div class="statistics">
							<h1>📊 Statistiken</h1>
							<p>
								<b>🎮 Spiele:</b>
								<xsl:value-of select="count(//Spiel)"/>
							</p>
							<p>
								<b>👤 Trainer:</b>
								<xsl:value-of select="count(//Trainer[string-length(Name/text()) &gt; 0])"/>
							</p>
							<p>
								<b>👥 Teams:</b>
								<xsl:value-of select="count(//Team[string-length(../Name/text()) &gt; 0])"/>
							</p>
							<xsl:for-each select="//Trainer[string-length(Name/text()) &gt; 0]">
								<xsl:sort select="count(Team[string-length(../Name/text()) &gt; 0])" data-type="number" order="descending"/>
								<xsl:if test="position()=1">
									<p class="record">
										<b>🏆 Meiste Teams:</b>
									</p>
									<p class="record-value">
										<xsl:value-of select="Name"/>
										<xsl:text> (</xsl:text>
										<xsl:value-of select="count(Team[string-length(../Name/text()) &gt; 0])"/>
										<xsl:text>)</xsl:text>
									</p>
								</xsl:if>
							</xsl:for-each>
							<xsl:for-each select="//Trainer[string-length(Name/text()) &gt; 0]">
								<xsl:sort select="count(Team[string-length(../Name/text()) &gt; 0]/Pokemon)" data-type="number" order="descending"/>
								<xsl:if test="position()=1">
									<p class="record">
										<b>🐾 Meiste Pokémon:</b>
									</p>
									<p class="record-value">
										<xsl:value-of select="Name"/>
										<xsl:text> (</xsl:text>
										<xsl:value-of select="count(Team[string-length(../Name/text()) &gt; 0]/Pokemon)"/>
										<xsl:text>)</xsl:text>
									</p>
								</xsl:if>
							</xsl:for-each>
						</div>
						<table class="game-statistics">
							<tr>
								<th>Spiel</th>
								<th>Anzahl Trainer</th>
								<th>Anzahl Teams.</th>
								<th>Anzahl Pokemon</th>
								<th>Generationen</th>
							</tr>
							<xsl:for-each select="//Spiel">
								<tr>
									<td>
										<xsl:choose>
											<xsl:when test="Trainer[string-length(Name/text()) &gt; 0]">
												<a href="#{generate-id(Trainer[string-length(Name/text()) &gt; 0])}">
													<xsl:value-of select="@Name"/>
												</a>
											</xsl:when>
											<xsl:otherwise>
												<xsl:value-of select="@Name"/>
											</xsl:otherwise>
										</xsl:choose>
									</td>
									<td>
										<xsl:if test="not(//Spiel[count(Trainer[string-length(Name/text()) &gt; 0]) &gt; count(current()/Trainer[string-length(Name/text()) &gt; 0])])">
											<xsl:attribute name="class">max</xsl:attribute>
										</xsl:if>
										<xsl:value-of select="count(Trainer[string-length(Name/text()) &gt; 0])"/>
									</td>
									<td>
										<xsl:if test="not(//Spiel[count(Trainer[string-length(Name/text()) &gt; 0]/Team[string-length(../Name/text()) &gt; 0]) &gt; count(current()/Trainer[string-length(Name/text()) &gt; 0]/Team[string-length(../Name/text()) &gt; 0])])">
											<xsl:attribute name="class">max</xsl:attribute>
										</xsl:if>
										<xsl:value-of select="count(Trainer[string-length(Name/text()) &gt; 0]/Team[string-length(../Name/text()) &gt; 0])"/>
									</td>
									<td>
										<xsl:if test="not(//Spiel[count(.//Pokemon) &gt; count(current()//Pokemon)])">
											<xsl:attribute name="class">max</xsl:attribute>
										</xsl:if>
										<xsl:value-of select="count(.//Pokemon)"/>
									</td>
									<td class="gen-cell">
										<xsl:call-template name="gen-stats">
											<xsl:with-param name="pokemons" select=".//Pokemon"/>
										</xsl:call-template>
									</td>
								</tr>
							</xsl:for-each>
							<tr class="sum">
								<td>Summe</td>
								<td>
									<xsl:value-of select="count(//Trainer[string-length(Name/text()) &gt; 0])"/>
								</td>
								<td>
									<xsl:value-of select="count(//Team[string-length(../Name/text()) &gt; 0])"/>
								</td>
								<td>
									<xsl:value-of select="count(//Pokemon)"/>
								</td>
								<td class="gen-cell">
									<xsl:call-template name="gen-stats">
										<xsl:with-param name="pokemons" select="//Pokemon"/>
									</xsl:call-template>
								</td>
							</tr>
						</table>
					</div>
					<div class="statistics-lists">
						<div class="statistics-list">
							<h2>👤 Trainer</h2>
							<xsl:for-each select="//Spiel">
								<xsl:if test="Trainer[string-length(Name/text()) &gt; 0]">
									<p>
										<span class="game-name">
											<xsl:value-of select="@Name"/>:
										</span>
										<span class="trainer-list">
											<xsl:for-each select="Trainer[string-length(Name/text()) &gt; 0]">
												<a href="#{generate-id()}">
													<xsl:value-of select="Name"/>
												</a>
											</xsl:for-each>
										</span>
									</p>
								</xsl:if>
							</xsl:for-each>
						</div>
						<div class="statistics-list">
							<h2>🐾 Pokémon / Spezies</h2>
							<div class="species-list">
								<xsl:for-each select="//Pokemon[generate-id()=generate-id(key('species',Rasse/Name)[1])]">
									<xsl:sort select="count(key('species',Rasse/Name))" data-type="number" order="descending"/>
									<xsl:sort select="Rasse/Name" data-type="text" order="ascending"/>
									<div class="species-entry">
										<xsl:choose>
											<xsl:when test="Rasse/IMG">
												<img src="{Rasse/IMG/text()}"/>
											</xsl:when>
											<xsl:otherwise>
												<img src="https://media.bisafans.de/6a7ad8422//pokemon/artwork/{Rasse/ID/text()}.png"/>
											</xsl:otherwise>
										</xsl:choose>
										<div>
											<span class="species-name">
												<xsl:value-of select="Rasse/Name"/>
											</span>
											<span class="species-count">
												<xsl:value-of select="count(key('species',Rasse/Name))"/>
											</span>
										</div>
									</div>
								</xsl:for-each>
							</div>
						</div>
					</div>
				</div>
				<xsl:for-each select="//Trainer[string-length(Name/text()) &gt; 0]">
					<div class="page-part trainer-part" id="{generate-id()}">
						<hr/>
						<div class="trainer-links"></div>
						<div class="part-control">
							<b>Navigation:</b>
							<span class="part-navigation">
								<xsl:if test="preceding::Trainer[string-length(Name/text()) &gt; 0]">
									<a href="#{generate-id(preceding::Trainer[string-length(Name/text()) &gt; 0][1])}">←</a>
								</xsl:if>
								<a href="#part-statistik">↑</a>
								<xsl:if test="following::Trainer[string-length(Name/text()) &gt; 0]">
									<a href="#{generate-id(following::Trainer[string-length(Name/text()) &gt; 0][1])}">→</a>
								</xsl:if>
								<a href="#alle">Alle</a>
							</span>
							<xsl:if test="Team[string-length(../Name/text()) &gt; 0]">
								<span class="team-navigation">
									<b>Teams:</b>
									<xsl:for-each select="Team[string-length(../Name/text()) &gt; 0]">
										<xsl:sort select="Name" data-type="text"/>
										<a href="#team-{generate-id()}">
											<xsl:value-of select="Name"/>
										</a>
									</xsl:for-each>
								</span>
							</xsl:if>
						</div>
						<div class="statistics gen-box">
							<h1>🧬 Generationen</h1>
							<xsl:call-template name="gen-stats">
								<xsl:with-param name="pokemons" select="Team[string-length(../Name/text()) &gt; 0]/Pokemon"/>
							</xsl:call-template>
						</div>
						<xsl:for-each select="Team[string-length(../Name/text()) &gt; 0]">
							<xsl:sort select="../Name" data-type="text"/>
							<div class="trainer" id="team-{generate-id()}">
								<a class="carousel-open" href="#carousel-{generate-id()}" aria-label="Karussell öffnen"></a>
								<div class="trainer-heading hover">
									<h2>
										<span class="trainer-name">
											<xsl:value-of select="../Name"/>
										</span>
										<xsl:if test="string-length(Name/text()) &gt; 0">
											<span class="team-name">
												<xsl:value-of select="Name"/>
											</span>
										</xsl:if>
									</h2>
									<div class="tooltip">
										<xsl:for-each select="*[not(./*)] | ../*[not(./*)]">
											<b>
												<xsl:value-of select="name(.)"/>
											</b>:
											<xsl:value-of select="./text()"/>
											<br/>
										</xsl:for-each>
									</div>
								</div>
								<div class="zoom hover">
									<img src="https://wuerfelmeister.de/Visitenkarte/Trainer02/{../Name}.jpg"/>
									<div class="zoom-indicator">🔍</div>
									<div class="tooltip">
										<img src="https://wuerfelmeister.de/Visitenkarte/Trainer01/{../Name}.jpg"/>
									</div>
								</div>
								<div class="list">
									<xsl:for-each select="Pokemon">
										<div class="pkmn hover">
											<xsl:choose>
												<xsl:when test="Rasse/IMG">
													<img src="{Rasse/IMG/text()}"/>
												</xsl:when>
												<xsl:otherwise>
													<img src="https://media.bisafans.de/6a7ad8422//pokemon/artwork/{Rasse/ID/text()}.png"/>
												</xsl:otherwise>
											</xsl:choose>
											<xsl:value-of select="Name" disable-output-escaping="yes"/>
											<div class="tooltip">
												<b>Rasse: </b>
												<xsl:value-of select="Rasse/Name/text()"/>
												<xsl:text> (Gen </xsl:text>
												<xsl:call-template name="get-generation">
													<xsl:with-param name="id" select="Rasse/ID"/>
												</xsl:call-template>
												<xsl:text>)</xsl:text>
												<br/>
												<xsl:for-each select="*[name(.) != 'Rasse' and not(./*)]">
													<b>
														<xsl:value-of select="name(.)"/>
													</b>:
													<xsl:value-of select="./text()" disable-output-escaping="yes"/>
													<br/>
												</xsl:for-each>
											</div>
										</div>
									</xsl:for-each>
								</div>
								<div class="statistics gen-box">
									<h1>🧬 Generationen</h1>
									<xsl:call-template name="gen-stats">
										<xsl:with-param name="pokemons" select="Pokemon"/>
									</xsl:call-template>
								</div>
							</div>
						</xsl:for-each>
					</div>
				</xsl:for-each>
				<xsl:for-each select="//Team[string-length(../Name/text()) &gt; 0]">
					<div class="carousel-overlay" id="carousel-{generate-id()}">
						<div class="carousel">
							<a class="carousel-back" href="#{generate-id(ancestor::Trainer)}">← Trainer</a>
							<a class="carousel-close" href="#{generate-id(ancestor::Trainer)}">×</a>
							<input type="radio" class="carousel-radio" name="carousel-{generate-id()}" id="slide-{generate-id()}-0" checked="checked"/>
							<input type="radio" class="carousel-radio" name="carousel-{generate-id()}" id="slide-{generate-id()}-1"/>
							<xsl:for-each select="Pokemon">
								<input type="radio" class="carousel-radio" name="carousel-{generate-id(..)}" id="slide-{generate-id(..)}-{position()+1}"/>
							</xsl:for-each>
							<div class="carousel-slides">
								<div class="carousel-slide">
									<div class="carousel-image-container">
										<img class="carousel-image" src="https://wuerfelmeister.de/Visitenkarte/Trainer02/{../Name}.jpg"/>
									</div>
									<div class="carousel-info">
										<h2>
											<xsl:value-of select="../Name"/>
										</h2>
										<xsl:for-each select="../*[not(./*)]">
											<p>
												<b>
													<xsl:value-of select="name(.)"/>:
												</b>
												<xsl:value-of select="./text()" disable-output-escaping="yes"/>
											</p>
										</xsl:for-each>
										<p>
											<b>Team:</b>
											<xsl:value-of select="Name"/>
										</p>
									</div>
									<div class="carousel-slide-nav">
										<label class="carousel-button" for="slide-{generate-id()}-{count(Pokemon)+1}">‹</label>
										<span class="carousel-counter">
											1 / <xsl:value-of select="count(Pokemon)+2"/>
										</span>
										<label class="carousel-button" for="slide-{generate-id()}-1">›</label>
									</div>
								</div>
								<div class="carousel-slide">
									<div class="carousel-image-container">
										<img class="carousel-image" src="https://wuerfelmeister.de/Visitenkarte/Trainer01/{../Name}.jpg"/>
									</div>
									<div class="carousel-info">
										<h2>
											<xsl:value-of select="../Name"/>
										</h2>
										<xsl:for-each select="../*[not(./*)]">
											<p>
												<b>
													<xsl:value-of select="name(.)"/>:
												</b>
												<xsl:value-of select="./text()" disable-output-escaping="yes"/>
											</p>
										</xsl:for-each>
										<p>
											<b>Team:</b>
											<xsl:value-of select="Name"/>
										</p>
									</div>
									<div class="carousel-slide-nav">
										<label class="carousel-button" for="slide-{generate-id()}-0">‹</label>
										<span class="carousel-counter">
											2 / <xsl:value-of select="count(Pokemon)+2"/>
										</span>
										<xsl:choose>
											<xsl:when test="count(Pokemon) &gt; 0">
												<label class="carousel-button" for="slide-{generate-id()}-2">›</label>
											</xsl:when>
											<xsl:otherwise>
												<label class="carousel-button" for="slide-{generate-id()}-0">›</label>
											</xsl:otherwise>
										</xsl:choose>
									</div>
								</div>
								<xsl:for-each select="Pokemon">
									<div class="carousel-slide">
										<div class="carousel-image-container">
											<xsl:choose>
												<xsl:when test="Rasse/IMG">
													<img class="carousel-image" src="{Rasse/IMG/text()}"/>
												</xsl:when>
												<xsl:otherwise>
													<img class="carousel-image" src="https://media.bisafans.de/6a7ad8422//pokemon/artwork/{Rasse/ID/text()}.png"/>
												</xsl:otherwise>
											</xsl:choose>
										</div>
										<div class="carousel-info">
											<h2>
												<xsl:value-of select="Name" disable-output-escaping="yes"/>
											</h2>
											<p>
												<b>Rasse:</b>
												<xsl:value-of select="Rasse/Name/text()"/>
												<xsl:text> (Gen </xsl:text>
												<xsl:call-template name="get-generation">
													<xsl:with-param name="id" select="Rasse/ID"/>
												</xsl:call-template>
												<xsl:text>)</xsl:text>
											</p>
											<xsl:for-each select="*[name(.) != 'Rasse' and not(./*)]">
												<p>
													<b>
														<xsl:value-of select="name(.)"/>:
													</b>
													<xsl:value-of select="./text()" disable-output-escaping="yes"/>
												</p>
											</xsl:for-each>
										</div>
										<div class="carousel-slide-nav">
											<xsl:choose>
												<xsl:when test="position() = 1">
													<label class="carousel-button" for="slide-{generate-id(..)}-1">‹</label>
												</xsl:when>
												<xsl:otherwise>
													<label class="carousel-button" for="slide-{generate-id(..)}-{position()}">‹</label>
												</xsl:otherwise>
											</xsl:choose>
											<span class="carousel-counter">
												<xsl:value-of select="position()+2"/> / <xsl:value-of select="count(../Pokemon)+2"/>
											</span>
											<xsl:choose>
												<xsl:when test="position() = last()">
													<label class="carousel-button" for="slide-{generate-id(..)}-0">›</label>
												</xsl:when>
												<xsl:otherwise>
													<label class="carousel-button" for="slide-{generate-id(..)}-{position()+2}">›</label>
												</xsl:otherwise>
											</xsl:choose>
										</div>
									</div>
								</xsl:for-each>
							</div>
						</div>
					</div>
				</xsl:for-each>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>