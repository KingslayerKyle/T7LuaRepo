-- 489afff9097938a81f360dcfbb6f01bb
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.HUD.ScoreInfo.ScoreInfo_RdTri" )

CoD.ScoreInfo_RdTriCont = InheritFrom( LUI.UIElement )
CoD.ScoreInfo_RdTriCont.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.ScoreInfo_RdTriCont )
	self.id = "ScoreInfo_RdTriCont"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 85 )
	self:setTopBottom( true, false, 0, 8 )
	self.anyChildUsesUpdateState = true
	
	local Tri10 = CoD.ScoreInfo_RdTri.new( menu, controller )
	Tri10:setLeftRight( true, false, 94, 102 )
	Tri10:setTopBottom( true, false, 0, 8 )
	Tri10:setAlpha( 0 )
	self:addElement( Tri10 )
	self.Tri10 = Tri10
	
	local Tri9 = CoD.ScoreInfo_RdTri.new( menu, controller )
	Tri9:setLeftRight( true, false, 87, 95 )
	Tri9:setTopBottom( true, false, 0, 8 )
	Tri9:setAlpha( 0 )
	self:addElement( Tri9 )
	self.Tri9 = Tri9
	
	local Tri8 = CoD.ScoreInfo_RdTri.new( menu, controller )
	Tri8:setLeftRight( true, false, 80, 88 )
	Tri8:setTopBottom( true, false, 0, 8 )
	Tri8:setAlpha( 0 )
	self:addElement( Tri8 )
	self.Tri8 = Tri8
	
	local Tri7 = CoD.ScoreInfo_RdTri.new( menu, controller )
	Tri7:setLeftRight( true, false, 73, 81 )
	Tri7:setTopBottom( true, false, 0, 8 )
	Tri7:setAlpha( 0 )
	self:addElement( Tri7 )
	self.Tri7 = Tri7
	
	local Tri6 = CoD.ScoreInfo_RdTri.new( menu, controller )
	Tri6:setLeftRight( true, false, 66, 74 )
	Tri6:setTopBottom( true, false, 0, 8 )
	Tri6:setAlpha( 0 )
	self:addElement( Tri6 )
	self.Tri6 = Tri6
	
	local Tri5 = CoD.ScoreInfo_RdTri.new( menu, controller )
	Tri5:setLeftRight( true, false, 59, 67 )
	Tri5:setTopBottom( true, false, 0, 8 )
	Tri5:setAlpha( 0 )
	self:addElement( Tri5 )
	self.Tri5 = Tri5
	
	local Tri4 = CoD.ScoreInfo_RdTri.new( menu, controller )
	Tri4:setLeftRight( true, false, 52, 60 )
	Tri4:setTopBottom( true, false, 0, 8 )
	Tri4:setAlpha( 0 )
	self:addElement( Tri4 )
	self.Tri4 = Tri4
	
	local Tri3 = CoD.ScoreInfo_RdTri.new( menu, controller )
	Tri3:setLeftRight( true, false, 45, 53 )
	Tri3:setTopBottom( true, false, 0, 8 )
	self:addElement( Tri3 )
	self.Tri3 = Tri3
	
	local Tri2 = CoD.ScoreInfo_RdTri.new( menu, controller )
	Tri2:setLeftRight( true, false, 38, 46 )
	Tri2:setTopBottom( true, false, 0, 8 )
	self:addElement( Tri2 )
	self.Tri2 = Tri2
	
	local Tri1 = CoD.ScoreInfo_RdTri.new( menu, controller )
	Tri1:setLeftRight( true, false, 31, 39 )
	Tri1:setTopBottom( true, false, 0, 8 )
	self:addElement( Tri1 )
	self.Tri1 = Tri1
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 10 )
				Tri10:completeAnimation()
				self.Tri10:setAlpha( 0 )
				self.clipFinished( Tri10, {} )
				Tri9:completeAnimation()
				self.Tri9:setAlpha( 0 )
				self.clipFinished( Tri9, {} )
				Tri8:completeAnimation()
				self.Tri8:setAlpha( 0 )
				self.clipFinished( Tri8, {} )
				Tri7:completeAnimation()
				self.Tri7:setAlpha( 0 )
				self.clipFinished( Tri7, {} )
				Tri6:completeAnimation()
				self.Tri6:setAlpha( 0 )
				self.clipFinished( Tri6, {} )
				Tri5:completeAnimation()
				self.Tri5:setAlpha( 0 )
				self.clipFinished( Tri5, {} )
				Tri4:completeAnimation()
				self.Tri4:setAlpha( 0 )
				self.clipFinished( Tri4, {} )
				Tri3:completeAnimation()
				self.Tri3:setAlpha( 0 )
				self.clipFinished( Tri3, {} )
				Tri2:completeAnimation()
				self.Tri2:setAlpha( 0 )
				self.clipFinished( Tri2, {} )
				Tri1:completeAnimation()
				self.Tri1:setAlpha( 0 )
				self.clipFinished( Tri1, {} )
			end
		},
		Rnd3 = {
			DefaultClip = function ()
				self:setupElementClipCounter( 10 )
				Tri10:completeAnimation()
				self.Tri10:setLeftRight( true, false, 94, 102 )
				self.Tri10:setTopBottom( true, false, 0, 8 )
				self.Tri10:setAlpha( 0 )
				self.clipFinished( Tri10, {} )
				Tri9:completeAnimation()
				self.Tri9:setLeftRight( true, false, 87, 95 )
				self.Tri9:setTopBottom( true, false, 0, 8 )
				self.Tri9:setAlpha( 0 )
				self.clipFinished( Tri9, {} )
				Tri8:completeAnimation()
				self.Tri8:setLeftRight( true, false, 80, 88 )
				self.Tri8:setTopBottom( true, false, 0, 8 )
				self.Tri8:setAlpha( 0 )
				self.clipFinished( Tri8, {} )
				Tri7:completeAnimation()
				self.Tri7:setLeftRight( true, false, 73, 81 )
				self.Tri7:setTopBottom( true, false, 0, 8 )
				self.Tri7:setAlpha( 0 )
				self.clipFinished( Tri7, {} )
				Tri6:completeAnimation()
				self.Tri6:setLeftRight( true, false, 66, 74 )
				self.Tri6:setTopBottom( true, false, 0, 8 )
				self.Tri6:setAlpha( 0 )
				self.clipFinished( Tri6, {} )
				Tri5:completeAnimation()
				self.Tri5:setLeftRight( true, false, 59, 67 )
				self.Tri5:setTopBottom( true, false, 0, 8 )
				self.Tri5:setAlpha( 0 )
				self.clipFinished( Tri5, {} )
				Tri4:completeAnimation()
				self.Tri4:setLeftRight( true, false, 52, 60 )
				self.Tri4:setTopBottom( true, false, 0, 8 )
				self.Tri4:setAlpha( 0 )
				self.clipFinished( Tri4, {} )
				Tri3:completeAnimation()
				self.Tri3:setLeftRight( true, false, 45, 53 )
				self.Tri3:setTopBottom( true, false, 0, 8 )
				self.Tri3:setAlpha( 1 )
				self.clipFinished( Tri3, {} )
				Tri2:completeAnimation()
				self.Tri2:setLeftRight( true, false, 38, 46 )
				self.Tri2:setTopBottom( true, false, 0, 8 )
				self.Tri2:setAlpha( 1 )
				self.clipFinished( Tri2, {} )
				Tri1:completeAnimation()
				self.Tri1:setLeftRight( true, false, 31, 39 )
				self.Tri1:setTopBottom( true, false, 0, 8 )
				self.Tri1:setAlpha( 1 )
				self.clipFinished( Tri1, {} )
			end
		},
		Rnd2 = {
			DefaultClip = function ()
				self:setupElementClipCounter( 10 )
				Tri10:completeAnimation()
				self.Tri10:setLeftRight( true, false, 98, 106 )
				self.Tri10:setTopBottom( true, false, 0, 8 )
				self.Tri10:setAlpha( 0 )
				self.clipFinished( Tri10, {} )
				Tri9:completeAnimation()
				self.Tri9:setLeftRight( true, false, 91, 99 )
				self.Tri9:setTopBottom( true, false, 0, 8 )
				self.Tri9:setAlpha( 0 )
				self.clipFinished( Tri9, {} )
				Tri8:completeAnimation()
				self.Tri8:setLeftRight( true, false, 84, 92 )
				self.Tri8:setTopBottom( true, false, 0, 8 )
				self.Tri8:setAlpha( 0 )
				self.clipFinished( Tri8, {} )
				Tri7:completeAnimation()
				self.Tri7:setLeftRight( true, false, 77, 85 )
				self.Tri7:setTopBottom( true, false, 0, 8 )
				self.Tri7:setAlpha( 0 )
				self.clipFinished( Tri7, {} )
				Tri6:completeAnimation()
				self.Tri6:setLeftRight( true, false, 70, 78 )
				self.Tri6:setTopBottom( true, false, 0, 8 )
				self.Tri6:setAlpha( 0 )
				self.clipFinished( Tri6, {} )
				Tri5:completeAnimation()
				self.Tri5:setLeftRight( true, false, 63, 71 )
				self.Tri5:setTopBottom( true, false, 0, 8 )
				self.Tri5:setAlpha( 0 )
				self.clipFinished( Tri5, {} )
				Tri4:completeAnimation()
				self.Tri4:setLeftRight( true, false, 56, 64 )
				self.Tri4:setTopBottom( true, false, 0, 8 )
				self.Tri4:setAlpha( 0 )
				self.clipFinished( Tri4, {} )
				Tri3:completeAnimation()
				self.Tri3:setLeftRight( true, false, 49, 57 )
				self.Tri3:setTopBottom( true, false, 0, 8 )
				self.Tri3:setAlpha( 0 )
				self.clipFinished( Tri3, {} )
				Tri2:completeAnimation()
				self.Tri2:setLeftRight( true, false, 42, 50 )
				self.Tri2:setTopBottom( true, false, 0, 8 )
				self.Tri2:setAlpha( 1 )
				self.clipFinished( Tri2, {} )
				Tri1:completeAnimation()
				self.Tri1:setLeftRight( true, false, 35, 43 )
				self.Tri1:setTopBottom( true, false, 0, 8 )
				self.Tri1:setAlpha( 1 )
				self.clipFinished( Tri1, {} )
			end
		},
		Rnd1 = {
			DefaultClip = function ()
				self:setupElementClipCounter( 10 )
				Tri10:completeAnimation()
				self.Tri10:setLeftRight( true, false, 101, 109 )
				self.Tri10:setTopBottom( true, false, 0, 8 )
				self.Tri10:setAlpha( 0 )
				self.clipFinished( Tri10, {} )
				Tri9:completeAnimation()
				self.Tri9:setLeftRight( true, false, 94, 102 )
				self.Tri9:setTopBottom( true, false, 0, 8 )
				self.Tri9:setAlpha( 0 )
				self.clipFinished( Tri9, {} )
				Tri8:completeAnimation()
				self.Tri8:setLeftRight( true, false, 87, 95 )
				self.Tri8:setTopBottom( true, false, 0, 8 )
				self.Tri8:setAlpha( 0 )
				self.clipFinished( Tri8, {} )
				Tri7:completeAnimation()
				self.Tri7:setLeftRight( true, false, 80, 88 )
				self.Tri7:setTopBottom( true, false, 0, 8 )
				self.Tri7:setAlpha( 0 )
				self.clipFinished( Tri7, {} )
				Tri6:completeAnimation()
				self.Tri6:setLeftRight( true, false, 73, 81 )
				self.Tri6:setTopBottom( true, false, 0, 8 )
				self.Tri6:setAlpha( 0 )
				self.clipFinished( Tri6, {} )
				Tri5:completeAnimation()
				self.Tri5:setLeftRight( true, false, 66, 74 )
				self.Tri5:setTopBottom( true, false, 0, 8 )
				self.Tri5:setAlpha( 0 )
				self.clipFinished( Tri5, {} )
				Tri4:completeAnimation()
				self.Tri4:setLeftRight( true, false, 59, 67 )
				self.Tri4:setTopBottom( true, false, 0, 8 )
				self.Tri4:setAlpha( 0 )
				self.clipFinished( Tri4, {} )
				Tri3:completeAnimation()
				self.Tri3:setLeftRight( true, false, 52, 60 )
				self.Tri3:setTopBottom( true, false, 0, 8 )
				self.Tri3:setAlpha( 0 )
				self.clipFinished( Tri3, {} )
				Tri2:completeAnimation()
				self.Tri2:setLeftRight( true, false, 45, 53 )
				self.Tri2:setTopBottom( true, false, 0, 8 )
				self.Tri2:setAlpha( 0 )
				self.clipFinished( Tri2, {} )
				Tri1:completeAnimation()
				self.Tri1:setLeftRight( true, false, 38, 46 )
				self.Tri1:setTopBottom( true, false, 0, 8 )
				self.Tri1:setAlpha( 1 )
				self.clipFinished( Tri1, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Rnd3",
			condition = function ( menu, element, event )
				return IsModelValueGreaterThanOrEqualTo( controller, "gameScore.roundsPlayed", 3 )
			end
		},
		{
			stateName = "Rnd2",
			condition = function ( menu, element, event )
				return IsModelValueGreaterThanOrEqualTo( controller, "gameScore.roundsPlayed", 2 )
			end
		},
		{
			stateName = "Rnd1",
			condition = function ( menu, element, event )
				return IsModelValueGreaterThanOrEqualTo( controller, "gameScore.roundsPlayed", 1 )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "gameScore.roundsPlayed" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "gameScore.roundsPlayed"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.Tri10:close()
		element.Tri9:close()
		element.Tri8:close()
		element.Tri7:close()
		element.Tri6:close()
		element.Tri5:close()
		element.Tri4:close()
		element.Tri3:close()
		element.Tri2:close()
		element.Tri1:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

