-- 1e48484be89dc0d4126fcc6197bdc973
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Effects.fxGlitch1_6" )
require( "ui.uieditor.widgets.Pregame.Pregame_Timer" )
require( "ui.uieditor.widgets.HUD.core_AmmoWidget.AmmoWidget_BackLine" )

CoD.Pregame_TimerOverlay = InheritFrom( LUI.UIElement )
CoD.Pregame_TimerOverlay.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.Pregame_TimerOverlay )
	self.id = "Pregame_TimerOverlay"
	self.soundSet = "CAC"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 720 )
	self.anyChildUsesUpdateState = true
	
	local fxGlitch1600 = CoD.fxGlitch1_6.new( menu, controller )
	fxGlitch1600:setLeftRight( true, false, 65.14, 547.86 )
	fxGlitch1600:setTopBottom( true, false, 81.5, 262.89 )
	fxGlitch1600:setAlpha( 0 )
	self:addElement( fxGlitch1600 )
	self.fxGlitch1600 = fxGlitch1600
	
	local PregameTimer = CoD.Pregame_Timer.new( menu, controller )
	PregameTimer:setLeftRight( true, false, 579.5, 700.5 )
	PregameTimer:setTopBottom( true, false, 623, 703 )
	PregameTimer:setAlpha( 0 )
	self:addElement( PregameTimer )
	self.PregameTimer = PregameTimer
	
	local LineBottom = CoD.AmmoWidget_BackLine.new( menu, controller )
	LineBottom:setLeftRight( true, false, 211.5, 243.5 )
	LineBottom:setTopBottom( true, false, 262.89, 265.89 )
	LineBottom:setAlpha( 0 )
	LineBottom:setZRot( -90 )
	self:addElement( LineBottom )
	self.LineBottom = LineBottom
	
	local LineTop = CoD.AmmoWidget_BackLine.new( menu, controller )
	LineTop:setLeftRight( true, false, 211.5, 243.5 )
	LineTop:setTopBottom( true, false, 94.89, 97.89 )
	LineTop:setAlpha( 0 )
	LineTop:setZRot( -90 )
	self:addElement( LineTop )
	self.LineTop = LineTop
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				PregameTimer:completeAnimation()
				self.PregameTimer:setAlpha( 0 )
				self.clipFinished( PregameTimer, {} )
			end
		},
		Hidden = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )

				fxGlitch1600:completeAnimation()
				self.fxGlitch1600:setAlpha( 0 )
				self.clipFinished( fxGlitch1600, {} )

				PregameTimer:completeAnimation()
				self.PregameTimer:setAlpha( 0 )
				self.clipFinished( PregameTimer, {} )

				LineBottom:completeAnimation()
				self.LineBottom:setAlpha( 0 )
				self.clipFinished( LineBottom, {} )

				LineTop:completeAnimation()
				self.LineTop:setAlpha( 0 )
				self.clipFinished( LineTop, {} )
			end
		},
		ChooseClass = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				local PregameTimerFrame2 = function ( PregameTimer, event )
					if not event.interrupted then
						PregameTimer:beginAnimation( "keyframe", 400, true, true, CoD.TweenType.Linear )
					end
					PregameTimer:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( PregameTimer, event )
					else
						PregameTimer:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				PregameTimer:completeAnimation()
				self.PregameTimer:setAlpha( 0 )
				PregameTimerFrame2( PregameTimer, {} )
			end
		},
		CustomClass = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				PregameTimer:completeAnimation()
				self.PregameTimer:setAlpha( 1 )
				self.clipFinished( PregameTimer, {} )
			end
		},
		WeaponSelect = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				PregameTimer:completeAnimation()
				self.PregameTimer:setAlpha( 1 )
				self.clipFinished( PregameTimer, {} )
			end
		},
		AttachmentSelect = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				PregameTimer:completeAnimation()
				self.PregameTimer:setAlpha( 1 )
				self.clipFinished( PregameTimer, {} )
			end
		},
		EquipmentSelect = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				PregameTimer:completeAnimation()
				self.PregameTimer:setAlpha( 1 )
				self.clipFinished( PregameTimer, {} )
			end
		},
		PerkSelect = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				PregameTimer:completeAnimation()
				self.PregameTimer:setAlpha( 1 )
				self.clipFinished( PregameTimer, {} )
			end
		},
		WildcardSelect = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				PregameTimer:completeAnimation()
				self.PregameTimer:setAlpha( 1 )
				self.clipFinished( PregameTimer, {} )
			end
		},
		OverCapacity = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				PregameTimer:completeAnimation()
				self.PregameTimer:setAlpha( 1 )
				self.clipFinished( PregameTimer, {} )
			end
		},
		CharacterSelect = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				PregameTimer:completeAnimation()
				self.PregameTimer:setAlpha( 1 )
				self.clipFinished( PregameTimer, {} )
			end
		},
		ScorestreakSelect = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				PregameTimer:completeAnimation()
				self.PregameTimer:setAlpha( 1 )
				self.clipFinished( PregameTimer, {} )
			end
		},
		BannedContent = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )

				local fxGlitch1600Frame2 = function ( fxGlitch1600, event )
					if not event.interrupted then
						fxGlitch1600:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
					end
					fxGlitch1600:setLeftRight( true, false, 55.14, 347.86 )
					fxGlitch1600:setTopBottom( true, false, 89.5, 225 )
					fxGlitch1600:setAlpha( 0.16 )
					if event.interrupted then
						self.clipFinished( fxGlitch1600, event )
					else
						fxGlitch1600:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				fxGlitch1600:completeAnimation()
				self.fxGlitch1600:setLeftRight( true, false, 55.14, 347.86 )
				self.fxGlitch1600:setTopBottom( true, false, 89.5, 225 )
				self.fxGlitch1600:setAlpha( 0 )
				fxGlitch1600Frame2( fxGlitch1600, {} )

				PregameTimer:completeAnimation()
				self.PregameTimer:setLeftRight( true, false, 144, 310 )
				self.PregameTimer:setTopBottom( true, false, 120, 230 )
				self.PregameTimer:setAlpha( 1 )
				self.clipFinished( PregameTimer, {} )

				LineBottom:completeAnimation()
				self.LineBottom:setLeftRight( true, false, 186.5, 218.5 )
				self.LineBottom:setTopBottom( true, false, 234.89, 237.89 )
				self.LineBottom:setAlpha( 1 )
				self.clipFinished( LineBottom, {} )

				LineTop:completeAnimation()
				self.LineTop:setLeftRight( true, false, 186.5, 218.5 )
				self.LineTop:setTopBottom( true, false, 81.89, 84.89 )
				self.LineTop:setAlpha( 1 )
				self.clipFinished( LineTop, {} )
			end
		},
		PregameVote = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				PregameTimer:completeAnimation()
				self.PregameTimer:setLeftRight( true, false, 65, 186 )
				self.PregameTimer:setTopBottom( true, false, 168, 248 )
				self.PregameTimer:setAlpha( 1 )
				self.clipFinished( PregameTimer, {} )
			end
		},
		ClassOptions = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				PregameTimer:completeAnimation()
				self.PregameTimer:setAlpha( 1 )
				self.clipFinished( PregameTimer, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "Hidden",
			condition = function ( menu, element, event )
				return not PregameActive()
			end
		},
		{
			stateName = "ChooseClass",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
		{
			stateName = "CustomClass",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
		{
			stateName = "WeaponSelect",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
		{
			stateName = "AttachmentSelect",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
		{
			stateName = "EquipmentSelect",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
		{
			stateName = "PerkSelect",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
		{
			stateName = "WildcardSelect",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
		{
			stateName = "OverCapacity",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
		{
			stateName = "CharacterSelect",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
		{
			stateName = "ScorestreakSelect",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
		{
			stateName = "BannedContent",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
		{
			stateName = "PregameVote",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
		{
			stateName = "ClassOptions",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.Pregame.state" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.Pregame.state"
		} )
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.fxGlitch1600:close()
		element.PregameTimer:close()
		element.LineBottom:close()
		element.LineTop:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
