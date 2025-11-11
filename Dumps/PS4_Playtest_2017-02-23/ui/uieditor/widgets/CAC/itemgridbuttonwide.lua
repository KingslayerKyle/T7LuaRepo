require( "ui.uieditor.widgets.Border" )
require( "ui.uieditor.widgets.CAC.ItemGridButtonWide_Internal" )

CoD.ItemGridButtonWide = InheritFrom( LUI.UIElement )
CoD.ItemGridButtonWide.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.ItemGridButtonWide )
	self.id = "ItemGridButtonWide"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 285 )
	self:setTopBottom( 0, 0, 0, 135 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local itemButtom = CoD.ItemGridButtonWide_Internal.new( menu, controller )
	itemButtom:mergeStateConditions( {
		{
			stateName = "Equipped",
			condition = function ( menu, element, event )
				return IsCACItemEquipped( menu, element, controller )
			end
		},
		{
			stateName = "MutuallyExclusive",
			condition = function ( menu, element, event )
				return IsCACItemMutuallyExclusiveWithSelection( element, controller )
			end
		}
	} )
	itemButtom:setLeftRight( 0, 0, -0.5, 284.5 )
	itemButtom:setTopBottom( 0, 0, 0.5, 135.5 )
	itemButtom:setZoom( 25 )
	self:addElement( itemButtom )
	self.itemButtom = itemButtom
	
	local border = CoD.Border.new( menu, controller )
	border:setLeftRight( 0, 1, 0, 0 )
	border:setTopBottom( 0, 1, 0, 0 )
	border:setRGB( 1, 0.41, 0 )
	border:setAlpha( 0 )
	border:setZoom( 25 )
	self:addElement( border )
	self.border = border
	
	self.itemButtom:linkToElementModel( self, "name", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			itemButtom.nameLabel:setText( Engine.Localize( modelValue ) )
		end
	end )
	self.itemButtom:linkToElementModel( self, "image", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			itemButtom.itemImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	self.resetProperties = function ()
		itemButtom:completeAnimation()
		border:completeAnimation()
		itemButtom:setZoom( 25 )
		border:setRGB( 1, 0.41, 0 )
		border:setAlpha( 0 )
		border:setZoom( 25 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				itemButtom:completeAnimation()
				self.itemButtom:setZoom( 0 )
				self.clipFinished( itemButtom, {} )
				border:completeAnimation()
				self.border:setZoom( 0 )
				self.clipFinished( border, {} )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				border:completeAnimation()
				self.border:setAlpha( 1 )
				self.clipFinished( border, {} )
			end,
			GainFocus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				local itemButtomFrame2 = function ( itemButtom, event )
					if not event.interrupted then
						itemButtom:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
					end
					itemButtom:setZoom( 25 )
					if event.interrupted then
						self.clipFinished( itemButtom, event )
					else
						itemButtom:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				itemButtom:completeAnimation()
				self.itemButtom:setZoom( 0 )
				itemButtomFrame2( itemButtom, {} )
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
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				local itemButtomFrame2 = function ( itemButtom, event )
					if not event.interrupted then
						itemButtom:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
					end
					itemButtom:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( itemButtom, event )
					else
						itemButtom:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				itemButtom:completeAnimation()
				self.itemButtom:setZoom( 25 )
				itemButtomFrame2( itemButtom, {} )
				local borderFrame2 = function ( border, event )
					if not event.interrupted then
						border:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
					end
					border:setRGB( 1, 0.41, 0 )
					border:setAlpha( 0 )
					border:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( border, event )
					else
						border:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				border:completeAnimation()
				self.border:setRGB( 1, 0.41, 0 )
				self.border:setAlpha( 1 )
				self.border:setZoom( 25 )
				borderFrame2( border, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.itemButtom:close()
		self.border:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

