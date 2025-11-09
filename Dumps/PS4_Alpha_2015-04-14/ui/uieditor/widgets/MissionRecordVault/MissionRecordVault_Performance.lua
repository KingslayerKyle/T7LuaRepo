require( "ui.uieditor.widgets.BorderThin" )
require( "ui.uieditor.widgets.MissionRecordVault.MissionRecordVault_PerformanceCollectible" )

local PreLoadFunc = function ( self, controller )
	CoD.perController[controller].inspectingMap = Engine.GetModelValue( Engine.GetModel( Engine.GetGlobalModel(), "MissionRecordVaultMapInfo.mapId" ) )
	LUI.OverrideFunction_CallOriginalFirst( self, "close", function ()
		CoD.perController[controller].inspectingMap = nil
	end )
end

CoD.MissionRecordVault_Performance = InheritFrom( LUI.UIElement )
CoD.MissionRecordVault_Performance.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.MissionRecordVault_Performance )
	self.id = "MissionRecordVault_Performance"
	self.soundSet = "CAC_PrimaryWeapon"
	self:setLeftRight( true, false, 0, 1152 )
	self:setTopBottom( true, false, 0, 534 )
	self.anyChildUsesUpdateState = true
	
	local PerformanceTitleIncomplete = LUI.UIText.new()
	PerformanceTitleIncomplete:setLeftRight( true, false, 10, 510 )
	PerformanceTitleIncomplete:setTopBottom( true, false, 10, 65 )
	PerformanceTitleIncomplete:setRGB( 1, 1, 1 )
	PerformanceTitleIncomplete:setAlpha( 0 )
	PerformanceTitleIncomplete:setText( Engine.Localize( "CPUI_PERFORMANCE_TITLE_INCOMPLETE" ) )
	PerformanceTitleIncomplete:setTTF( "fonts/default.ttf" )
	PerformanceTitleIncomplete:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	PerformanceTitleIncomplete:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( PerformanceTitleIncomplete )
	self.PerformanceTitleIncomplete = PerformanceTitleIncomplete
	
	local PerformanceTitle = LUI.UIText.new()
	PerformanceTitle:setLeftRight( true, false, 10, 510 )
	PerformanceTitle:setTopBottom( true, false, 10, 65 )
	PerformanceTitle:setRGB( 1, 1, 1 )
	PerformanceTitle:setText( Engine.Localize( "CPUI_PERFORMANCE_TITLE" ) )
	PerformanceTitle:setTTF( "fonts/default.ttf" )
	PerformanceTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	PerformanceTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( PerformanceTitle )
	self.PerformanceTitle = PerformanceTitle
	
	local TextBox0 = LUI.UIText.new()
	TextBox0:setLeftRight( true, false, 45, 332 )
	TextBox0:setTopBottom( true, false, 88, 118 )
	TextBox0:setRGB( 1, 1, 1 )
	TextBox0:setText( Engine.Localize( "MENU_SCORE_CAPS" ) )
	TextBox0:setTTF( "fonts/default.ttf" )
	TextBox0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	TextBox0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TextBox0 )
	self.TextBox0 = TextBox0
	
	local Image = LUI.UIImage.new()
	Image:setLeftRight( true, false, 45, 332 )
	Image:setTopBottom( true, false, 123, 251 )
	Image:setRGB( 1, 1, 1 )
	Image:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( Image )
	self.Image = Image
	
	local score = LUI.UIText.new()
	score:setLeftRight( true, false, 45, 332 )
	score:setTopBottom( true, false, 133, 226 )
	score:setRGB( 0, 0, 0 )
	score:setText( Engine.Localize( "--" ) )
	score:setTTF( "fonts/default.ttf" )
	score:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	score:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( score )
	self.score = score
	
	local TextBox1 = LUI.UIText.new()
	TextBox1:setLeftRight( true, false, 45, 332 )
	TextBox1:setTopBottom( true, false, 307, 337 )
	TextBox1:setRGB( 1, 1, 1 )
	TextBox1:setText( Engine.Localize( "MENU_COMPLETION_TIME_CAPS" ) )
	TextBox1:setTTF( "fonts/default.ttf" )
	TextBox1:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	TextBox1:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TextBox1 )
	self.TextBox1 = TextBox1
	
	local completionTime = LUI.UIImage.new()
	completionTime:setLeftRight( true, false, 103.5, 273.5 )
	completionTime:setTopBottom( true, false, 337, 507 )
	completionTime:setRGB( 1, 1, 1 )
	completionTime:setImage( RegisterImage( "uie_t7_menu_cp_vault_timer" ) )
	completionTime:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( completionTime )
	self.completionTime = completionTime
	
	local TextBox2 = LUI.UIText.new()
	TextBox2:setLeftRight( true, false, 386.5, 558.5 )
	TextBox2:setTopBottom( true, false, 88, 118 )
	TextBox2:setRGB( 1, 1, 1 )
	TextBox2:setText( Engine.Localize( "MENU_KILLS_CAPS" ) )
	TextBox2:setTTF( "fonts/default.ttf" )
	TextBox2:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	TextBox2:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TextBox2 )
	self.TextBox2 = TextBox2
	
	local TextBox3 = LUI.UIText.new()
	TextBox3:setLeftRight( true, false, 558.5, 730.5 )
	TextBox3:setTopBottom( true, false, 88, 118 )
	TextBox3:setRGB( 1, 1, 1 )
	TextBox3:setText( Engine.Localize( "MENU_ASSISTS_CAPS" ) )
	TextBox3:setTTF( "fonts/default.ttf" )
	TextBox3:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	TextBox3:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TextBox3 )
	self.TextBox3 = TextBox3
	
	local BorderThinKills = CoD.BorderThin.new( menu, controller )
	BorderThinKills:setLeftRight( true, false, 386.5, 556.5 )
	BorderThinKills:setTopBottom( true, false, 123, 251 )
	BorderThinKills:setRGB( 1, 1, 1 )
	self:addElement( BorderThinKills )
	self.BorderThinKills = BorderThinKills
	
	local BorderThin0 = CoD.BorderThin.new( menu, controller )
	BorderThin0:setLeftRight( true, false, 560.5, 730.5 )
	BorderThin0:setTopBottom( true, false, 123, 251 )
	BorderThin0:setRGB( 1, 1, 1 )
	self:addElement( BorderThin0 )
	self.BorderThin0 = BorderThin0
	
	local TextBox4 = LUI.UIText.new()
	TextBox4:setLeftRight( true, false, 781.5, 1080.5 )
	TextBox4:setTopBottom( true, false, 88, 118 )
	TextBox4:setRGB( 1, 1, 1 )
	TextBox4:setText( Engine.Localize( "MENU_COLLECTIBLES_CAPS" ) )
	TextBox4:setTTF( "fonts/default.ttf" )
	TextBox4:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	TextBox4:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TextBox4 )
	self.TextBox4 = TextBox4
	
	local BorderThin1 = CoD.BorderThin.new( menu, controller )
	BorderThin1:setLeftRight( true, false, 779.5, 1120.5 )
	BorderThin1:setTopBottom( true, false, 123, 351 )
	BorderThin1:setRGB( 1, 1, 1 )
	self:addElement( BorderThin1 )
	self.BorderThin1 = BorderThin1
	
	local Collectibles = LUI.GridLayout.new( menu, controller, false, 0, 0, 2, 0, nil, nil, false, false, 0, 0, false, true )
	Collectibles:setLeftRight( true, false, 782.5, 1116.5 )
	Collectibles:setTopBottom( true, false, 126, 348 )
	Collectibles:setRGB( 1, 1, 1 )
	Collectibles:setDataSource( "CollectiblesList" )
	Collectibles:setWidgetType( CoD.MissionRecordVault_PerformanceCollectible )
	Collectibles:setHorizontalCount( 3 )
	Collectibles:setVerticalCount( 2 )
	self:addElement( Collectibles )
	self.Collectibles = Collectibles
	
	local TextBox5 = LUI.UIText.new()
	TextBox5:setLeftRight( true, false, 386.5, 556.5 )
	TextBox5:setTopBottom( true, false, 133, 226 )
	TextBox5:setRGB( 1, 1, 1 )
	TextBox5:setText( Engine.Localize( "--" ) )
	TextBox5:setTTF( "fonts/default.ttf" )
	TextBox5:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	TextBox5:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TextBox5 )
	self.TextBox5 = TextBox5
	
	local TextBox6 = LUI.UIText.new()
	TextBox6:setLeftRight( true, false, 560.5, 730.5 )
	TextBox6:setTopBottom( true, false, 133, 226 )
	TextBox6:setRGB( 1, 1, 1 )
	TextBox6:setText( Engine.Localize( "--" ) )
	TextBox6:setTTF( "fonts/default.ttf" )
	TextBox6:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	TextBox6:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TextBox6 )
	self.TextBox6 = TextBox6
	
	local TextBox7 = LUI.UIText.new()
	TextBox7:setLeftRight( true, false, 103.5, 273.5 )
	TextBox7:setTopBottom( true, false, 370, 463 )
	TextBox7:setRGB( 1, 1, 1 )
	TextBox7:setText( Engine.Localize( "--" ) )
	TextBox7:setTTF( "fonts/default.ttf" )
	TextBox7:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	TextBox7:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TextBox7 )
	self.TextBox7 = TextBox7
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				PerformanceTitleIncomplete:completeAnimation()
				self.PerformanceTitleIncomplete:setAlpha( 0 )
				self.clipFinished( PerformanceTitleIncomplete, {} )
				PerformanceTitle:completeAnimation()
				self.PerformanceTitle:setAlpha( 1 )
				self.clipFinished( PerformanceTitle, {} )
			end
		},
		MissionIncomplete = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				PerformanceTitleIncomplete:completeAnimation()
				self.PerformanceTitleIncomplete:setAlpha( 1 )
				self.clipFinished( PerformanceTitleIncomplete, {} )
				PerformanceTitle:completeAnimation()
				self.PerformanceTitle:setAlpha( 0 )
				self.clipFinished( PerformanceTitle, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "MissionIncomplete",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		}
	} )
	self.close = function ( self )
		self.BorderThinKills:close()
		self.BorderThin0:close()
		self.BorderThin1:close()
		self.Collectibles:close()
		CoD.MissionRecordVault_Performance.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

