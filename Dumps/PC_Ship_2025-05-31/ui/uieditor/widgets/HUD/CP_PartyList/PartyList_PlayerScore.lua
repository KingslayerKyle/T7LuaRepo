require( "ui.uieditor.widgets.HUD.CP_DamageWidget.DamageWidget_Panel" )
require( "ui.uieditor.widgets.HUD.CP_PartyList.PartyList_PlayerScoreInternal" )

local PostLoadFunc = function ( f1_arg0 )
	f1_arg0.updatePlayerScoreWidgetLayout = function ( f2_arg0 )
		local f2_local0 = 0
		local f2_local1 = function ( f3_arg0 )
			local f3_local0, f3_local1, f3_local2, f3_local3 = f3_arg0:getLocalRect()
			f2_local0 = f2_local0 + f3_local2 - f3_local0 + 1
		end
		
		local f2_local2 = function ( f4_arg0 )
			f2_local0 = f2_local0 + f4_arg0:getTextWidth() + 1
		end
		
		if 0 < f2_arg0.ScoreInternal.ClanContainer.LblClan:getTextWidth() then
			f2_local1( f2_arg0.ScoreInternal.ClanContainer )
		end
		f2_local1( f2_arg0.ScoreInternal.ScoreRankIcon )
		f2_local1( f2_arg0.ScoreInternal.voipCustomElement )
		f2_local2( f2_arg0.ScoreInternal.Gamertag )
		f2_local2( f2_arg0.ScoreInternal.LblRank )
		f2_arg0.Panel:setLeftRight( false, true, -f2_local0 - 5, 4 )
	end
	
end

CoD.PartyList_PlayerScore = InheritFrom( LUI.UIElement )
CoD.PartyList_PlayerScore.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.PartyList_PlayerScore )
	self.id = "PartyList_PlayerScore"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 257 )
	self:setTopBottom( true, false, 0, 19 )
	self.anyChildUsesUpdateState = true
	
	local Panel = CoD.DamageWidget_Panel.new( menu, controller )
	Panel:setLeftRight( true, false, 89.39, 258.39 )
	Panel:setTopBottom( true, false, -1.67, 22 )
	Panel:setRGB( 0.79, 0.82, 0.85 )
	Panel:setZoom( -3 )
	Panel:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_scene_blur_pass_2" ) )
	Panel:setShaderVector( 0, 10, 10, 0, 0 )
	self:addElement( Panel )
	self.Panel = Panel
	
	local ScoreInternal = CoD.PartyList_PlayerScoreInternal.new( menu, controller )
	ScoreInternal:setLeftRight( true, false, -3, 254 )
	ScoreInternal:setTopBottom( true, false, 1, 18.67 )
	ScoreInternal:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	ScoreInternal:setShaderVector( 0, 0.1, 0.5, 0, 0 )
	ScoreInternal:setShaderVector( 1, 0, 0, 0, 0 )
	ScoreInternal:setShaderVector( 2, 0, 0, 0, 0 )
	ScoreInternal:setShaderVector( 3, 0, 0, 0, 0 )
	ScoreInternal:setShaderVector( 4, 0, 0, 0, 0 )
	ScoreInternal:linkToElementModel( self, nil, false, function ( model )
		ScoreInternal:setModel( model, controller )
	end )
	self:addElement( ScoreInternal )
	self.ScoreInternal = ScoreInternal
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				Panel:completeAnimation()
				self.Panel:setAlpha( 1 )
				self.clipFinished( Panel, {} )
				ScoreInternal:completeAnimation()
				ScoreInternal.Gamertag:completeAnimation()
				ScoreInternal.ClanContainer:completeAnimation()
				ScoreInternal.LblRank:completeAnimation()
				self.ScoreInternal:setAlpha( 1 )
				self.ScoreInternal.Gamertag:setRGB( 1, 1, 1 )
				self.ScoreInternal.ClanContainer:setRGB( 1, 1, 1 )
				self.ScoreInternal.LblRank:setRGB( 1, 1, 1 )
				self.clipFinished( ScoreInternal, {} )
			end
		},
		Visible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				Panel:completeAnimation()
				self.Panel:setAlpha( 1 )
				self.clipFinished( Panel, {} )
				ScoreInternal:completeAnimation()
				ScoreInternal.Gamertag:completeAnimation()
				ScoreInternal.ClanContainer:completeAnimation()
				ScoreInternal.LblRank:completeAnimation()
				self.ScoreInternal:setAlpha( 1 )
				self.ScoreInternal.Gamertag:setRGB( 1, 1, 1 )
				self.ScoreInternal.ClanContainer:setRGB( 1, 1, 1 )
				self.ScoreInternal.LblRank:setRGB( 1, 1, 1 )
				self.clipFinished( ScoreInternal, {} )
			end
		},
		Hidden = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				Panel:completeAnimation()
				self.Panel:setAlpha( 0 )
				self.clipFinished( Panel, {} )
				ScoreInternal:completeAnimation()
				self.ScoreInternal:setAlpha( 0 )
				self.clipFinished( ScoreInternal, {} )
			end
		},
		IsSelf = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				Panel:completeAnimation()
				self.Panel:setLeftRight( true, false, 89.39, 258.39 )
				self.Panel:setTopBottom( true, false, -1.67, 22 )
				self.Panel:setAlpha( 1 )
				self.clipFinished( Panel, {} )
				ScoreInternal:completeAnimation()
				ScoreInternal.Gamertag:completeAnimation()
				ScoreInternal.ClanContainer:completeAnimation()
				ScoreInternal.LblRank:completeAnimation()
				self.ScoreInternal:setRGB( 1, 1, 1 )
				self.ScoreInternal:setAlpha( 1 )
				self.ScoreInternal:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
				self.ScoreInternal.Gamertag:setRGB( 0.99, 0.83, 0.03 )
				self.ScoreInternal.ClanContainer:setRGB( 0.99, 0.83, 0.03 )
				self.ScoreInternal.LblRank:setRGB( 0.99, 0.83, 0.03 )
				self.clipFinished( ScoreInternal, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.Panel:close()
		element.ScoreInternal:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

