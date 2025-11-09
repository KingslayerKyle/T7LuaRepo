require( "ui.uieditor.widgets.CAC.CustomClassGridScreen.TacticalGrenade.TacticalGrenadeCardWidget_Internal" )
require( "ui.uieditor.widgets.Border" )

CoD.TacticalGrenadeCardWidget = InheritFrom( LUI.UIElement )
CoD.TacticalGrenadeCardWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.TacticalGrenadeCardWidget )
	self.id = "TacticalGrenadeCardWidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 263 )
	self:setTopBottom( true, false, 0, 116 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local mainItemCard = CoD.TacticalGrenadeCardWidget_Internal.new( menu, controller )
	mainItemCard:setLeftRight( true, false, 0, 263 )
	mainItemCard:setTopBottom( true, false, 0, 116 )
	mainItemCard:setRGB( 1, 1, 1 )
	mainItemCard:linkToElementModel( self, nil, false, function ( model )
		mainItemCard:setModel( model, controller )
	end )
	mainItemCard:mergeStateConditions( {
		{
			stateName = "Unequipped",
			condition = function ( menu, element, event )
				return not IsCACSlotEquipped( menu, element, controller )
			end
		}
	} )
	mainItemCard:linkToElementModel( mainItemCard, "itemIndex", true, function ( model )
		menu:updateElementState( mainItemCard, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "itemIndex"
		} )
	end )
	self:addElement( mainItemCard )
	self.mainItemCard = mainItemCard
	
	local groupNameLabel = LUI.UITightText.new()
	groupNameLabel:setLeftRight( true, false, 2, 106 )
	groupNameLabel:setTopBottom( true, false, 0, 25 )
	groupNameLabel:setRGB( 0.4, 0.44, 0.52 )
	groupNameLabel:setTTF( "fonts/default.ttf" )
	groupNameLabel:linkToElementModel( self, "headerName", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			groupNameLabel:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( groupNameLabel )
	self.groupNameLabel = groupNameLabel
	
	local border = CoD.Border.new( menu, controller )
	border:setLeftRight( true, true, 0, 0 )
	border:setTopBottom( true, true, 25, 0 )
	border:setRGB( 1, 0.41, 0 )
	border:setAlpha( 0 )
	self:addElement( border )
	self.border = border
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				mainItemCard:completeAnimation()
				self.mainItemCard:setZoom( 0 )
				self.clipFinished( mainItemCard, {} )
				border:completeAnimation()
				self.border:setAlpha( 0 )
				self.clipFinished( border, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 2 )
				mainItemCard:completeAnimation()
				self.mainItemCard:setZoom( 25 )
				self.clipFinished( mainItemCard, {} )
				border:completeAnimation()
				self.border:setAlpha( 1 )
				self.border:setZoom( 25 )
				self.clipFinished( border, {} )
			end,
			GainFocus = function ()
				self:setupElementClipCounter( 2 )
				local mainItemCardFrame2 = function ( mainItemCard, event )
					if not event.interrupted then
						mainItemCard:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
					end
					mainItemCard:setZoom( 25 )
					if event.interrupted then
						self.clipFinished( mainItemCard, event )
					else
						mainItemCard:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				mainItemCard:completeAnimation()
				self.mainItemCard:setZoom( 0 )
				mainItemCardFrame2( mainItemCard, {} )
				local borderFrame2 = function ( border, event )
					if not event.interrupted then
						border:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
					end
					border:setAlpha( 1 )
					border:setZoom( 25 )
					if event.interrupted then
						self.clipFinished( border, event )
					else
						border:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				border:completeAnimation()
				self.border:setAlpha( 1 )
				self.border:setZoom( 0 )
				borderFrame2( border, {} )
			end,
			LoseFocus = function ()
				self:setupElementClipCounter( 2 )
				local mainItemCardFrame2 = function ( mainItemCard, event )
					if not event.interrupted then
						mainItemCard:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
					end
					mainItemCard:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( mainItemCard, event )
					else
						mainItemCard:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				mainItemCard:completeAnimation()
				self.mainItemCard:setZoom( 25 )
				mainItemCardFrame2( mainItemCard, {} )
				local borderFrame2 = function ( border, event )
					if not event.interrupted then
						border:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
					end
					border:setAlpha( 0 )
					border:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( border, event )
					else
						border:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				border:completeAnimation()
				self.border:setAlpha( 1 )
				self.border:setZoom( 25 )
				borderFrame2( border, {} )
			end
		},
		BoxFocus = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				local mainItemCardFrame2 = function ( mainItemCard, event )
					if not event.interrupted then
						mainItemCard:beginAnimation( "keyframe", 303, false, false, CoD.TweenType.Linear )
					end
					mainItemCard:setZoom( 50 )
					if event.interrupted then
						self.clipFinished( mainItemCard, event )
					else
						mainItemCard:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				mainItemCard:completeAnimation()
				self.mainItemCard:setZoom( 0 )
				mainItemCardFrame2( mainItemCard, {} )
			end
		}
	}
	self.close = function ( self )
		self.mainItemCard:close()
		self.border:close()
		self.groupNameLabel:close()
		CoD.TacticalGrenadeCardWidget.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

