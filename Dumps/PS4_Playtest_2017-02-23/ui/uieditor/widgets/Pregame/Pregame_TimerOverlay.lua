require( "ui.uieditor.widgets.Effects.fxGlitch1_6" )
require( "ui.uieditor.widgets.HUD.core_AmmoWidget.AmmoWidget_BackLine" )
require( "ui.uieditor.widgets.Pregame.Pregame_Timer" )

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
	self:setLeftRight( 0, 0, 0, 1920 )
	self:setTopBottom( 0, 0, 0, 1080 )
	self.anyChildUsesUpdateState = true
	
	local fxGlitch1600 = CoD.fxGlitch1_6.new( menu, controller )
	fxGlitch1600:setLeftRight( 0, 0, 98, 822 )
	fxGlitch1600:setTopBottom( 0, 0, 122, 394 )
	fxGlitch1600:setAlpha( 0 )
	self:addElement( fxGlitch1600 )
	self.fxGlitch1600 = fxGlitch1600
	
	local PregameTimer = CoD.Pregame_Timer.new( menu, controller )
	PregameTimer:setLeftRight( 0, 0, 869, 1051 )
	PregameTimer:setTopBottom( 0, 0, 934, 1054 )
	PregameTimer:setAlpha( 0 )
	self:addElement( PregameTimer )
	self.PregameTimer = PregameTimer
	
	local LineBottom = CoD.AmmoWidget_BackLine.new( menu, controller )
	LineBottom:setLeftRight( 0, 0, 317, 365 )
	LineBottom:setTopBottom( 0, 0, 395, 399 )
	LineBottom:setAlpha( 0 )
	LineBottom:setZRot( -90 )
	self:addElement( LineBottom )
	self.LineBottom = LineBottom
	
	local LineTop = CoD.AmmoWidget_BackLine.new( menu, controller )
	LineTop:setLeftRight( 0, 0, 317, 365 )
	LineTop:setTopBottom( 0, 0, 143, 147 )
	LineTop:setAlpha( 0 )
	LineTop:setZRot( -90 )
	self:addElement( LineTop )
	self.LineTop = LineTop
	
	self.resetProperties = function ()
		PregameTimer:completeAnimation()
		LineBottom:completeAnimation()
		LineTop:completeAnimation()
		fxGlitch1600:completeAnimation()
		PregameTimer:setLeftRight( 0, 0, 869, 1051 )
		PregameTimer:setTopBottom( 0, 0, 934, 1054 )
		PregameTimer:setAlpha( 0 )
		LineBottom:setLeftRight( 0, 0, 317, 365 )
		LineBottom:setTopBottom( 0, 0, 395, 399 )
		LineBottom:setAlpha( 0 )
		LineTop:setLeftRight( 0, 0, 317, 365 )
		LineTop:setTopBottom( 0, 0, 143, 147 )
		LineTop:setAlpha( 0 )
		fxGlitch1600:setLeftRight( 0, 0, 98, 822 )
		fxGlitch1600:setTopBottom( 0, 0, 122, 394 )
		fxGlitch1600:setAlpha( 0 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		},
		Hidden = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		},
		ChooseClass = {
			DefaultClip = function ()
				self.resetProperties()
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
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				PregameTimer:completeAnimation()
				self.PregameTimer:setAlpha( 1 )
				self.clipFinished( PregameTimer, {} )
			end
		},
		WeaponSelect = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				PregameTimer:completeAnimation()
				self.PregameTimer:setAlpha( 1 )
				self.clipFinished( PregameTimer, {} )
			end
		},
		AttachmentSelect = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				PregameTimer:completeAnimation()
				self.PregameTimer:setAlpha( 1 )
				self.clipFinished( PregameTimer, {} )
			end
		},
		EquipmentSelect = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				PregameTimer:completeAnimation()
				self.PregameTimer:setAlpha( 1 )
				self.clipFinished( PregameTimer, {} )
			end
		},
		PerkSelect = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				PregameTimer:completeAnimation()
				self.PregameTimer:setAlpha( 1 )
				self.clipFinished( PregameTimer, {} )
			end
		},
		WildcardSelect = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				PregameTimer:completeAnimation()
				self.PregameTimer:setAlpha( 1 )
				self.clipFinished( PregameTimer, {} )
			end
		},
		OverCapacity = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				PregameTimer:completeAnimation()
				self.PregameTimer:setAlpha( 1 )
				self.clipFinished( PregameTimer, {} )
			end
		},
		CharacterSelect = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				PregameTimer:completeAnimation()
				self.PregameTimer:setAlpha( 1 )
				self.clipFinished( PregameTimer, {} )
			end
		},
		ScorestreakSelect = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				PregameTimer:completeAnimation()
				self.PregameTimer:setAlpha( 1 )
				self.clipFinished( PregameTimer, {} )
			end
		},
		BannedContent = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 4 )
				local fxGlitch1600Frame2 = function ( fxGlitch1600, event )
					if not event.interrupted then
						fxGlitch1600:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
					end
					fxGlitch1600:setLeftRight( 0, 0, 82.5, 521.5 )
					fxGlitch1600:setTopBottom( 0, 0, 134.5, 337.5 )
					fxGlitch1600:setAlpha( 0.16 )
					if event.interrupted then
						self.clipFinished( fxGlitch1600, event )
					else
						fxGlitch1600:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				fxGlitch1600:completeAnimation()
				self.fxGlitch1600:setLeftRight( 0, 0, 82.5, 521.5 )
				self.fxGlitch1600:setTopBottom( 0, 0, 134.5, 337.5 )
				self.fxGlitch1600:setAlpha( 0 )
				fxGlitch1600Frame2( fxGlitch1600, {} )
				PregameTimer:completeAnimation()
				self.PregameTimer:setLeftRight( 0, 0, 215.5, 464.5 )
				self.PregameTimer:setTopBottom( 0, 0, 179.5, 344.5 )
				self.PregameTimer:setAlpha( 1 )
				self.clipFinished( PregameTimer, {} )
				LineBottom:completeAnimation()
				self.LineBottom:setLeftRight( 0, 0, 280, 328 )
				self.LineBottom:setTopBottom( 0, 0, 353, 357 )
				self.LineBottom:setAlpha( 1 )
				self.clipFinished( LineBottom, {} )
				LineTop:completeAnimation()
				self.LineTop:setLeftRight( 0, 0, 280, 328 )
				self.LineTop:setTopBottom( 0, 0, 123, 127 )
				self.LineTop:setAlpha( 1 )
				self.clipFinished( LineTop, {} )
			end
		},
		PregameVote = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				PregameTimer:completeAnimation()
				self.PregameTimer:setLeftRight( 0, 0, 97, 279 )
				self.PregameTimer:setTopBottom( 0, 0, 252, 372 )
				self.PregameTimer:setAlpha( 1 )
				self.clipFinished( PregameTimer, {} )
			end
		},
		ClassOptions = {
			DefaultClip = function ()
				self.resetProperties()
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.fxGlitch1600:close()
		self.PregameTimer:close()
		self.LineBottom:close()
		self.LineTop:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

